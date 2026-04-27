
%% Consumption tax to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 
addpath '/Users/avilipton/Documents/Dynare/6.2-x86_64/matlab'

clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('p',M_.endo_names,'exact'))*(oo_.steady_state(strmatch('c',M_.endo_names,'exact'))));
tau_c = (oo_.steady_state(strmatch('tau_c',M_.endo_names,'exact'))+x)*ones(20,1) - oo_.steady_state(strmatch('tau_c',M_.endo_names,'exact'));
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = data_table.tau_k(1)*ones(20,1);

g_c = data_table.g_c(1)*ones(20,1);
g_i = data_table.g_i(1)*ones(20,1) ;
tr = data_table.tr(1)*ones(20,1);
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_ct_ss.xlsx');



%% Labor tax to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('w',M_.endo_names,'exact'))*(1-omega)*(oo_.steady_state(strmatch('h_o',M_.endo_names,'exact'))));
tau_c = data_table.tau_n(1)*ones(20,1);
tau_n = (oo_.steady_state(strmatch('tau_n',M_.endo_names,'exact'))+x)*ones(20,1) - oo_.steady_state(strmatch('tau_n',M_.endo_names,'exact'));
tau_k = data_table.tau_k(1)*ones(20,1);

g_c = data_table.g_c(1)*ones(20,1);
g_i = data_table.g_i(1)*ones(20,1);
tr = data_table.tr(1)*ones(20,1);
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_nt_ss.xlsx');


%% Capital tax to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/((oo_.steady_state(strmatch('rK',M_.endo_names,'exact'))-delta)*oo_.steady_state(strmatch('k',M_.endo_names,'exact'))/a_ss);
tau_c = data_table.tau_c(1)*ones(20,1);
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = (oo_.steady_state(strmatch('tau_k',M_.endo_names,'exact'))+x)*ones(20,1) - oo_.steady_state(strmatch('tau_k',M_.endo_names,'exact'));


g_c = data_table.g_c(1)*ones(20,1);
g_i = data_table.g_i(1)*ones(20,1);
tr = data_table.tr(1)*ones(20,1);
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;



writetable(data_table,'../../data/analysis/estim_data_kt_ss.xlsx');





%% Drop in government consumption to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels

tau_c = data_table.tau_c(1)*ones(20,1);
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = data_table.tau_k(1)*ones(20,1);


x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('p',M_.endo_names,'exact'))*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact')));
g_c = (1-x)*(data_table.g_c(1)+oo_.steady_state(strmatch('g_c',M_.endo_names,'exact')))*ones(20,1) - oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = data_table.g_i(1)*ones(20,1) ;
tr = data_table.tr(1)*ones(20,1);
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_g_c_ss.xlsx');






%% Drop in government investment to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels

tau_c = data_table.tau_c(1)*ones(20,1);
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = data_table.tau_k(1)*ones(20,1);

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('p',M_.endo_names,'exact'))*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact')));
g_c = data_table.g_c(1)*ones(20,1) ;
g_i = (1-x)*(data_table.g_i(1)+oo_.steady_state(strmatch('g_i',M_.endo_names,'exact')))*ones(20,1) - oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = data_table.tr(1)*ones(20,1);
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_g_i_ss.xlsx');


%% Drop in transfers to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels

tau_c = data_table.tau_c(1)*ones(20,1);
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = data_table.tau_k(1)*ones(20,1);

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
g_c = data_table.g_c(1)*ones(20,1) ;
g_i = data_table.g_i(1)*ones(20,1) ;
tr = (1-x)*(data_table.tr(1)+oo_.steady_state(strmatch('tr',M_.endo_names,'exact')))*ones(20,1) - oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = data_table.o_revenue(1)*ones(20,1);

data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_tr_ss.xlsx');



%% Increase in oil price to lower defecit by 1 percentage point of GDP in steady state, all else constant scenario 


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(20,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

% set taxes and spending levels

tau_c = data_table.tau_c(1)*ones(20,1);
tau_n = data_table.tau_n(1)*ones(20,1);
tau_k = data_table.tau_k(1)*ones(20,1);

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));
g_c = data_table.g_c(1)*ones(20,1) ;
g_i = data_table.g_i(1)*ones(20,1) ;
tr = data_table.tr(1)*ones(20,1);
o_revenue = (1+x)*(data_table.o_revenue(1)+oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact')))*ones(20,1) - oo_.steady_state(strmatch('o_revenue', M_.endo_names,'exact'));


data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;

data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_oil_ss.xlsx');

%% IMF Fiscal Consolidation Plan


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(24,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;
data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;




writetable(data_table,'../../data/analysis/estim_data_IMF_ss.xlsx');


return;




%% IMF Fiscal Consolidation Plan More Oil Revenue


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(24,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue_up/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;
data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;


writetable(data_table,'../../data/analysis/estim_data_IMF_ss_up.xlsx');


return;




%% IMF Fiscal Consolidation Plan Less Oil Revenue


clear all;clc;close all;
dynare SOE_simulations.mod

endo_names = cellstr(M_.endo_names);
vars_initial = zeros(1,length(endo_names));



vars = [vars_initial;nan(24,length(endo_names))];

data_table = array2table(vars,'VariableNames',endo_names');

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue_down/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



data_table.tau_c(2:end) = tau_c;
data_table.tau_n(2:end) = tau_n;
data_table.tau_k(2:end) = tau_k;
data_table.g_c(2:end) = g_c;
data_table.g_i(2:end) = g_i;
data_table.tr(2:end) = tr;
data_table.o_revenue(2:end) = o_revenue;




writetable(data_table,'../../data/analysis/estim_data_IMF_ss_down.xlsx');


return;






% %% IMF Consolidation via Revenue Only
% 
% clear all;clc;close all;
% addpath '/opt/dynare/4.5.6/lib/dynare/matlab';
% dynare SOE_simulations.mod
% 
% endo_names = cellstr(M_.endo_names);
% vars_initial = zeros(1,length(endo_names));
% 
% 
% 
% vars = [vars_initial;nan(24,length(endo_names))];
% 
% data_table = array2table(vars,'VariableNames',endo_names');
% 
% 
% % Set each instrument to achieve one third of the deficit/gdp reduction
% % implied by the IMF consolidation
% 
% load('IMF_path')
% 
% 
% tau_c_y = imf_PB_gdp/3;
% tau_n_y = imf_PB_gdp/3;
% tau_k_y = imf_PB_gdp/3;
% 
% g_c = zeros(24,1);
% g_i = zeros(24,1);
% tr = zeros(24,1);
% 
% 
% 
% data_table.tau_c_y(2:end) = tau_c_y;
% data_table.tau_n_y(2:end) = tau_n_y;
% data_table.tau_k_y(2:end) = tau_k_y;
% data_table.g_c(2:end) = g_c;
% data_table.g_i(2:end) = g_i;
% data_table.tr(2:end) = tr;
% 
% 
% writetable(data_table,'/mq/manuel_projects/SOEM_EC/data/estim_data_IMF_revenue.xlsx');
% 
% 
% 
% 
% %% IMF Consolidation via Spending Only
% 
% clear all;clc;close all;
% addpath '/opt/dynare/4.5.6/lib/dynare/matlab';
% dynare SOE_simulations.mod
% 
% endo_names = cellstr(M_.endo_names);
% vars_initial = zeros(1,length(endo_names));
% 
% 
% 
% vars = [vars_initial;nan(24,length(endo_names))];
% 
% data_table = array2table(vars,'VariableNames',endo_names');
% 
% 
% % Set each instrument to achieve one third of the deficit/gdp reduction
% % implied by the IMF consolidation
% 
% load('IMF_path')
% 
% 
% g_c_y = -imf_PB_gdp/3;
% g_i_y = -imf_PB_gdp/3;
% tr_y = -imf_PB_gdp/3;
% 
% tau_c = zeros(24,1);
% tau_n = zeros(24,1);
% tau_k = zeros(24,1);
% 
% 
% 
% data_table.tau_c(2:end) = tau_c;
% data_table.tau_n(2:end) = tau_n;
% data_table.tau_k(2:end) = tau_k;
% data_table.g_c_y(2:end) = g_c_y;
% data_table.g_i_y(2:end) = g_i_y;
% data_table.tr_y(2:end) = tr_y;
% 
% 
% writetable(data_table,'/mq/manuel_projects/SOEM_EC/data/estim_data_IMF_spending.xlsx');












