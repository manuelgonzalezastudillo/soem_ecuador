%% This code produces a quarterly estimate of government investment using
% the annual data and the quarterly data from the government finances.
%
% Manuel Gonzalez-Astudillo
% 6/8/21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;
%% Load data from Excel
[data_q,txt_q] = xlsread('/mq/manuel_projects/SOEM_EC/data/data.xlsx','quarterly'); % 2000:Q1 - 2019:Q4
[data_m,txt_m] = xlsread('/mq/manuel_projects/SOEM_EC/data/data.xlsx','monthly');   % 2000:m1 - 2019:m12
[data_a,txt_a] = xlsread('/mq/manuel_projects/SOEM_EC/data/data.xlsx','annual');    % 2000 - 2019

%% Specify dates
years = (2000:1:2019)';
t1 = datetime(years(1),3,1);
t2 = datetime(years(end),1,1);
tt = datenum(t1:calmonths(3):t2)';

%% Obtaining quarterly and annual data
data_iq = movsum(data_m(:,7),[2 0]);                            % government investment from government finances from monthly to quarterly
data_iq = data_iq(3:3:end);
data_ia = data_a(:,2);                                          % government investment from national accounts annual

delta_iq = 100*(data_iq(5:end)./data_iq(1:end-4)-1);            % annual growth rates 2001:Q1 - 2019:Q4
delta_iqd = [delta_iq(1:4*14)-mean(delta_iq(1:4*14));delta_iq(4*14+1:end)-mean(delta_iq(4*14+1:end))];
delta_ia = nan(size(delta_iq));
delta_ia((4:4:end)) = 100*(data_ia(2:end)./data_ia(1:end-1)-1); % annual growth rates 2001 - 2019
delta_iad = [delta_ia(1:14)-mean(delta_ia(1:4*14),'omitnan');delta_ia(15:end)-mean(delta_ia(4*14+1:end),'omitnan')];

T = length(delta_ia);
%% Setting up state space model
Mdl = arima(4,0,0);
EstMdl = estimate(Mdl,zscore(delta_iq));
% resid = infer(EstMdl,zscore(delta_iq));
% yhat = zscore(delta_iq)-resid;
% plot((2001:0.25:2019.75)',[zscore(delta_iq) yhat])
param0 = [11.64;1;sqrt(EstMdl.Variance);cell2mat(EstMdl.AR)';24.1005;-11.5456];             % beta, sigma_e, sigma_epsilon, phi_1, phi_2, phi_3, phi_4, mu_1, mu_2
Mdl = ssm(@(param)ssmodel(param,T));
Y = [zscore(delta_iq) delta_ia];
Options = optimoptions(@fminunc,'MaxFunEvals',100000,'OptimalityTolerance',0.00000001,'StepTolerance',0.00000001,'FiniteDifferenceStepSize',0.00000001);
[EstMdl,estParams,EstParamCov,logL,Output] = estimate(Mdl,Y,param0,'Display','full','Options',Options);
X = smooth(EstMdl,Y);