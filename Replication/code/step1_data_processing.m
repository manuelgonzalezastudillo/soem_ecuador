clc; clear;
%% Load data from Excel
[data_q,txt_q] = xlsread('../data/data.xlsx','quarterly','A1:S81'); % 2000:Q1 - 2019Q4
[data_m,txt_m] = xlsread('../data/data.xlsx','monthly');   % 2000:m1 - 2019:m12
[data_a,txt_a] = xlsread('../data/data.xlsx','annual');    % 2000 - 2019

%% Specify dates
years = (2000:1:2019)';
t1 = datetime(years(1),3,1);
t2 = datetime(years(end),1,1);
tt = datenum(t1:calmonths(3):t2)';
%% Make monthly data quarterly
data_mq(:,2:4) = movmean(data_m(:,2:4),[2 0]);         % rstar, oil price, embi        
data_mq(:,5:7) = data_m(:,13:15);                      % debt stock
data_mq(:,8) = movmean(data_m(:,16),[2 0]);            % real exchange rate
data_mq(:,9) = 3*movmean(data_m(:,17),[2 0]);          % oil production
data_q = [data_q data_mq((3:3:end)',2:end)];

%% Seasonally adjust data

%% Deflate data 

% All data is nomial except for world gdp growth and real oil GDP
% 1. Non_oil_GDP (thousands of dollars)
% 2. Private_consumption (thousands of dollars)
% 3. Total_FBKF (thousands of dollars)
% 4. Oil_GDP (thousands of dollars)
% 5. Gov_consumption (thousands of dollars)
% 6. World_GDP_growth_qoq
% 7. Oil_GDP_real 
% 8. Trade_balance (thoudands of dollars)
% 9. GDP (thousands of dollars on a quarterly basis)
% 10. US_Y_Deflator
% 11. Gov investment (millions of dollars)
% 12. Gov transfers (millions of dollars)
% 13. Gov transfers no ss (millions of dollars)
% 14. Hours (average weekly hours in a quarter)
% 15  Ecuador GDP Deflator
% 16. Unemployment (percent form)
% 17. Government debt as a share of GDP (annual frequency)
% 18. Change in government debt as a share of GDP (annual frequency)
% 19. Foreign_interest_rate
% 20. Oil_price
% 21. EMBI
% 22. Private_externaldebt (millions of dollars)
% 23. Public_externaldebt (millions of dollars)
% 24. Public_internaldebt (millions of dollars)
% 25. rer (real exchange rate)
% 26. oil production in barrels


%Put everything in terms of US goods except for oil quantities which is in terms of barrels of oil
data_q(:,[1 2 3 4 5 8 9 11 12 13 20 22:24]) = data_q(:,[1 2 3 4 5 8 9 11 12 13 20 22:24])./(data_q(:,10)/100);

%% Make table with data
var_names = [txt_q(1,2:end) txt_m(1,1:3) txt_m(1,12:16)];
data_table = array2table(data_q,'VariableNames',var_names,'RowNames',txt_q(2:end,1));
t = 2004:.25:2019.75;

US_deflator = xlsread('../data/data.xlsx','quarterly','K2:K82');
US_inflation = US_deflator(2:end)./US_deflator(1:end-1);

%% Make table with observables
var_names_obs = {'gam_YNCo_obs', 'gam_C_obs', 'gam_I_obs', 'xi_obs',... 
                 'pCostar_obs', 'YCo_obs', 'gam_G_obs','gam_TR_obs', 'gam_Ig_obs',...
                 'ratio_BY_obs', 'ratio_FY_obs', 'ratio_TBY_obs', 'gam_rer_obs',...
                 'Rstar_obs', 'Ystar_obs','G_obs','hours_obs','gama_YNCo_obs'};
% var_names_obs = {'gam_YNCo_obs', 'gam_C_obs', 'gam_I_obs', 'xi_obs',... 
%                  'pCostar_obs', 'YCo_obs', 'gam_G_obs','gam_TR_obs', 'gam_Ig_obs',...
%                  'ratio_BY_obs', 'ratio_TBY_obs', 'gam_rer_obs',...
%                  'Rstar_obs', 'Ystar_obs','G_obs','hours_obs','gama_YNCo_obs'};

% CHOOSE DATA FROM 2004:Q1             
gam_YNCo_obs = data_table.Non_oil_GDP(17:end)./data_table.Non_oil_GDP(16:end-1);
gam_C_obs = data_table.Private_consumption(17:end)./data_table.Private_consumption(16:end-1);
gam_I_obs = data_table.Total_FBKF(17:end)./data_table.Total_FBKF(16:end-1);
%gam_I_p_obs = (data_table.Total_FBKF(17:end) -
%data_table.Gov_investment(17:end))./(data_table.Total_FBKF(16:end-1) - data_table.Gov_investment(16:end-1));
xi_obs = (1+data_table.EMBI(17:end)/10000).^0.25;  
%[~,pCostar_obs] = hpfilter(log(data_table.Oil_price(17:end)),1600);
pCostar_obs = log(data_table.Oil_price(17:end));
% [~,YCo_obs] = hpfilter(log(data_table.Oil_GDP(17:end)./data_table.Oil_price(17:end)),1600);
[~,YCo_obs] = hpfilter(log(data_table.oil_production(17:end)),1600);
gam_G_obs = data_table.Gov_consumption(17:end)./data_table.Gov_consumption(16:end-1);
gam_TR_obs = data_table.Gov_transfers_no_ss(17:end)./data_table.Gov_transfers_no_ss(16:end-1);
gam_Ig_obs = data_table.Gov_investment(17:end)./data_table.Gov_investment(16:end-1);
ratio_BY_obs = 1000*(data_table.Public_externaldebt(17:end)  - data_table.Public_externaldebt(16:end-1))./data_table.GDP(17:end);
% ratio_BY_obs = data_table.D_Gov_Debt(17:end)/100;
% ratio_BY_obs = 1000*(data_table.Public_externaldebt(17:end)+data_table.Public_internaldebt(17:end)  - (data_table.Public_externaldebt(16:end-1)+data_table.Public_internaldebt(16:end-1)))./data_table.GDP(17:end);
ratio_FY_obs = 1000*(data_table.Private_externaldebt(17:end)  - data_table.Private_externaldebt(16:end-1))./data_table.GDP(17:end);
gam_rer_obs = data_table.rer(17:end)./data_table.rer(16:end-1);
Rstar_obs = log((1+data_table.Foreign_interest_rate(17:end)/100).^0.25) - log(US_inflation(17:end));
Ystar_sim = 100*ones(length(data_table.World_GDP_growth_qoq(17:end))+1,1);
for i = 1:length(data_table.World_GDP_growth_qoq(17:end))
    Ystar_sim(i+1) = (1+data_table.World_GDP_growth_qoq(16+i)/100)*Ystar_sim(i); 
end
[~, Ystar_obs] = hpfilter(log(Ystar_sim(2:end)),1600);
[~,G_obs] = hpfilter(log(data_table.Gov_consumption(17:end)),1600);
ratio_TBY_obs = (data_table.Trade_balance(17:end)./(data_table.GDP(17:end)));
hours = log((1 - .01*data_table.Unemployment(17:end)).*data_table.Hours(17:end)./(24*5));
for ii =2:length(hours)
    if isnan(hours(ii))
        hours(ii) = hours(ii-1);   
    end
    
end
[~,hours] = hpfilter(hours(16:end),1600);
hours_obs = [nan(15,1);hours];
gama_YNCo_obs =  data_table.Non_oil_GDP(17:end)./data_table.Non_oil_GDP(13:end-4);


data_matrix = 100*[gam_YNCo_obs,gam_C_obs,gam_I_obs,xi_obs,pCostar_obs,YCo_obs,...
               gam_G_obs,gam_TR_obs,gam_Ig_obs,...
               ratio_BY_obs,ratio_FY_obs, ratio_TBY_obs,gam_rer_obs,...
               Rstar_obs,Ystar_obs,G_obs,hours_obs,gama_YNCo_obs];
% data_matrix = 100*[gam_YNCo_obs,gam_C_obs,gam_I_obs,xi_obs,pCostar_obs,YCo_obs,...
%                gam_G_obs,gam_TR_obs,gam_Ig_obs,...
%                ratio_BY_obs,ratio_TBY_obs,gam_rer_obs,...
%                Rstar_obs,Ystar_obs,G_obs,hours_obs,gama_YNCo_obs];
           
             
                                
quarters = txt_q(18:end,1);
mean_matrix = mean(data_matrix,'omitnan');
data_matrix_demeaned = data_matrix - mean_matrix;

% for ii = 1:length(var_names_obs)
%     figure(1)
%     plot(t,data_matrix_demeaned(:,ii))
%     title(var_names_obs{ii})
%     print(strcat('../data/',var_names_obs{ii}),'-dpdf')
%       
% end
dataobs_table = array2table(data_matrix_demeaned,'VariableNames',var_names_obs,'RowNames',quarters);              
writetable(dataobs_table,'../data/estim_data.xlsx');


%% Compute Moments
% clc
disp('Correlations')
for ii = 1:length(var_names_obs)
    disp(var_names_obs{ii})
    correllation = corr(table2array(dataobs_table(:,ii)),dataobs_table.gam_YNCo_obs,'rows','complete');   
end

disp('Autocrrelations')
for ii = 1:length(var_names_obs)
    disp(var_names_obs{ii})
    autocorrellation = corr(table2array(dataobs_table(1:end-1,ii)),table2array(dataobs_table(2:end,ii)),'rows','complete');   
end

disp('VARIANCE')
for ii = 1:length(var_names_obs)
    disp(var_names_obs{ii})
    variance = var(table2array(dataobs_table(1:end-1,ii))/100,'omitnan');
end

           

%% Estimate parameters

Mdl = arima(1,0,0);

% Oil quantity
disp("Oil Quantitiy")
EstMdl_YCo_obs = estimate(Mdl,dataobs_table.YCo_obs);

% Oil price
disp("Oil Price")
EstMdl_pCostar_obs = estimate(Mdl,dataobs_table.pCostar_obs); 

% Foreign GDP
disp("Foreign GDP")
EstMdl_Ystar_obs= estimate(Mdl,dataobs_table.Ystar_obs);

% Foreign Interest Rate
disp("Foreign Interest Rate")
EstMdl_Rstar_obs= estimate(Mdl,dataobs_table.Rstar_obs); 



% Spending Rules 
[~,G_gap] = hpfilter(log(data_table.Gov_consumption(17:end).*data_table.US_Y_Deflator(17:end)./data_table.EC_Y_Deflator(17:end)),1600); % Government consumption in terms of domestic final good
[~,BY_gap] = hpfilter(log(1000*((data_table.Public_externaldebt(17:end)+data_table.Public_internaldebt(17:end))./data_table.GDP(17:end))),1600);
[~, y_gap] = hpfilter(log(data_table.GDP(17:end)),1600);
mdlG = fitlm([G_gap(1:end-1), y_gap(2:end), BY_gap(1:end-1)], G_gap(2:end), 'Intercept', false);

G = data_table.Gov_consumption(17:end);
Y = data_table.GDP(17:end);
BY = data_table.Public_externaldebt(17:end)./data_table.GDP(17:end);

yG = log(G(3:end))-log(G(2:end-1));
XG = [ones(length(yG),1), log(G(2:end-1))-log(G(1:end-2)), log(Y(3:end))-log(Y(2:end-1)), log(BY(2:end-1))-log(BY(1:end-2))];
% mdlDG = fitlm([log(G(2:end-1))-log(G(1:end-2)), log(Y(3:end))-log(Y(2:end-1)), log(BY(2:end-1))-log(BY(1:end-2))], log(G(3:end))-log(G(2:end-1)));
coefG = lsqlin(XG'*XG,XG'*yG,[],[],[],[],[-Inf 0 -Inf -Inf],[Inf 1 Inf 0]);
resG = yG - XG*coefG;
sigG = sqrt((resG'*resG)/(length(yG)-size(XG,2)));

[~,Ig_gap] = hpfilter(log(data_table.Gov_investment(17:end-1).*data_table.US_Y_Deflator(17:end-1)./data_table.EC_Y_Deflator(17:end-1)),1600); % Government investment in terms of domestic final good
mdlIg = fitlm([Ig_gap(1:end-1), y_gap(2:end-1), BY_gap(1:end-2)], Ig_gap(2:end), 'Intercept', false);

Ig = data_table.Gov_investment(17:end-1);
yIg = log(Ig(3:end))-log(Ig(2:end-1));
XIg = [ones(length(yIg),1), log(Ig(2:end-1))-log(Ig(1:end-2)), log(Y(3:end-1))-log(Y(2:end-2)), log(BY(2:end-2))-log(BY(1:end-3))];
% mdlDIg = fitlm([log(Ig(2:end-1))-log(Ig(1:end-2)), log(Y(3:end-1))-log(Y(2:end-2)), log(BY(2:end-2))-log(BY(1:end-3))], log(Ig(3:end))-log(Ig(2:end-1)));
coefIg = lsqlin(XIg'*XIg,XIg'*yIg,[],[],[],[],[-Inf 0 -Inf -Inf],[Inf 1 Inf 0]);
resIg = yIg - XIg*coefIg;
sigIg = sqrt((resIg'*resIg)/(length(yIg)-size(XIg,2)));

[~,TR_gap] = hpfilter(log(data_table.Gov_transfers_no_ss(33:end-1)),1600); % Transfers in terms of foreign good (numeraire)
mdlTR = fitlm([TR_gap(1:end-1), y_gap(18:end-1), BY_gap(17:end-2)], TR_gap(2:end), 'Intercept', false);

TR = data_table.Gov_transfers_no_ss(33:end-1);
yTR = log(TR(3:end))-log(TR(2:end-1));
XTR = [ones(length(yTR),1), log(TR(2:end-1))-log(TR(1:end-2)), log(Y(19:end-1))-log(Y(18:end-2)), log(BY(18:end-2))-log(BY(17:end-3))];
% mdlDTR = fitlm([log(TR(2:end-1))-log(TR(1:end-2)), log(Y(19:end-1))-log(Y(18:end-2)), log(BY(18:end-2))-log(BY(17:end-3))],log(TR(3:end))-log(TR(2:end-1)));
coefTR = lsqlin(XTR'*XTR,XTR'*yTR,[],[],[],[],[-Inf 0 -Inf -Inf],[Inf 1 Inf 0]);
resTR = yTR - XTR*coefTR;
sigTR = sqrt((resTR'*resTR)/(length(yTR)-size(XTR,2)));



 %% IMF Spending Projections (2020-2026)

%Annual values in millions of U.S. dollars (nominal)

%Wages and salaries + purchase of goods and services 
wages_salaries = [9598; 9479; 9590; 9645; 9874; 10109; 10510];
goods_services = [4010; 4173; 3931; 3835; 3628; 3649; 3794];
g_c_a = wages_salaries + goods_services;

%Fixed capital spending 
fixed_capital = [7195; 7607; 7545; 7414; 7496; 7570; 7890];
g_i_a = fixed_capital; 

%Other other spending
other_other = [1398; 2107; 2142; 2098; 2180; 2266; 2356];
tr_a = other_other;

   
%IMF projected annual U.S. inflation
net_inflation_a = [4.284/100; 3.456/100; 2.665/100; 2.598/100; 2.499/100; 2.336/100];
gross_inflation_a = net_inflation_a + 1;

 
   
%Get real annual growth rates in terms of U.S. goods
gam_G_a = (g_c_a(2:end)./(g_c_a(1:end-1))).*(gross_inflation_a.^(-1));
gam_IG_a = (g_i_a(2:end)./(g_i_a(1:end-1))).*(gross_inflation_a.^(-1));
gam_TR_a = (tr_a(2:end)./(tr_a(1:end-1))).*(gross_inflation_a.^(-1));

gam_G = zeros(4*length(gam_G_a),1);
gam_IG = zeros(4*length(gam_G_a),1);
gam_TR = zeros(4*length(gam_G_a),1);

%Make growth rates quarterly
for i = 1:length(gam_G_a)
    gam_G(4*(i-1)+1,1) = gam_G_a(i)^.25;
    gam_G(4*(i-1)+2,1) = gam_G_a(i)^.25;
    gam_G(4*(i-1)+3,1) = gam_G_a(i)^.25;
    gam_G(4*(i-1)+4,1) = gam_G_a(i)^.25;
    
    gam_IG(4*(i-1)+1) = gam_IG_a(i)^.25;
    gam_IG(4*(i-1)+2) = gam_IG_a(i)^.25;
    gam_IG(4*(i-1)+3) = gam_IG_a(i)^.25;
    gam_IG(4*(i-1)+4) = gam_IG_a(i)^.25;
    
    gam_TR(4*(i-1)+1) = gam_TR_a(i)^.25;
    gam_TR(4*(i-1)+2) = gam_TR_a(i)^.25;
    gam_TR(4*(i-1)+3) = gam_TR_a(i)^.25;
    gam_TR(4*(i-1)+4) = gam_TR_a(i)^.25;
    
    
end


%Demean growth rates 
gam_G_obs = gam_G;% - mean([data_matrix(:,7);gam_G]);
gam_IG_obs = gam_IG ;%- mean([data_matrix(1:end-1,9);gam_IG]);
gam_TR_obs = gam_TR;% - mean([data_matrix(1:end-1,8);gam_TR]);

%Get quarterly path 2021-2026
IMF_spending = [gam_G_obs(5:end),gam_IG_obs(5:end),gam_TR_obs(5:end)];
IMF_spending = array2table(IMF_spending,'VariableNames',["gam_G_obs","gam_IG_obs","gam_TR_obs"]);
writetable(IMF_spending,'../data/IMF_spending.xlsx')




             
             
             
             
             
             