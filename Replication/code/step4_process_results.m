%% This code produces the results for the paper's tables and figures
clc; clear;

%% Load results from calibrated model with posterior mean results
load("SOE_Decomposition_results.mat")

%% Obtain theoretical moments
% gam_YNCo : 59
% gam_C    : 61
% gam_I    : 62
% ratio_TBY: 66
% hours    : 17
% gam_G    : 63
% gam_Ig   : 64
% gam_TR   : 68
% ratio_BY : 65
% ratio_FY : 69
% xi       : 35
% pCostar  : 55
% yCo      : 54
% Rstar    : 56
% y_star   : 57
% gama_YNCo: 71

vars_id = [59;61;62;66;17;63;64;68;35;55;54;56;57];
varlist = oo_.var_list(vars_id);

% extract relevant entries of variance-covariance matrix
vc_matrix = oo_.var(vars_id,vars_id);
cov1_matrix = oo_.gamma_y{2,1}(vars_id,vars_id);
corr_y_matrix = (diag(sqrt(diag(vc_matrix)))\vc_matrix)/diag(sqrt(diag(vc_matrix)));

ar1_vars = diag(cov1_matrix);
sd_vars = 100*sqrt(diag(vc_matrix));
corr_y_vars = corr_y_matrix(:,1);

%% Obtain empirical moments
% gam_YNCo : 1
% gam_C    : 2
% gam_I    : 3
% ratio_TBY: 12
% hours    : 17
% gam_G    : 7
% gam_Ig   : 9
% gam_TR   : 8
% ratio_BY : 10
% ratio_FY : 11
% xi       : 4
% pCostar  : 5
% yCo      : 6
% Rstar    : 14
% y_star   : 15
% gam_YNCo_obs,gam_C_obs,gam_I_obs,xi_obs,pCostar_obs,YCo_obs,...
%                gam_G_obs,gam_TR_obs,gam_Ig_obs,...
%                ratio_BY_obs,ratio_TBY_obs,gam_rer_obs,...
%                Rstar_obs,Ystar_obs,G_obs,hours_obs,gama_YNCo_obs
data_id = [1;2;3;12;17;7;9;8;4;5;6;14;15];
data = readtable('../data/estim_data.xlsx');
data = table2array(data);
data = data(:,data_id);
data = array2table(data,'VariableNames',varlist);
data_array = table2array(data);
sd_data = std(data_array,0,'omitnan')';
corr_y_data = zeros(length(data_id),1);
for i = 1:length(data_id)
    aaa = corrcoef(data_array(:,1),data_array(:,i),'Rows','pairwise');
    corr_y_data(i) = aaa(2,1);
end
ar1_data = zeros(length(data_id),1);
for i = 1:length(data_id)
    aaa = corrcoef(data_array(2:end,i),data_array(1:end-1,i),'Rows','pairwise');
    ar1_data(i) = aaa(2,1);
end

%% Obtain report in table
results_array = [corr_y_data corr_y_vars sd_data sd_vars ar1_data ar1_vars];
variable_names = {'corr_y_data', 'corr_y_var', 'sd_data', 'sd_vars', 'ar1_data', 'ar1_vars'};
results_table = array2table(results_array,'VariableNames',variable_names, 'RowNames', varlist);

% %% Obtain variance decomposition observation equation variables
% % Variables
% % gam_YNCo_obs  : 70
% % gam_C_obs     : 72
% % gam_I_obs     : 73
% % ratio_TBY_obs : 82
% % hours_obs     : 83
% % gam_G_obs     : 77
% % gam_Ig_obs    : 80
% % gam_TR_obs    : 81
% % xi_obs        : 74
% 
% %
% % Shock groups
% % Technology  = eps_u (3), eps_z (4), eps_a (5);
% % Foreign = eps_Rstar (8), eps_y_star (10);
% % Oil = eps_pCostar (9), eps_yCo (7);
% % Risk = eps_zeta (6);
% % Preference = eps_v (1), eps_kappa (2);
% % Fiscal = eps_g_c (11), eps_g_i (12), eps_TR (13);
% group_names = {'Technology','Foreign','Oil','Risk','Preference','Fiscal','Measurement'};
% Technology_id = [3 4 5];
% Foreign_id = [8 10];
% Oil_id = [9 7];
% Risk_id = 6;
% Preference_id = [1 2];
% Fiscal_id = [11 12 13];
% Measurement_id = (14:27);
% 
% Technology = sum(oo_.variance_decomposition(:,Technology_id),2);
% Foreign = sum(oo_.variance_decomposition(:,Foreign_id),2);
% Oil = sum(oo_.variance_decomposition(:,Oil_id),2);
% Risk = sum(oo_.variance_decomposition(:,Risk_id),2);
% Preference = sum(oo_.variance_decomposition(:,Preference_id),2);
% Fiscal = sum(oo_.variance_decomposition(:,Fiscal_id),2);
% Measurement = sum(oo_.variance_decomposition(:,Measurement_id),2);
% vardecomp_table = array2table(round([Technology(70:83) Foreign(70:83) Oil(70:83) Risk(70:83) Preference(70:83) Fiscal(70:83) Measurement(70:83)],2),...
%                               'VariableNames',group_names,'RowNames',oo_.var_list(70:83));

%% Obtain variance decomposition for variables without measurement error
% Variables
% gam_YNCo  : 59
% gam_C     : 61
% gam_I     : 62
% ratio_TBY : 66
% hours     : 17
% gam_G     : 63
% gam_Ig    : 64
% gam_TR    : 68
% xi        : 35
var_index = [59 61 62 66 17 63 64 68 35];
%
% Shock groups
% Technology  = eps_u (3), eps_z (4), eps_a (5);
% Foreign = eps_Rstar (8), eps_y_star (10);
% Oil = eps_pCostar (9), eps_yCo (7);
% Risk = eps_zeta (6);
% Preference = eps_v (1), eps_kappa (2);
% Fiscal = eps_g_c (11), eps_g_i (12), eps_TR (13);
group_names = {'Technology','Foreign','Oil','Risk','Preference','Fiscal'};
Technology_id = [3 4 5];
Foreign_id = [8 10];
Oil_id = [9 7];
Risk_id = 6;
Preference_id = [1 2];
Fiscal_id = [11 12 13];
Measurement_id = (14:27);

Technology = sum(oo_.variance_decomposition(:,Technology_id),2);
Foreign = sum(oo_.variance_decomposition(:,Foreign_id),2);
Oil = sum(oo_.variance_decomposition(:,Oil_id),2);
Risk = sum(oo_.variance_decomposition(:,Risk_id),2);
Preference = sum(oo_.variance_decomposition(:,Preference_id),2);
Fiscal = sum(oo_.variance_decomposition(:,Fiscal_id),2);
Measurement = sum(oo_.variance_decomposition(:,Measurement_id),2);
vardecomp_table_nome = array2table(round([Technology(var_index) Foreign(var_index) Oil(var_index) Risk(var_index) Preference(var_index) Fiscal(var_index)],2),...
                              'VariableNames',group_names,'RowNames',oo_.var_list(var_index));

%% Plot shock decomposition
% Create output directory if it doesn't exist
if ~exist('../output/figures', 'dir')
    mkdir('../output/figures');
end
dir  = '../output/figures/';
shockdecomparrayvars = oo_.shock_decomposition(70:83,:,:);
shockdecomparray = [sum(shockdecomparrayvars(:,Technology_id,:),2) sum(shockdecomparrayvars(:,Foreign_id,:),2) sum(shockdecomparrayvars(:,Oil_id,:),2)...
                    sum(shockdecomparrayvars(:,Risk_id,:),2) sum(shockdecomparrayvars(:,Preference_id,:),2) sum(shockdecomparrayvars(:,Fiscal_id,:),2)];
smoothobserved = squeeze(oo_.shock_decomposition(70:83,end,:))';
observedvars = M_.endo_names(70:83);
observedvars_names = {'QoQ %\Delta Non-oil GDP (percent)','YoY %\Delta Non-oil GDP (percent)','QoQ %\Delta Private consumption (percent)',...
                      'QoQ %\Delta Total investment (percent)','EMBI (p.p.)','Oil price','QoQ %\Delta Oil production (percent)',...
                      'QoQ %\Delta Government consumption (percent)','External interest rate (p.p)',...
                      'World GDP','QoQ %\Delta Government investment (percent)','QoQ %\Delta Government transfers (percent)',...
                      'Trade balance-to-GDP ratio (p.p.)','Hours worked'};
tt = (2004:0.25:2019.75);
for i = 1:size(shockdecomparray,1)
    fig = figure;
    axes1 = axes('Parent',fig);
    hold(axes1,'on');
    plotarray = squeeze(shockdecomparray(i,:,:))';
    plotarrayneg = plotarray;
    plotarrayneg(plotarrayneg>0) = 0;
    plotarraypos = plotarray;
    plotarraypos(plotarraypos<0) = 0;
    bar1 = bar(tt,plotarrayneg,'EdgeColor','none','BarLayout','stacked','BaseValue',0,...
        'Parent',axes1);
        set(bar1(6),'DisplayName','Fiscal policy','BarWidth',0.9,'FaceColor',[0.301 0.745 0.933]);
        set(bar1(5),'DisplayName','Household preferences','BarWidth',0.9,'FaceColor',[0.466 0.674 0.188]);
        set(bar1(4),'DisplayName','Country risk','BarWidth',0.9,'FaceColor',[0.929 0.694 0.125]);
        set(bar1(3),'DisplayName','Oil price and quantity','BarWidth',0.9,...
            'FaceColor',[0.501960784313725 0.501960784313725 0.501960784313725]);
        set(bar1(2),'DisplayName','Foreign variables','BarWidth',0.9,'FaceColor',[0.85 0.325 0.098]);
        set(bar1(1),'DisplayName','Technology related','BarWidth',0.9,'FaceColor',[0 0.447 0.741]);
    bar2 = bar(tt,plotarraypos,'EdgeColor','none','BarLayout','stacked','BaseValue',0,...
        'Parent',axes1);
        set(bar2(6),'HandleVisibility','off','BarWidth',0.9,'FaceColor',[0.301 0.745 0.933]);
        set(bar2(5),'HandleVisibility','off','BarWidth',0.9,'FaceColor',[0.466 0.674 0.188]);
        set(bar2(4),'HandleVisibility','off','BarWidth',0.9,'FaceColor',[0.929 0.694 0.125]);
        set(bar2(3),'HandleVisibility','off','BarWidth',0.9,...
            'FaceColor',[0.501960784313725 0.501960784313725 0.501960784313725]);
        set(bar2(2),'HandleVisibility','off','BarWidth',0.9,'FaceColor',[0.85 0.325 0.098]);
        set(bar2(1),'HandleVisibility','off','BarWidth',0.9,'FaceColor',[0 0.447 0.741]);
    plot(tt,smoothobserved(:,i),'DisplayName',string(observedvars_names(i)),'LineWidth',3,'Color',[0 0 0]);
        xlim(axes1,[2003.75 2020]);
        box(axes1,'on');
        set(axes1,'FontSize',16);
    legend1 = legend(axes1,'show');
    set(legend1,'FontSize',16,'EdgeColor','none');
    
    set(fig,'PaperOrientation','Landscape');
    set(fig,'PaperPosition',[0 0 15 9]);
    print(fig,'-depsc',strcat(dir,observedvars{i})); 
end

%% Other results (plot implied government debt to contrast with data)
figure44 = figure;
% define change in debt-to-gdp ratio
Delta_b_model = 100*(oo_.SmoothedVariables.ratio_BY-oo_.steady_state(45)*(1-1/oo_.steady_state(52))/oo_.steady_state(24));

% Load data from Excel
[data_q,txt_q] = xlsread('../data/data.xlsx','quarterly','A1:S81'); % 2000:Q1 - 2019Q4
[data_m,txt_m] = xlsread('../data/data.xlsx','monthly');   % 2000:m1 - 2019:m12
[data_a,txt_a] = xlsread('../data/data.xlsx','annual');    % 2000 - 2019

% Make monthly data quarterly
data_mq(:,2:4) = movmean(data_m(:,2:4),[2 0]);         % rstar, oil price, embi        
data_mq(:,5:7) = data_m(:,13:15);                      % debt stock
data_mq(:,8) = movmean(data_m(:,16),[2 0]);            % real exchange rate
data_mq(:,9) = 3*movmean(data_m(:,17),[2 0]);          % oil production
data_q = [data_q data_mq((3:3:end)',2:end)];

% Put everything in terms of US goods except for oil quantities which is in terms of barrels of oil
data_q(:,[1 2 3 4 5 8 9 11 12 13 20 22:24]) = data_q(:,[1 2 3 4 5 8 9 11 12 13 20 22:24])./(data_q(:,10)/100);

% Make table with data
var_names = [txt_q(1,2:end) txt_m(1,1:3) txt_m(1,12:16)];
data_table = array2table(data_q,'VariableNames',var_names,'RowNames',txt_q(2:end,1));

Delta_b_data = 100000*(data_table.Public_externaldebt(17:end)+data_table.Public_internaldebt(17:end)  - (data_table.Public_externaldebt(16:end-1)+data_table.Public_internaldebt(16:end-1)))./(4*data_table.GDP(17:end));
initial_debt = mean(100000*(data_table.Public_externaldebt(13:16)+data_table.Public_internaldebt(13:16))./(4*data_table.GDP(13:16)));

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot1 = plot(tt',[initial_debt+cumsum(Delta_b_data-mean(Delta_b_data,'omitnan')) initial_debt+cumsum(Delta_b_model/4)]);
set(plot1(1),'DisplayName','Debt-to-GDP ratio data');
set(plot1(2),'DisplayName','Debt-to-GDP ratio model');
ylabel('Percent');
box(axes1,'on');
hold(axes1,'off');
legend(axes1,'show');

%% Plot output gap
figure2 = figure;
axes2 = axes('Parent',figure2);
hold on;
plot(tt',100*(oo_.SmoothedVariables.y/oo_.steady_state(24)-1),'DisplayName','Output gap');
plot(tt',zeros(length(tt),1));
ylabel('Percent');
box(axes2,'on');
hold(axes2,'off');
legend(axes2,'show');