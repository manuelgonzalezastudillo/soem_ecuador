
addpath '/Users/avilipton/Documents/Dynare/6.2-x86_64/matlab'

%% IRF Consumption Tax
clear
% Get state space form of the constrained model 
% Dynare's state space is X_t = oo_.dr.ghx*S_{t-1} + oo_.dr.ghu*e_t where 
% X is all model variables
% The form we want is (X_t = A*X_{t-1} + B*e_t;Y_t=C*S_{t} 
% where S_t is a vector of state variables
% Y_t is a vector of fiscal variables which we treat as observables,
% and e_t is a vector of fiscal shocks
% Y = (tau_c, tau_n, tau_k, g_c, g_i, tr)'
dynare SOE_simulations.mod 
A = zeros(length(M_.endo_names),length(M_.endo_names));

% Loop through oo_.dr.order_var which lists variables in DR order,
% indetifying them by their declaration order to build the full A matrix in
% dr order
for ii = 1:length(M_.endo_names)
    if any(oo_.dr.state_var == oo_.dr.order_var(ii))
       state_policy_order = find(oo_.dr.state_var == oo_.dr.order_var(ii));
       A(:,ii) = oo_.dr.ghx(:,state_policy_order);
        
    end   
end

B = oo_.dr.ghu;
C = zeros(7,length(M_.endo_names));

tau_c_S = oo_.dr.inv_order_var(strmatch('tau_c',M_.endo_names,'exact'));
tau_n_S = oo_.dr.inv_order_var(strmatch('tau_n',M_.endo_names,'exact'));
tau_k_S =oo_.dr.inv_order_var(strmatch('tau_k',M_.endo_names,'exact'));
g_c_S = oo_.dr.inv_order_var(strmatch('g_c',M_.endo_names,'exact'));
g_i_S = oo_.dr.inv_order_var(strmatch('g_i',M_.endo_names,'exact'));
tr_S = oo_.dr.inv_order_var(strmatch('tr',M_.endo_names,'exact'));
o_revenue_S = oo_.dr.inv_order_var(strmatch('o_revenue',M_.endo_names,'exact'));


C(1,tau_c_S) = 1;
C(2,tau_n_S) = 1;
C(3,tau_k_S) = 1;
C(4,g_c_S) = 1;
C(5,g_i_S) = 1;
C(6,tr_S) = 1;
C(7,o_revenue_S) = 1;

D = zeros(7,7);

% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_ct_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_c','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Consumption Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   

end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Consumption_Tax_IRF','-depsc')

%% IRF Labor Tax
clearvars -except A B C D
dynare SOE_simulations.mod

% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_nt_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_n','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Labor Income Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   


end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Labor_Tax_IRF','-depsc')

%% IRF Capital Tax
clearvars -except A B C D
dynare SOE_simulations.mod


% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_kt_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_k','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Capital Income Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};
plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   

end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Capital_Tax_IRF','-depsc')


%% IRF Government Consumption
clearvars -except A B C D
dynare SOE_simulations.mod
% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_g_c_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','g_c_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Government Consumption/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0);
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   

end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Government_Consumption_IRF','-depsc')


%% IRF Government Investment
clearvars -except A B C D
dynare SOE_simulations.mod


% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_g_i_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','g_i_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Government Investment/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   


end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Government_Investment_IRF','-depsc')



%% IRF Transfers
clearvars -except A B C D
dynare SOE_simulations.mod


% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_tr_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tr_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Transfers/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   

end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Government_Transfers_IRF','-depsc')




%% IRF Oil Revenue
clearvars -except A B C D
dynare SOE_simulations.mod

% Run the conditional forecast for the policy scenario
Y = readtable("../../data/analysis/estim_data_oil_ss.xlsx");
Y = [Y.tau_c(2:21) Y.tau_n(2:21) Y.tau_k(2:21) Y.g_c(2:21) Y.g_i(2:21) Y.tr(2:21) Y.o_revenue(2:21)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','oR_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Oil Revenue/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Optimizer Consumption',...
        'Restricted Consumption','Optimizer Hours','Restricted Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = X_1(1:20,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:20,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:20,-1*ones(20,1),'r','Linewidth',0.5); hold on
    end   

end

% fig = figure(1);
% set(fig,'PaperPosition',[0 0 8 8]);
print('Oil_revenue_IRF','-depsc')



%% IMF Simulations
clearvars -except A B C D
dynare SOE_simulations.mod

% Baseline

% Run the conditional forecast for the policy scenario
Y = readtable('../../data/analysis/estim_data_IMF_ss.xlsx');
Y = [Y.tau_c(2:25) Y.tau_n(2:25) Y.tau_k(2:25) Y.g_c(2:25) Y.g_i(2:25) Y.tr(2:25) Y.o_revenue(2:25)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Optimizer Consumption ','Restricted Consumption','Optimizer Hours','Restricted Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
hold on
for ii = 1:length(all_vars)
    a = X_1(1:24,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
      
end



% High Oil

% Run the conditional forecast for the policy scenario
Y = readtable('../../data/analysis/estim_data_IMF_ss_up.xlsx');
Y = [Y.tau_c(2:25) Y.tau_n(2:25) Y.tau_k(2:25) Y.g_c(2:25) Y.g_i(2:25) Y.tr(2:25) Y.o_revenue(2:25)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Optimizer Consumption ','Restricted Consumption','Optimizer Hours','Restricted Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=2;
for ii = 1:length(all_vars)
    a = X_1(1:24,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), '--', 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10), '--', 'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
      
end




% Low Oil

% Run the conditional forecast for the policy scenario
Y = readtable('../../data/analysis/estim_data_IMF_ss_down.xlsx');
Y = [Y.tau_c(2:25) Y.tau_n(2:25) Y.tau_k(2:25) Y.g_c(2:25) Y.g_i(2:25) Y.tr(2:25) Y.o_revenue(2:25)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);


% Plots (every variable can be interpreted in terms of the final good)
all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Optimizer Consumption ','Restricted Consumption','Optimizer Hours','Restricted Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=3;
for ii = 1:length(all_vars)
    a = X_1(1:24,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), ':', 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10), ':', 'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
      
end


print('IMF_Simulation','-depsc')


%% IMF Fiscal Consolidation Plan Rigid Real Rate
clear 

% Baseline
dynare SOE_simulations.mod

A = zeros(length(M_.endo_names),length(M_.endo_names));

% Loop through oo_.dr.order_var which lists variables in DR order,
% indetifying them by their declaration order to build the full A matrix in
% dr order
for ii = 1:length(M_.endo_names)
    if any(oo_.dr.state_var == oo_.dr.order_var(ii))
       state_policy_order = find(oo_.dr.state_var == oo_.dr.order_var(ii));
       A(:,ii) = oo_.dr.ghx(:,state_policy_order);
        
    end   
end

B = oo_.dr.ghu;
C = zeros(7,length(M_.endo_names));

tau_c_S = oo_.dr.inv_order_var(strmatch('tau_c',M_.endo_names,'exact'));
tau_n_S = oo_.dr.inv_order_var(strmatch('tau_n',M_.endo_names,'exact'));
tau_k_S =oo_.dr.inv_order_var(strmatch('tau_k',M_.endo_names,'exact'));
g_c_S = oo_.dr.inv_order_var(strmatch('g_c',M_.endo_names,'exact'));
g_i_S = oo_.dr.inv_order_var(strmatch('g_i',M_.endo_names,'exact'));
tr_S = oo_.dr.inv_order_var(strmatch('tr',M_.endo_names,'exact'));
o_revenue_S = oo_.dr.inv_order_var(strmatch('o_revenue',M_.endo_names,'exact'));


C(1,tau_c_S) = 1;
C(2,tau_n_S) = 1;
C(3,tau_k_S) = 1;
C(4,g_c_S) = 1;
C(5,g_i_S) = 1;
C(6,tr_S) = 1;
C(7,o_revenue_S) = 1;

D = zeros(7,7);

% Run the conditional forecast for the policy scenario
Y = readtable('../../data/analysis/estim_data_IMF_ss.xlsx');
Y = [Y.tau_c(2:25) Y.tau_n(2:25) Y.tau_k(2:25) Y.g_c(2:25) Y.g_i(2:25) Y.tr(2:25) Y.o_revenue(2:25)];
mdl = ssm(A,B,C,D,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_1 = smooth(mdl,Y);



% Rigid pass through

dynare SOE_simulations_rigid.mod
A1 = zeros(length(M_.endo_names),length(M_.endo_names));

% Loop through oo_.dr.order_var which lists variables in DR order,
% indetifying them by their declaration order to build the full A matrix in
% dr order
for ii = 1:length(M_.endo_names)
    if any(oo_.dr.state_var == oo_.dr.order_var(ii))
       state_policy_order = find(oo_.dr.state_var == oo_.dr.order_var(ii));
       A1(:,ii) = oo_.dr.ghx(:,state_policy_order);
        
    end   
end

B1 = oo_.dr.ghu;
C1 = zeros(7,length(M_.endo_names));

tau_c_S = oo_.dr.inv_order_var(strmatch('tau_c',M_.endo_names,'exact'));
tau_n_S = oo_.dr.inv_order_var(strmatch('tau_n',M_.endo_names,'exact'));
tau_k_S =oo_.dr.inv_order_var(strmatch('tau_k',M_.endo_names,'exact'));
g_c_S = oo_.dr.inv_order_var(strmatch('g_c',M_.endo_names,'exact'));
g_i_S = oo_.dr.inv_order_var(strmatch('g_i',M_.endo_names,'exact'));
tr_S = oo_.dr.inv_order_var(strmatch('tr',M_.endo_names,'exact'));
o_revenue_S = oo_.dr.inv_order_var(strmatch('o_revenue',M_.endo_names,'exact'));


C1(1,tau_c_S) = 1;
C1(2,tau_n_S) = 1;
C1(3,tau_k_S) = 1;
C1(4,g_c_S) = 1;
C1(5,g_i_S) = 1;
C1(6,tr_S) = 1;
C1(7,o_revenue_S) = 1;

D1 = zeros(7,7);

% Run the conditional forecast for the policy scenario
mdl1 = ssm(A1,B1,C1,D1,'Mean0',zeros(length(M_.endo_names),1),'Cov0',zeros(length(M_.endo_names)),'StateType',zeros(1,length(M_.endo_names)));
X_2 = smooth(mdl1,Y);




% Plotting

all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Optimizer Consumption ','Restricted Consumption','Optimizer Hours','Restricted Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
hold on
for ii = 1:length(all_vars)
    a = X_1(1:24,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
      
end


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=2;
for ii = 1:length(all_vars)
    a = X_2(1:24,oo_.dr.inv_order_var(strmatch(all_vars(ii),M_.endo_names,'exact')));
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), '--', 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'--','Color', colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')     
end



print('IMF_Simulation_capital_control','-depsc')
