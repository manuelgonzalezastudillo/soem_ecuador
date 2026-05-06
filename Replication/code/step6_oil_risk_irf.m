%% Oil price IRF

clear all;clc;close all;
addpath '/Users/avilipton/Documents/Dynare/6.2-x86_64/matlab'
dynare step3_decomposition.mod 

all_vars = {'pCostar','g_c','g_i','tr','ratio_BY','b_y','f_y','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Oil Price','Gov Consumption','Gov Investment','Transfers',...
        'Deficit/GDP','Government Debt/GDP','Private Debt/GDP','Country Premium',...
        'Real Non-oil GDP','Private Consumption','Private Investment','Trade Balance/GDP',...
        'Ricardian Consumption','Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};


percent_dev = {'gdp_nco','c','i','h','h_o','h_r','c_o','c_r','pCostar','g_c','g_i','tr'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = strcat(all_vars{ii},'_eps_pCostar');
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars{ii})) 
        plot(1:20,100*round(oo_.irfs.(a)./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(oo_.irfs.(a),10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')  

end

print('oil_irf','-depsc')

%% Risk IRF

clear all;clc;close all;
addpath '/Applications/Dynare/5.1/matlab'
dynare step3_decomposition.mod 

all_vars = {'zeta','g_c','g_i','tr','ratio_BY','b_y','f_y','xi_a','gdp_nco','c','i','ratio_TBY','c_o','c_r','h_o','h_r'};
    

titles = {'Idiosyncratic Risk','Gov Consumption','Gov Investment','Transfers',...
        'Deficit/GDP','Government Debt/GDP','Private Debt/GDP','Country Premium',...
        'Real Non-oil GDP','Private Consumption','Private Investment','Trade Balance/GDP',...
         'Ricardian Consumption','Hand to Mouth Consumption','Ricardian Hours','Hand to Mouth Hours'};


percent_dev = {'gdp_nco','c','i','h','h_o','h_r','c_o','c_r','zeta','g_c','g_i','tr'};

plot_rows = ceil(length(all_vars)/4); 
colorscheme = get(gca,'ColorOrder');
kk=1;
close all
for ii = 1:length(all_vars)
    a = strcat(all_vars{ii},'_eps_zeta');
    b = oo_.steady_state(strmatch(all_vars(ii),M_.endo_names,'exact'));
    subplot(plot_rows,4,ii) 
    if any(strcmp(percent_dev,all_vars{ii})) 
        plot(1:20,100*round(oo_.irfs.(a)./abs(b),10), 'Color',colorscheme(kk,:),'Linewidth',2);hold on;         
    else
        plot(1:20,100*round(oo_.irfs.(a),10),'Color',colorscheme(kk,:),'Linewidth',2);hold on; 
    end 
    plot(zeros(20,1),'k-','Linewidth',0.5)
    xlim([1 20]);
    set(gca, 'XTick', [1 4 8 12 16 20])  
    xtickangle(0)
    myTitle = titles{ii};
    title(myTitle,'Fontsize',7,'FontWeight','normal')
      

end

print('risk_irf','-depsc')