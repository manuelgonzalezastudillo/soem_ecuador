addpath '/Users/avilipton/Documents/Dynare/6.2-x86_64/matlab'


%% Consumption Tax
clear
dynare SOE_simulations_pf.mod 
steady;
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('p',M_.endo_names,'exact'))*(oo_.steady_state(strmatch('c',M_.endo_names,'exact'))));

tau_c = x*ones(24,1); 
tau_n = zeros(24,1); 
tau_k = zeros(24,1); 


g_c = zeros(24,1);
g_i = zeros(24,1);
tr = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;

oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_c','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Consumption Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Consumption_Tax_IRF','-depsc')



%% Labor Tax

clear
dynare SOE_simulations_pf.mod 

steady;
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/(oo_.steady_state(strmatch('w',M_.endo_names,'exact'))*(1-omega)*(oo_.steady_state(strmatch('h_o',M_.endo_names,'exact'))));

tau_n = x*ones(24,1); 
tau_c = zeros(24,1); 
tau_k = zeros(24,1); 


g_c = zeros(24,1);
g_i = zeros(24,1);
tr = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_n','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Labor Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Labor_Tax_IRF','-depsc')





%% Capital Tax

clear
dynare SOE_simulations_pf.mod 

steady;
x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/((oo_.steady_state(strmatch('rK',M_.endo_names,'exact'))-delta)*oo_.steady_state(strmatch('k',M_.endo_names,'exact'))/a_ss);

tau_k = x*ones(24,1); 
tau_c = zeros(24,1); 
tau_n = zeros(24,1); 


g_c = zeros(24,1);
g_i = zeros(24,1);
tr = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tau_k','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Capital Tax Rate','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Capital_Tax_IRF','-depsc')





%% Government Consumption

clear
dynare SOE_simulations_pf.mod 

steady;

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/oo_.steady_state(strmatch('p',M_.endo_names,'exact'));

tau_k = zeros(24,1); 
tau_c = zeros(24,1); 
tau_n = zeros(24,1); 


g_c = -x*ones(24,1);
g_i = zeros(24,1);
tr = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','g_c_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Government Consumption/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Government_Consumption_IRF','-depsc')




%% Government Investment

clear
dynare SOE_simulations_pf.mod 


steady;

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')))/oo_.steady_state(strmatch('p',M_.endo_names,'exact'));

tau_k = zeros(24,1); 
tau_c = zeros(24,1); 
tau_n = zeros(24,1); 


g_i = -x*ones(24,1);
g_c = zeros(24,1);
tr = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','g_i_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Government Investment/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Government_Investment_IRF','-depsc')



%% Government Transfers

clear
dynare SOE_simulations_pf.mod 

steady;

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')));

tau_k = zeros(24,1); 
tau_c = zeros(24,1); 
tau_n = zeros(24,1); 


tr = -x*ones(24,1);
g_c = zeros(24,1);
g_i = zeros(24,1);
o_revenue = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','tr_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Transfers/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Transfers_IRF','-depsc')



%% Oil Revenue

clear
dynare SOE_simulations_pf.mod 


steady;

x = .01*(oo_.steady_state(strmatch('y',M_.endo_names,'exact')));

tau_k = zeros(24,1); 
tau_c = zeros(24,1); 
tau_n = zeros(24,1); 


o_revenue = x*ones(24,1);
g_c = zeros(24,1);
tr = zeros(24,1);
g_i = zeros(24,1);


options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots
all_vars = {'ratio_BY','b_y','f_y','debt_agg_y','oR_y','xi_a','gdp_nco','c','w_r','h','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Deficit/GDP','Government Debt/GDP', 'Private Debt/GDP','Aggregate Debt/GDP','Oil Revenue/GDP','Country Premium','Real Non-Oil GDP',...
        'Private Consumption','Real Wage','Hours','Private Investment','Trade Balance/GDP','Ricardian Consumption',...
        'Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};
    

percent_dev = {'w_r','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:24,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
    if strmatch(all_vars{ii},'ratio_BY')
    plot(1:24,-1*ones(24,1),'r','Linewidth',0.5); hold on
    end   

end

print('Oil_Revenue_IRF','-depsc')

%% IMF Fiscal Consolidation Plan


clear
dynare SOE_simulations_pf.mod 

steady;

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots

all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Ricardian Consumption ','Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};

hor = 25;
plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
hold on
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:hor) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:hor-1,100*round(a./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:hor-1,100*round(a,10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(hor-1,1),'k-','Linewidth',0.5)
    xlim([1 hor-1]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')    
end



% High Oil
o_revenue = (cumprod(imf_spending.OilRevenue_up/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_ = perfect_foresight_solver(M_, options_, oo_);


kk=2;
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii), M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii), M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:hor-1,100*round(a./abs(b),10), '--', 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:hor-1,100*round(a,10), '--', 'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(hor-1,1),'k-','Linewidth',0.5)
    xlim([1 hor-1]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')    
end



% Low Oil
o_revenue = (cumprod(imf_spending.OilRevenue_down/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_ = perfect_foresight_solver(M_, options_, oo_);


kk=3;
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii), M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii), M_.endo_names,'exact'),2:25) - b;
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:hor-1,100*round(a./abs(b),10),':','Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:hor-1,100*round(a,10),':','Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(hor-1,1),'k-','Linewidth',0.5)
    xlim([1 hor-1]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')    
end
 


print('IMF_Simulation','-depsc')




%% IMF Fiscal Consolidation Plan Rigid Real Rate


clear
dynare SOE_simulations_pf.mod 

% Baseline
steady;

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots

all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Ricardian Consumption ','Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};



percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};


plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
hold on
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
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

% Rigid passthrough 
set_param_value('mu', 0.15);
steady;

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul)-1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);



% Plots

kk=2;
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
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

print('IMF_Simulation_capital_control','-depsc')


%% Bayesian Baseline IMF Simulation
clear

dynare SOE_simulations_pf.mod 
steady;

i_phi = 10;
i_varsigma = 11;
i_hpsi = 12;
i_eta = 13;
i_gamma_k = 14;
i_eta_c = 15;
i_upsilon = 16;
i_rho_g_c = 23;
i_alpha_g_c = 24;
i_gamma_g_c = 25;
i_rho_g_i = 26;
i_alpha_g_i = 27;
i_gamma_g_i = 28;
i_rho_TR = 29;
i_alpha_TR = 30;
i_gamma_TR = 31;



MH_11 = load('MH_draws/SOE_Estimation_mh1_blck1.mat','x2');
MH_21 = load('MH_draws/SOE_Estimation_mh2_blck1.mat','x2');
MH_31 = load('MH_draws/SOE_Estimation_mh3_blck1.mat','x2');

MH_12 = load('MH_draws/SOE_Estimation_mh1_blck2.mat','x2');
MH_22 = load('MH_draws/SOE_Estimation_mh2_blck2.mat','x2');
MH_32 = load('MH_draws/SOE_Estimation_mh3_blck2.mat','x2');


Theta1_full = [MH_11.x2; MH_21.x2; MH_31.x2]; % 1 million draws per chain
Theta2_full = [MH_12.x2; MH_22.x2; MH_32.x2]; 

Theta1 = Theta1_full(500001:end,:);
Theta2 = Theta2_full(500001:end,:);

Theta = [Theta1; Theta2];
all_simulations_1 = zeros(81, 24, 300000, 'single');
all_simulations_2 = zeros(81, 24, 200000, 'single');



imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");

i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


g_c_pre = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1);
g_i_pre = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1);
tr_pre = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1);
o_revenue_pre = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1);


T = 151;
ind_path = [ones(24,1); zeros(T-24,1)];



for j = 1:500000
    set_param_value('phi', Theta(j,i_phi));
    set_param_value('varsigma', Theta(j,i_varsigma));
    set_param_value('hpsi', Theta(j,i_hpsi));
    set_param_value('eta', Theta(j,i_eta));
    set_param_value('gamma_k', Theta(j,i_gamma_k));
    set_param_value('eta_c', Theta(j,i_eta_c));
    set_param_value('upsilon', Theta(j,i_upsilon));
    set_param_value('rho_g_c', Theta(j,i_rho_g_c));
    set_param_value('alpha_g_c', Theta(j,i_alpha_g_c));
    set_param_value('gamma_g_c', Theta(j,i_gamma_g_c));
    set_param_value('rho_g_i', Theta(j,i_rho_g_i));
    set_param_value('alpha_g_i', Theta(j,i_alpha_g_i));
    set_param_value('gamma_g_i', Theta(j,i_gamma_g_i));
    set_param_value('rho_TR', Theta(j,i_rho_TR));
    set_param_value('alpha_TR', Theta(j,i_alpha_TR));
    set_param_value('gamma_TR', Theta(j,i_gamma_TR));
    steady;

    g_c = g_c_pre*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
    g_i = g_i_pre*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
    tr = tr_pre*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
    o_revenue = o_revenue_pre*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));
        
    options_.periods = 150;
    oo_ = perfect_foresight_setup(M_, options_, oo_);
    g_c_path = [g_c; zeros(T-length(g_c),1)];
    g_i_path = [g_i; zeros(T-length(g_i),1)];
    tr_path = [tr; zeros(T-length(tr),1)];
    tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
    tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
    tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
    o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
    

    oo_.exo_simul(2:end,i_g_c) = g_c_path;
    oo_.exo_simul(2:end,i_g_i) = g_i_path;
    oo_.exo_simul(2:end,i_tr) = tr_path;
    oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
    oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
    oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
    oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
    oo_.exo_simul(2:end,i_ind_imf) = ind_path;
    
    oo_ = perfect_foresight_solver(M_, options_, oo_);
    if j <= 300000
        all_simulations_1(:,:,j) = oo_.endo_simul(:,2:25);
    else 
        all_simulations_2(:,:,j-300000) = oo_.endo_simul(:,2:25);

    end

end


save('pf_results1.mat','all_simulations_1','-v7.3')
save('pf_result2s.mat','all_simulations_2','-v7.3')



clear
dynare SOE_simulations_pf.mod 



% Baseline
steady;

tau_c = zeros(24,1); % no change to consumption tax
tau_n = [zeros(8,1); .03*ones(16,1)]; % permanent 3 percentage point increase in labor tax 
tau_k = [zeros(8,1);.005*ones(4,1); zeros(12,1)]; %temporary .05 percetage point to capital income tax rate


imf_spending = readtable("IMF_consolidation.xlsx","Sheet","quarterly_gr");


g_c = (cumprod(imf_spending.GovernmentConsumption/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_c',M_.endo_names,'exact'));
g_i = (cumprod(imf_spending.GovernmentInvestment/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('g_i',M_.endo_names,'exact'));
tr = (cumprod(imf_spending.Transfers/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('tr',M_.endo_names,'exact'));
o_revenue = (cumprod(imf_spending.OilRevenue/oo_.steady_state(strmatch('a',M_.endo_names,'exact')))-1)*oo_.steady_state(strmatch('o_revenue',M_.endo_names,'exact'));



options_.periods = 500;
oo_ = perfect_foresight_setup(M_, options_, oo_);
T = length(oo_.exo_simul) - 1;
g_c_path = [g_c; zeros(T-length(g_c),1)];
g_i_path = [g_i; zeros(T-length(g_i),1)];
tr_path = [tr; zeros(T-length(tr),1)];
tau_c_path = [tau_c; zeros(T-length(tau_c),1)];
tau_n_path = [tau_n; zeros(T-length(tau_n),1)];
tau_k_path = [tau_k; zeros(T-length(tau_k),1)];
o_revenue_path = [o_revenue; zeros(T-length(o_revenue),1)];
ind_path = [ones(24,1); zeros(T-24,1)];


i_g_c = strmatch('eps_g_c', M_.exo_names,'exact');
i_g_i = strmatch('eps_g_i', M_.exo_names,'exact');
i_tr = strmatch('eps_tr', M_.exo_names,'exact');
i_tau_c = strmatch('eps_tau_c', M_.exo_names,'exact');
i_tau_n = strmatch('eps_tau_n', M_.exo_names,'exact');
i_tau_k = strmatch('eps_tau_k', M_.exo_names,'exact');
i_o_revenue = strmatch('eps_o_revenue', M_.exo_names,'exact');
i_ind_imf = strmatch('ind_imf', M_.exo_names,'exact');

oo_.exo_simul(2:end,i_g_c) = g_c_path;
oo_.exo_simul(2:end,i_g_i) = g_i_path;
oo_.exo_simul(2:end,i_tr) = tr_path;
oo_.exo_simul(2:end,i_tau_c) = tau_c_path;
oo_.exo_simul(2:end,i_tau_n) = tau_n_path;
oo_.exo_simul(2:end,i_tau_k) = tau_k_path;
oo_.exo_simul(2:end,i_o_revenue) = o_revenue_path;
oo_.exo_simul(2:end,i_ind_imf) = ind_path;

oo_ = perfect_foresight_solver(M_, options_, oo_);

load('pf_results1.mat')
load('pf_result2s.mat')
all_simulations = cat(3, all_simulations_1, all_simulations_2);

irf_low = zeros(81, 24);
irf_high = zeros(81, 24);


for j = 1:24
    Yk = squeeze(all_simulations(:,j,:));
    irf_low(:,j) = prctile(Yk,5,2);
    irf_high(:,j) = prctile(Yk,95,2);
end





all_vars = {'g_c_y','g_i_y','tr_y','oR_y','tau_n','tau_k','ratio_BY','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};

titles = {'Gov Consumption/GDP','Gov Investment/GDP','Transfers/GDP','Oil Revenue/GDP','Labor Income Tax Rate',...
    'Capital Income Tax Rate','Deficit/GDP','Country Premium','Real Non-oil GDP','Private Consumption',...
    'Private Investment','Trade Balance/GDP','Ricardian Consumption ','Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};


percent_dev = {'w','gdp_nco','c','i','h','h_o','h_r','c_o','c_r'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
close all
hold on
for ii = 1:length(all_vars)
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    a_est = oo_.endo_simul(strmatch(all_vars(ii),M_.endo_names,'exact'),2:25) - b;
    a_low = irf_low(strmatch(all_vars(ii),M_.endo_names,'exact'),:) - b;
    a_high = irf_high(strmatch(all_vars(ii),M_.endo_names,'exact'),:) - b;

    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars(ii))) 
        plot(1:24,100*round(a_est./abs(b),10),'Color',colorscheme(1,:),'Linewidth',2);hold on;
        plot(1:24,100*round(a_high./abs(b),10), '--', 'Color',colorscheme(1,:),'Linewidth',1)
        plot(1:24,100*round(a_low./abs(b),10), '--', 'Color',colorscheme(1,:),'Linewidth',1)
    else
        plot(1:24,100*round(a_est,10),'Color',colorscheme(1,:),'Linewidth',2);hold on; 
        plot(1:24,100*round(a_high,10), '--','Color',colorscheme(1,:),'Linewidth',1)
        plot(1:24,100*round(a_low,10), '--','Color',colorscheme(1,:),'Linewidth',1)
    end 
    plot(zeros(24,1),'k-','Linewidth',0.5)
    xlim([1 24]);
    set(gca, 'XTick', [1 4 8 12 16 20 24]);
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')    
end


print('IMF_Simulation_bayesian','-depsc')