%% This code produces the results for the paper's tables and figures
clc; clear;

%% Load results from calibrated model with posterior mean results
load("SOE_Decomposition_prior_results.mat")

%% Obtain theoretical moments
% gam_YNCo : 59
% gam_C    : 61
% gam_I    : 62
% ratio_TBY: 66
% hours    : 17
% gam_G    : 63
% gam_Ig   : 64
% gam_TR   : 68
% xi       : 35
% pCostar  : 55
% yCo      : 54
% Rstar    : 56
% y_star   : 57

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
data = readtable('/mq/manuel_projects/SOEM_EC/data/estim_data.xlsx');
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

%% Obtain variance decomposition
% Variables
% gama_YNCo_obs : 71
% gam_C_obs     : 72
% gam_I_obs     : 73
% gam_G_obs     : 77
% ratio_TBY_obs : 83
% ratio_BY_obs  : 78
% ratio_FY_obs  : 84
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

Technology = sum(oo_.variance_decomposition(:,Technology_id),2);
Foreign = sum(oo_.variance_decomposition(:,Foreign_id),2);
Oil = sum(oo_.variance_decomposition(:,Oil_id),2);
Risk = sum(oo_.variance_decomposition(:,Risk_id),2);
Preference = sum(oo_.variance_decomposition(:,Preference_id),2);
Fiscal = sum(oo_.variance_decomposition(:,Fiscal_id),2);
vars_id = [70;71;72;76;82;77];
vardecomp_table = array2table(round([Technology(70:83) Foreign(70:83) Oil(70:83) Risk(70:83) Preference(70:83) Fiscal(70:83)],2),...
                              'VariableNames',group_names,'RowNames',oo_.var_list(70:83));