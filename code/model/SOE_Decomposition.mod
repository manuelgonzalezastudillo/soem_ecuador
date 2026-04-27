% SOE Quantitative Model

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows) and options
%----------------------------------------------------------------

close all;



%----------------------------------------------------------------
% 1. Preamble
%----------------------------------------------------------------

// Endogenous variables
var 
lam_o         % Optimizer Marginal Utility of Consumption
c_hat_o       % Optimizer Consumption Composite
c_o           % Optimizer Private Consumpion of Final Good
h_o           % Optimizer Labor Supply
i_o           % Optimizer Investment
k_o           % Optimizer Capital Stock 
f_star_o      % Optimizer Foreign Debt in Terms of Foregin Good
Theta_o       % Optimizer Wealth Effect on Labor Supply 1
chitil_o      % Optimizer Wealth Effect on Labor Supply 2
lam_r         % Rule of Thumb Marginal Utility of Consumption
c_hat_r       % Rule of Thumb Consumption Composite
c_r           % Rule of Thumb Private Consumption of Final Good
h_r           % Rule of Thumb Labor Supply;
Theta_r       % Rule of Thumb  Wealth Effect on Labor Supply 1 
chitil_r      % Rule of Thumb  Wealth Effect on Labor Supply 2
c             % Aggregate Private Consumption of Final Good
h             % Aggregate Labor Supply
i             % Aggregate Private Investment in Terms of Final Good
k             % Aggregarw Public Capital
f_star        % Aggregate Private Foreign Debt in Terms of Foreign Good
q             % Tobins q
w             % Wage in Terms of Foreign Good
rK            % Return to Private Capitalin Terms of Foreigh Good
y             % GDP in Temrs of Foreign Good
yC            % Final Good
yF            % Imports
yH            % Production of Home Good
xF            % Foreign Good Input to Final Good
xH            % Home Good Input to Final Good
xHstar        % Foreign Purcahses of Home Good
pi            % Profits for Home Good Producer in Terms of Foreign Good
pH            % Price of Home Good in Terms of Foreign Good
p             % Price of Final Good in Terms of Foreign Good
tb            % Trade Balance in Terms of Foreign Good
xi            % Country Premium
tau_k         % Capital Tax Rate
tau_n         % Labor Tax Rate
tau_c         % Consumption Tax Rate
k_g           % Government Capital
g_c           % Government Consumption of Final Good
g_i           % Government Investment Using Final Good
tr            % Aggregate Transfers in Terms of Foreign Good
tr_o          % Transfers to Optimizer in Terms of Foreign Good
tr_r          % Transfers to Rule of Thumb in Terms of Foreign Good
b_star        % Government Foreign Debt in Terms of Foreign Good
gdp_nco       % Real non-oil GDP
b_y           % Annualized governemnt debt to GDP ratio
f_y           % Annualized private debt to GDP ratio
debt_agg_y    % Annualized aggregate debt to GDP ratio
xi_a          % Annualized net country premium
w_r           % Real wage
g_c_y         % Government consumption to GDP
g_i_y         % Government investment to GDP
tr_y          % Transfers to GDP


// Exogenous state variables 
v             % Time Preference Shifter
kappa_o       % Optimizer Labor Preference Shifter
kappa_r       % Rule of Thumb Labor Preference Shifter
u             % Productivity of Investment Process
z             % TFP 
a             % Growth Rate of Labor Productivity (and the Enitre Economy)
zeta          % Idiosyncratic Component of Risk Premium
yCo           % Oil Production
pCostar       % Price of Oil in Terms of Foreign Good
Rstar         % Foreign Interest Rate in Terms of Foreign Good
y_star        % Foreign GDP in Terms of Foreign Good



// Definitions for Observables
yNCo                % Non-oil GDP in Terms of Foreign Good
gam_YNCo            % Growth Rate of Non-oil GDP in Terms of foreign Good
gama_YNCo           % Annual Q/Q Growth Rate of Non-oil GDP in Terms of foreign Good
gam_C               % Growth Rate of Consumption in Terms of Foreign Good
gam_I               % Growth Rate of Total Investment in Terms of Foreign Good 
gam_G               % Growth Rate of Government Consumption in Terms of Foreign Good
gam_Ig              % Growth Rate of Government Investment in Terms of Foreign Good
ratio_BY            % (One Period Change in Foreign Government Debt)/gdp 
ratio_TBY           % (Trade Balance)/gdp
rer                 % Real Exchange Rate
gam_TR              % Growth Rate of Transfers in Terms of Foreign Good
ratio_FY            % (One Period Change in Foreign Private Debt)/gdp 

      

// Observable variables 
gam_YNCo_obs        % Observed Demeaned gam_YNCo
gama_YNCo_obs       % Observed Demeaned gama_YNCo (NOT FOR ESTIMATION)
gam_C_obs           % Observed Demeaned gam_C
gam_I_obs           % Observed Demeaned gam_I
xi_obs              % Observed Demeaned xi
pCostar_obs         % Observed Demeaned pCostar
YCo_obs             % Observed Demeaned YCo
gam_G_obs           % Observed Demenaed gam_G
//ratio_BY_obs        % Observed Demeaned ratio_BY
Rstar_obs           % Observed Demeaned Rstar
Ystar_obs           % Observed Demeaned Ystar
gam_Ig_obs          % Observed Demenaed gam_Ig
gam_TR_obs          % Observed Demeaned gam_TR
ratio_TBY_obs       % Observed Demeaned Ratio_TBY
//ratio_FY_obs        % Observed Demeaned Ratio_FY
hours_obs           % Observed Demeaned Hours
;


    
// Exogenous innovations 
varexo 
eps_v               % Shock to Time Preference
eps_kappa           % Shock to Labor Supply Preference
eps_u               % Shock to Investment Specific Productivity 
eps_z               % Shock to TFP
eps_a               % Shock to Groweth Rate of Labor Productivity (and the entire economy)
eps_zeta            % Shock to Idiosyncratic Component of Country Premium 
eps_yCo             % Shock to Oil Production 
eps_Rstar           % Shock to Foreign Interest Rate
eps_pCostar         % Shock to Oil Price 
eps_y_star          % Shock to Foreign GDP
eps_g_c             % Shock to Government Consumption
eps_g_i             % Shock to Government Investment 
eps_TR              % Shock to Transfers 

eps_gam_YNCo_obs    % Measurement Error for Demenaned gam_YNCo
eps_gam_C_obs       % Measurement Error for Demenaned gam_C
eps_gam_I_obs       % Measurement Error for Demenaned gam_I
eps_xi_obs          % Measurement Error for Demenaned xi  
eps_pCostar_obs     % Measurement Error for Demenaned pCostar
eps_YCo_obs         % Measurement Error for Demenaned YCo  
eps_gam_G_obs       % Measurement Error for Demenaned gam_G
eps_Rstar_obs       % Measurement Error for Demenaned Rstar 
eps_Ystar_obs       % Measurement Error for Demenaned Ystar
//eps_ratio_BY_obs    % Measurement Error for Demenaned ratio_BY
eps_gam_Ig_obs      % Measurement Error for Demenaned gam_Ig 
eps_gam_TR_obs      % Measurement Error for Demenaned gam_TR
eps_ratio_TBY_obs   % Measurement Error for Demenaned ratio_TBY
//eps_ratio_FY_obs    % Measurement Error for Demenaned ratio_FY
eps_hours_obs       % Measurement Error for Demenaned h
eps_gama_YNCo_obs   % Measurement Error for Demeaned gama_YNCo
;

// Parameters    
parameters 
varsigma  % Habit Formation
hpsi      % 100 Times Elasticity of Country Premium to Debt
sigma     % CRRA Utility Parameter
phi       % Inverse Frisch Elasticity 
alpha     % Private Capital Share in Cobb Douglas Home Production
delta     % Depreciation of Private Capital 
eta       % Elasticity of Substitution Between Home and Foreign Goods
o         % Share of Foreign Goods in Final Good Production
chi       % Share of Oil Production Owned by government
upsilon   % Preference shifter controlling income effect on labor
eta_c     % Elasticity of Substitution Between Private and Government Consumption
o_c       % Share of Government Consumption in Consumption Composite
omega     % Fraction of Households that are Rule of Thumb
eta_star  % Price Elasticity of Foreign Demand for Home Goods
gamma     % Government Capital Share in Cobb Douglas Home Production
gamma_k   % Invesetment Adjustment Cost Parameter
beta      % Time Discount Factor
xi_bar    % Steady State Country Premium
omega_G   % Fraction of Government Transfers to Rule of Thumb Households
delta_g   % Depreciation of Government Capital 
o_kg      % Fraction of Non-Labor Share in Cobb Douglas Home Production Devoted to Government Capital 
o_star    % Strength of Foreign Demand for Home Good 

tau_c_bar % Seady State Consumption Tax Rate
tau_n_bar % Steady State Labor Tax Rate
tau_k_bar % Steady State Capital Tax Rate
g_i_bar   % Steady State Government Investment 
alpha_g_i % Reaction of Government Spending to Output Gap
gamma_g_i % Reaction of Government Spending to Debt
g_c_bar   % Steady State Government Consumption
alpha_g_c % Reaction of Government Consumption to Output Gap
gamma_g_c % Reaction of  Government Consumption to Debt 
tr_bar    % Steady State Transfers
alpha_TR  % Reaction of Transfers to Output Gap
gamma_TR  % Reaction of Transfers to Debt
rho_g_i   % Persistence of Government Investment 
rho_g_c   % Persistence of Government Consumption
rho_TR    % Persistenc of Transfers
sig_g_i   % SD of Government Investment Shock 
sig_g_c   % SD of Government Consumption Shock 
sig_TR    % SD of Transfers Shock 

rho_v        % Persistence of Time Preference Shock 
rho_kappa    % Persistence of Labor Supply Preference Shock 
rho_u        % Persistence of Investment Specific Productivity Shock 
rho_z        % Persistence of TFP Shock 
rho_a        % Persistence of Growth Rate Shock 
rho_zeta     % Persistence of Idiosyncratic Risk Premium Shock
rho_yCo      % Persistence of Oil Production Shock 
rho_Rstar    % Persistence of Foreign Interest Rate Shock 
rho_pCostar  % Persistence of Oil Price Shock 
rho_y_star   % Persistence of Foreign GDP Shock 

sig_v        % SD of Time Preference Shock 
sig_kappa    % SD of Labor Supply Preference Shock 
sig_u        % SD of Investment Specific Productivity Shock 
sig_z        % SD of TFP Shock 
sig_a        % SD of Growth Rate Shock 
sig_zeta     % SD of Idiosyncratic Risk Premium Shock
sig_yCo      % SD of Oil Production Shock 
sig_Rstar    % SD of Foreign Interest Rate Shock 
sig_pCostar  % SD of Oil Price Shock 
sig_y_star   % SD of Foreign GDP Shock 

v_ss             % Steady State Time Preference Shifter
kappa_o_ss       % Steady State Optimizer Labor Preference Shifter
kappa_r_ss       % Steady State Rule of Thumb Labor Preference Shifter
u_ss             % Steady State Productivity of Investment Process
z_ss             % Steady State TFP 
a_ss             % Steady State Growth Rate of Labor Productivity (and the Enitre Economy)
zeta_ss          % Steady State Idiosyncratic Component of Risk Premium
yCo_ss           % Steady State Oil Production
pCostar_ss       % Steady State Price of Oil in Terms of Foreign Good
Rstar_ss         % Steady State Foreign Interest Rate in Terms of Foreign Good
y_star_ss        % Steady State Foreign GDP in Terms of Foreign Good

sCo_ss           % Steady State Ratio of Oil Revenue over GDP
sg_ss            % Steady State Ratio of Government Consumption over GDP
str_ss           % Steady State Ratio of Transfers over GDP
T_ss             % Steady State Lump Sum Tax on Optimizers in Terms of Foreign Good
h_o_ss           % Steady State Optimizer Hours
h_r_ss           % Steady State Rule of Thumb Hours
p_ss             % Steady State Price of Final Good in Terms of Foreign Good
i_r              % Steady State Ratio of Government Investment to Private Investment 
k_r              % Steady State Ratio of Government Capital to Private Capital 
b_bar            % Steady State Government Debt to GDP Ratio 
sf_ss            % Steady State Private Debt to GDP Ratio 
//stb_ss           % Steady State Trade Balance to GDP Ratio
fb_star_bar      % Steady State Aggregate Debt
y_ss             % Steady State GDP
b_star_ss        % Steady State Foreign Government Debt
f_star_ss        % Steady State Foreign Private Deby
tb_ss            % Steady State Trade Balance
h_ss             % Steady State Aggregate Hours
;




// Calibrated parameters (Endogenous: beta, kappa_o_ss, kappa_r_ss, o_star, g_c_bar, g_i_bar, yCo_ss, fb_star_bar, tr_bar, 
// k_r, y_ss, b_star_ss, f_star_ss, tb_ss, h_ss)

sigma=1.00001;                 // log utility (Medina and Soto, 2007)              
//upsilon=.01;             // preference shifter controlling income effect on labor (small to kill income effect on hours)
delta=0.06/4;            // annual depreciation rate of 6% (Medina and Soto, 2007)
o=0.27;                  // home bias in domestic demand of 73% (imports/domestic demand=27%, 2000-2019)
chi=0.74;                // chi=c+(1-c)*t, c=0.6 (production Petroecuador/total, 2000-2019), t = 0.35 (general tax) 

omega=.7;             
omega_G =1;              // All transfers to rule of thumb households
delta_g=.06/4;           // Coenen et al. (2013)
o_c= .25;                // Coenen et al. (2013)
o_kg = .1;               // Coenen et al. (2013)
gamma=o_kg*.34;          // Labor share of 66% (Medina and Soto, 2007) implies capital share of 34%  
alpha= 1-.66-gamma;      // Labor share of 66% (Medina and Soto, 2007)        
eta_star = 0.25;         // Crespo and Gomez (2005), Pelaez et al (2020)

// Targeted steady state values
//stb_ss=0.022;           // IMF July 2022, Trade balance in 2027 is $2,734 and GDP is $137,663. So 2%. 
sf_ss = .256;            // IMF July 2022, The IMF projects that public external debt will be 35.5% of GDP in 2027 and total external debt to be 41.9%. Hence, private external debt is 6.4% of annual GDP or 25.6% quarterly
sg_ss=0.106;             // IMF July 2022, Wages and Salaries + Purchases of Goods and Services in 2027 is 10.6% of GDP.
//str_ss = .077;         // Mean 2008-2019
str_ss = .049;           // IMF July 2022, Cost of import of derivatives + Social assistance in 2027 is 4.9% of GDP
sCo_ss=0.082;            // IMF July 2022, Oil production in 2027 is 194.8 million barrels, oil price is 57.9, Nominal GDP is 137,663 (8.2%). Historical average 2000-2022 is 8.8%
a_ss=1.02^.25;           // quarterly balanced growth path constistent with (Gonzalez-Astudillo, 2016)
Rstar_ss=(1.024/1.02)^.25;  // Quarterly gross U.S. 3-month Tbill and inflation 2030 CBO forecasts, July 2021. [WE SHOULD TARGET A REAL FOREIGN INTEREST RATE]
xi_bar=(1.0518)^.25;     // Average of the EMBI TS for Latin American and Caribbean countries 1997-2020. IMF July 2022, Public debt is 59.9% of GDP in 2022 and 45.1% in 2027.
tau_c_bar=.12;           // Current VAT in Ecuador 
tau_k_bar=.25;           // Current corporate tax rate in Ecuador
tau_n_bar=.04;           // Effective average labor income tax rate in Ecuador before 2022  
b_bar = 1.42;            // IMF July 2022, - The IMF projects that total public debt will be 45.1% of GDP in 2027 of which 35.5% is external. The steady state of public external debt should be 142% quarterly
i_r=.16;                 // Average for OECD countries. {IMF July 2022, The IMF projects that private investment in 2027 will be 19.4% of GDP and public investment will be 6.6%}
h_o_ss = (1-0.047)*0.31; // Historical average for aggregate hours is 37.1 hours per week or 0.31 of the total weekly hours and for the unemployment rate is 4.7%
h_r_ss = (1-0.047)*0.31; // Historical average for aggregate hours is 37.1 hours per week or 0.31 of the total weekly hours and for the unemployment rate is 4.7%
  

// Steady state normalizations          
v_ss=1;         
u_ss=1;       
p_ss=1;          
z_ss=1;               
zeta_ss=1;          
y_star_ss=1;          
pCostar_ss=1;



        
// Exogenous process parameters from external estimation. 
rho_yCo     = 0.645978544032117;    // significant
rho_Rstar   = 0.7333263129578 ;     // significant
rho_y_star  = 0.900547920881103;    // significant
rho_pCostar = 0.87142;              // significant


sig_yCo     = sqrt(0.0427851233501011);    // significant
sig_Rstar   = sqrt(6.09000633881149e-06);  // significant
sig_y_star  = sqrt(2.36241779757771e-05);  // significant
sig_pCostar = sqrt(0.036797);              // significant


// Internally estimated parameters - posterior mean from latest estimation


// Spending parameters  
rho_g_i   =     0.773151296679890; 
alpha_g_i =     2.581136188194960;         
gamma_g_i =     -1.820671564944772; 
sig_g_i   =     0.168734928580098;  

rho_g_c   =     0.881944929959026;
alpha_g_c =     0.593524641111012; 
gamma_g_c =     -0.497803637718900; 
sig_g_c   =     0.027681576551846;     

rho_TR    =     0.473017824489847;
alpha_TR  =     5.462229514950716;      
gamma_TR  =     -0.261494559041695; 
sig_TR    =     0.108155747321727;

 
// Deep Parameters
phi          =   3.421587887494021;      
varsigma     =   0.738370963191099; 
hpsi         =   2.210565902756527; 
eta          =   6.075943008381720; 
gamma_k      =   8.854549591310821;
eta_c        =   0.794029592118338;
upsilon      =   0.700769221922841;
  

rho_v        =	0.405751923331249; 
rho_kappa    =	0.737600849685945;  
rho_u	     =	0.351761401463657; 
rho_z        =	0.863272871391337; 
rho_a        =	0.789357359547517; 
rho_zeta     =	0.651794588641516; 

sig_v        =	10.230704155806931;
sig_kappa    =	7.557924942236687;
sig_u	     =	27.244717788035512; 
sig_z        =	2.079262504182787; 
sig_a        =	0.622816528299578; 
sig_zeta     =	0.889746719504832; 

%----------------------------------------------------------------
% 2. Model (137=49+49+11+14+14 equations)
%----------------------------------------------------------------
%

model;

// Equilibrium conditions 

[name='Optimizer Marginal Utility of Consumption']
lam_o*(1+tau_c)*p= c_hat_o^(-sigma)*(((1-o_c)*c_hat_o)/(c_o-varsigma*c_o(-1)/a(-1)))^(1/eta_c); 

[name='Rule of Thumb Marginal Utility of Consumption']
lam_r*(1+tau_c)*p= c_hat_r^(-sigma)*(((1-o_c)*c_hat_r)/(c_r-varsigma*c_r(-1)/a(-1)))^(1/eta_c); 

[name='Aggregate Private Consumption']
c = (1-omega)*c_o + omega*c_r; 

[name='Optimizer Consumption/Leisure Condition'] 
(1-tau_n)*w = Theta_o*kappa_o*h_o^phi/lam_o;  

[name='Rule of Thumb Comsumption/Leausre Condition']
w = Theta_r*kappa_r*h_r^phi/lam_r;  

[name='Aggregate Labor Supply']
h = (1-omega)*h_o + omega*h_r; 

[name='Optimizer Euler Equation']
lam_o = beta/a^sigma*Rstar*xi*v(+1)/v*lam_o(+1); 

[name='Final Good Production']
yC = ((1-o)^(1/eta)*xH^((eta-1)/eta) + o^(1/eta)*xF^((eta-1)/eta))^(eta/(eta-1)); 

[name='Domestic Demand for Foreign Goods']
xF = o*(1/p)^(-eta)*yC; 

[name='Doemstic Demand for Home Goods']
xH = (1-o)*(pH/p)^(-eta)*yC; 

[name='Foreign Demand for Home Goods']
xHstar = o_star*pH^(-eta_star)*y_star; 

[name='Home Good Production Function']
yH = z*(k_g(-1)/a(-1))^gamma*(k(-1)/a(-1))^alpha*(a*h)^(1-alpha-gamma); 

[name='Home Good Market Clearing']
yH = xH + xHstar; 

[name='Final Good Market Clearing']
yC = c + i + g_c + g_i; 

[name='GDP In Terms of Foreing Good']
y = p*(c + i + g_c + g_i) + tb; //pH*yH+pCostar*yCo; 

[name='Trade Balance']
tb = pH*xHstar + pCostar*yCo - yF; 

[name='Aggregate Privately Held Foreign Debt']
f_star = (1-omega)*f_star_o; 

[name='Balance of Payments Identity']
f_star + b_star = (f_star(-1) + b_star(-1))/a(-1)*Rstar(-1)*xi(-1) - tb + (1-chi)*pCostar*yCo; 

[name='Country Premium']
xi = xi_bar*exp(.01*hpsi*((f_star+b_star)/y - fb_star_bar)/fb_star_bar + (zeta-zeta_ss)/zeta_ss); 

[name='Evolution of Optimizer Capital']
k_o =(1-delta)*k_o(-1)/a(-1)+(1-gamma_k/2*(i_o/i_o(-1)*a(-1)-a_ss)^2)*u*i_o; 

[name='Aggregate Private Capital']
k = (1-omega)*k_o; 

[name='Aggregate Private Investment']
i = (1-omega)*i_o; 

[name='Tobins q for Private Investment']
q= beta/a^sigma*v(+1)/v*lam_o(+1)/lam_o*((1-tau_k(+1))*rK(+1)+ delta*tau_k(+1) + q(+1)*(1-delta)); 

[name='Return to Capital Equals Marginal Product of Capital']
rK=pH*alpha*yH/k(-1)*a(-1); 

[name='Wage Equals Marginal Product of Labor']
w=pH*(1-alpha-gamma)*yH/h; 

[name='Optimzer Investment First Order Condition']
p/q=(1-gamma_k/2*(i_o/i_o(-1)*a(-1)-a_ss)^2-gamma_k*(i_o/i_o(-1)*a(-1)-a_ss)*i_o/i_o(-1)*a(-1))*u+beta/a^sigma*gamma_k*v(+1)/v*q(+1)/q*lam_o(+1)/lam_o*(i_o(+1)/i_o*a-a_ss)*(i_o(+1)/i_o*a)^2*u(+1); 

[name='Import Market Clearing']
yF=xF; 

[name='Optimizer Consumption Composite']
c_hat_o = ((1-o_c)^(1/eta_c)*(c_o-varsigma*c_o(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)); 

[name='Rule of Thumb Consumption Composite']
c_hat_r = ((1-o_c)^(1/eta_c)*(c_r-varsigma*c_r(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)); 

[name='Optimizer Wealth Effect on Labor Supply 1']
Theta_o= chitil_o*(((1-o_c)^(1/eta_c)*(c_o-varsigma*c_o(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c_bar^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)))^(-sigma); 

[name='Optimizer Wealth Effect on Labor Supply 2']
chitil_o= chitil_o(-1)^(1-upsilon)*(((1-o_c)^(1/eta_c)*(c_o-varsigma*c_o(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c_bar^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)))^(sigma*upsilon); 

[name='Rule of Thumb Wealth Effect on Labor Supply 1']
Theta_r= chitil_r*(((1-o_c)^(1/eta_c)*(c_r-varsigma*c_r(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c_bar^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)))^(-sigma); 

[name='Rule of Thumb Wealth Effect on Labor Supply 2']
chitil_r= chitil_r(-1)^(1-upsilon)*(((1-o_c)^(1/eta_c)*(c_r-varsigma*c_r(-1)/a(-1))^((eta_c-1)/eta_c) + o_c^(1/eta_c)*g_c_bar^((eta_c-1)/eta_c))^(eta_c/(eta_c-1)))^(sigma*upsilon); 

[name='Government Budget Constraint']
p*g_c+p*g_i+ Rstar(-1)*xi(-1)*b_star(-1)/a(-1)+tr = chi*pCostar*yCo+b_star+tau_n*w*(1-omega)*h_o+tau_k*(rK-delta)*k(-1)/a(-1)+tau_c*p*c+T_ss*(1-omega);
//p*g_c+p*g_i+ Rstar(-1)*xi(-1)*b_star(-1)/a(-1)+tr = chi*pCostar*yCo+b_star+tau_n*w*(1-omega)*h_o+tau_k*(rK-delta)*k(-1)/a(-1)+tau_c*p*c;

[name='Transfers to Optimizers']
tr_o = (1-omega_G)/(1-omega)*tr; 

[name='Transfers to Rule of Thumb']
tr_r = (omega_G/omega)*tr; 

[name='Profits of Home Good Producer']
pi = pH*gamma*yH; 

[name='Evolution of Government Capital']
k_g = (1-delta_g)*k_g(-1)/a(-1) + g_i; 

[name='Consumption Tax']
tau_c = tau_c_bar; 

[name='Labor Tax']
tau_n = tau_n_bar; 

[name='Capital Tax']
tau_k = tau_k_bar; 

[name='Government Investment Rule']
g_i = (g_i(-1))^(rho_g_i)*(g_i_bar*(y/y_ss)^alpha_g_i*(b_star(-1)/y(-1)/b_bar)^gamma_g_i)^(1-rho_g_i)*exp(eps_g_i); 

[name='Government Consumption Rule']
g_c = (g_c(-1))^(rho_g_c)*(g_c_bar*(y/y_ss)^alpha_g_c*(b_star(-1)/y(-1)/b_bar)^gamma_g_c)^(1-rho_g_c)*exp(eps_g_c); 

[name='Government Transfers Rule']
tr = (tr(-1))^(rho_TR)*(tr_bar*(y/y_ss)^alpha_TR*(b_star(-1)/y(-1)/b_bar)^gamma_TR)^(1-rho_TR)*exp(eps_TR); 

[name='Rule of Thumb Budget Constraint']
(1+tau_c)*p*c_r = w*h_r + tr_r; 

[name='Real Non-Oil GDP']
gdp_nco = pH*yH/p;

[name= 'Annual Government Debt to GDP']
b_y = b_star/(4*y); //annual debt to GDP

[name='Annual Private Debt to GDP']
f_y = f_star/(4*y);

[name='Annual Aggregate Debt to GDP']
debt_agg_y = (f_star + b_star)/(4*y);

[name='Annual Net Country Premium ']
xi_a = xi^4-1;

[name='Real Wage']
w_r = w/p;

[name='Government Consumption to GDP']
g_c_y = p*g_c/y;

[name='Government Investment to GDP']
g_i_y = p*g_i/y;

[name='Transfers to GDP']
tr_y = tr/y;

// Exogenous AR(1) processes  

[name='Time Preference Shifter Process']
log(v)-log(v_ss)=rho_v*(log(v(-1))-log(v_ss))+0.01*eps_v;

[name='Optimizer Labor Supply Preference Shifter Process']
log(kappa_o)-log(kappa_o_ss)=rho_kappa*(log(kappa_o(-1))-log(kappa_o_ss))+0.01*eps_kappa;

[name='Rule of Thumb Labor Supply Preference Shifter Process']
log(kappa_r)-log(kappa_r_ss)=rho_kappa*(log(kappa_r(-1))-log(kappa_r_ss))+0.01*eps_kappa;

[name='Investment Specific Productivity Process']
log(u)-log(u_ss)=rho_u*(log(u(-1))-log(u_ss))+0.01*eps_u;

[name='TFP Process']
log(z)-log(z_ss)=rho_z*(log(z(-1))-log(z_ss))+0.01*eps_z;

[name='Growth Rate Process']
log(a)-log(a_ss)=rho_a*(log(a(-1))-log(a_ss))+0.01*eps_a;

[name='Oil Quantity Process']
log(yCo)-log(yCo_ss)=rho_yCo*(log(yCo(-1))-log(yCo_ss))+eps_yCo;

[name='Idiosyncratic Component of Country Premium Process']
log(zeta)-log(zeta_ss)=rho_zeta*(log(zeta(-1))-log(zeta_ss))+0.01*eps_zeta;

[name='Foreign Inerest Rate Process']
log(Rstar)-log(Rstar_ss)=rho_Rstar*(log(Rstar(-1))-log(Rstar_ss))+eps_Rstar;

[name='Foreign GDP Process']
log(y_star)-log(y_star_ss)=rho_y_star*(log(y_star(-1))-log(y_star_ss))+eps_y_star;

[name='Oil Price Process']
log(pCostar)-log(pCostar_ss)=rho_pCostar*(log(pCostar(-1))-log(pCostar_ss))+eps_pCostar;


// Definitions for Observables
[name='Non-oil GDP']
yNCo=y-pCostar*yCo; 

[name='Growth Rate of Non-oil GDP']
gam_YNCo=yNCo/yNCo(-1)*a(-1);

[name='Annual Q/Q Growth Rate of Non-oil GDP']
gama_YNCo=yNCo/yNCo(-4)*a(-1)*a(-2)*a(-3)*a(-4);

[name='Growth Rate of Private Consumption']
gam_C= (p*c)/(p(-1)*c(-1))*a(-1);

[name='Growth Rate of Total Investment']
gam_I=(p*i+p*g_i)/(p(-1)*i(-1) + p(-1)*g_i(-1))*a(-1);

[name='Growth Rate of Government Consumption']
gam_G=(p*g_c)/(p(-1)*g_c(-1))*a(-1);

[name='Growth Rate of Government Investment']
gam_Ig = (p*g_i)/(p(-1)*g_i(-1))*a(-1);

[name='Change in Government Debt Over GDP']
ratio_BY = (b_star-b_star(-1)/a(-1))/y;

[name='Change in foreign Debt Over GDP']
ratio_FY = (f_star-f_star(-1)/a(-1))/y;

[name='Real Exchange Rate']
rer = 1/p;

[name='Trade Balance Over GDP']
ratio_TBY = tb/y;

[name='Growt Rate of Government Transfers']
gam_TR = (tr)/(tr(-1))*a(-1);



// Observation equations 


[name='Growth Rate of Non-oil GDP (Observation)']
gam_YNCo_obs = 100*(gam_YNCo-a_ss + eps_gam_YNCo_obs) ;   

[name='Annual Q/Q Growth Rate of Non-oil GDP (Observation)']
gama_YNCo_obs = 100*(gama_YNCo-a_ss^4 + eps_gama_YNCo_obs) ;   

[name='Growth Rate of Private Consumption (Observation)']
gam_C_obs = 100*(gam_C-a_ss + eps_gam_C_obs) ;         

[name='Growth Rate of Total Investment (Observation)']
gam_I_obs = 100*(gam_I-a_ss + eps_gam_I_obs) ;         

[name='Country Premium (Observation)']
xi_obs = 100*(xi-xi_bar + eps_xi_obs);          

[name='Oil Price (Observation)']
pCostar_obs = 100*(log(pCostar)-log(pCostar_ss) + eps_pCostar_obs) ; 

[name='Oil Quantity (Observation)']
YCo_obs = 100*(log(yCo)-log(yCo_ss) + eps_YCo_obs);

[name='Foreign Interest Rate (Observation)']
Rstar_obs = 100*(log(Rstar)-log(Rstar_ss) + eps_Rstar_obs);        

[name='Foreign GDP (Observation)']
Ystar_obs = 100*(log(y_star)-log(y_star_ss) + eps_Ystar_obs); 

//[name='Annual change in Government Debt Over GDP (Observation)']
//ratio_BY_obs = 100*(ratio_BY-b_star_ss*(1-1/a_ss)/y_ss + eps_ratio_BY_obs);

//[name='Change in Private Debt Over GDP (Observation)']
//ratio_FY_obs = 100*(ratio_FY-f_star_ss*(1-1/a_ss)/y_ss + eps_ratio_FY_obs);

[name='Growth Rate of Government Consumption (Observation)']
gam_G_obs= 100*(gam_G-a_ss + eps_gam_G_obs);

[name='Growth Rate of Government Investment (Observation)']
gam_Ig_obs = 100*(gam_Ig-a_ss + eps_gam_Ig_obs);

[name='Growth Rate of Transfers (Observation)']
gam_TR_obs = 100*(gam_TR-a_ss + eps_gam_TR_obs);

[name='Trade Balance Over GDP (Observation)']
ratio_TBY_obs = 100*(ratio_TBY-tb_ss/y_ss + eps_ratio_TBY_obs);

[name='Hours (Observation)']
hours_obs = 100*(log(h) - log(h_ss) + eps_hours_obs);



// Notes on observation equations and data:

// All data is demeaned  to address the fact that the model assumes a consistent growth rate for all variables, which we know is not the 
// case in the data. The only excpetiosn are oil price, oil quantity, and foreign gdp, which are log HP filtered instead.

//1.Growth Rate of Non-oil GDP: Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//2.Growth Rate of Private Consumption: Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//3.Growth Rate of Total Investment: Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//4.Country Premium: Monthly data is made quarterly by averaging over months. EMBI (country premium) is conventionally quoted in 
//  basis points on a net annual basis. The observabble instead is in quarterly gross terms. To get to this form we do the following: 
//  (1+EMBI/10000)^.25.
//5.Oil Price: Monthly data is made quarterly by averaging over months. Nominal data in US dollars is deflated by US GDP deflator to be 
//  put in terms of US goods. This variable is also completely exogenous in the model and so the AR-1 coefficient and SD of the sock are 
//  estimated outside the model using  logged data. .
//6.Oil Quantity: Nominal Oil GDP in US dollars is divided by the nominal price in US dollars to get barrels of oil. This variable is also
//  completely exogenous in the model and so the AR-1 coefficient and SD of the sock are estimated outside the model using HP-filtered logged 
//  data. As such, the observable for the internal estimation is also log HP-filtered.
//7.Foregin Interest Rate: Monthly data is made quarterly by averaging over months. We take the nominal US federal funds rate quoted in 
//  percentage terms on a net annual basis. We turn this into a quarterly gross rate as follows: (1+i/100)^.25. We then divide through by 
//  quarterly US inflation (constrcuted from US GDP deflator) to get the real quarterly gross US federal funds rate. This variable is also 
//  completely exogenous in the model and so the AR-1  coefficient and SD of the sock are estimated outside the model using 
//  logged data.
//8.Foreign GDP: We have data for total OECD real gdp growth.This variable is also completely exogenous in the model and so the AR-1 
//  coefficient and SD of the shock are estimated outside the model using HP-filtered logged data. Because we are using the cyclical 
//  componenet of filtered data we simply choose an arbitrary initial point for real world GDP and successively apply the growth rates
//  to simulate a series for real world GDP that we then log and HP-filter.
//9.Change in Foreign Debt/GDP: Monthly data is made quarterly by averaging over months.The data is nominal in US dollars so it is deflated
//  By the US GDP deflator to be put in terms of US goods.The first difference is taken and the qauntitiy is divided by GDP. GDP is constructed
//  by dividing nominal GDP in US dollars by the US GDP deflator as well. Becasue debt data is quoted in millions and GDP is thousands, the
//  observable is scaled by 1000. 
//10.Change in Foreign Debt/GDP: Monthly data is made quarterly by averaging over months.The data is nominal in US dollars so it is deflated
//  By the US GDP deflator to be put in terms of US goods.The first difference is taken and the qauntitiy is divided by GDP. GDP is constructed
//  by dividing nominal GDP in US dollars by the US GDP deflator as well. Becasue debt data is quoted in millions and GDP is thousands, the
//  observable is scaled by 1000. 
//11.Growth Rate of Government Consumption:Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//12.Growth Rate of Government Investment:Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//13.Growth Rate of Transfers:Nominal data in US dollars deflated by US GDP deflator to be put in terms of US goods
//14.Hours: Average weekly hours per month are multipied by 1 minus the unemployment rate, divided through by 24*5 to get a measure of 
//   fraction of time worked. Missing data starting in 2007Q4 is filled in with the previous value. The data from 2007Q4-2019Q4 is then 
//  log HP filtered


end;

%----------------------------------------------------------------
% 3. Steady state
%----------------------------------------------------------------

steady_state_model; 

beta=a_ss^sigma/Rstar_ss/xi_bar;
h_ss=(1-omega)*h_o_ss+omega*h_r_ss;
q_ss=p_ss;
tau_k_ss=tau_k_bar;
tau_n_ss=tau_n_bar;
tau_c_ss=tau_c_bar;
rK_ss=(q_ss*(a_ss^sigma/beta-1+delta)-tau_k_ss*delta)/(1-tau_k_ss);
pH_ss=p_ss*(1/(1-o)*(1-o*(1/p_ss)^(1-eta)))^(1/(1-eta));
k_r = i_r*(1-(1-delta)/a_ss)/(1-(1-delta_g)/a_ss);
yH_ss=(z_ss*(k_r*pH_ss*alpha/rK_ss)^gamma*(pH_ss*alpha/rK_ss)^alpha*(a_ss*h_ss)^(1-alpha-gamma))^(1/(1-alpha-gamma));
k_ss=pH_ss*alpha*yH_ss/rK_ss*a_ss;
k_g_ss = k_r*k_ss;
g_i_ss = k_g_ss *(1-(1-delta_g)/a_ss);
k_o_ss=k_ss/(1-omega);
i_o_ss=k_o_ss*(1-(1-delta)/a_ss);
i_ss=(1-omega)*i_o_ss;
w_ss=pH_ss*(1-alpha-gamma)*yH_ss/h_ss;
y_ss=pH_ss*yH_ss/(1-sCo_ss);
yCo_ss=sCo_ss*y_ss/pCostar_ss;
g_c_ss=sg_ss*y_ss/p_ss;
g_i_bar=g_i_ss;
g_c_bar=g_c_ss;
b_star_ss=b_bar*y_ss;
f_star_ss = sf_ss*y_ss;
//tb_ss = stb_ss*y_ss;
//f_star_ss = ((1-chi)*pCostar_ss*yCo_ss - tb_ss)/(1-Rstar_ss*xi_bar/a_ss) - b_star_ss;
f_star_o_ss=f_star_ss/(1-omega);
tb_ss = (1-chi)*pCostar_ss*yCo_ss - (1-Rstar_ss*xi_bar/a_ss)*(f_star_ss + b_star_ss);
fb_star_bar= (f_star_ss+b_star_ss)/y_ss;
c_ss=(y_ss-tb_ss)/p_ss-i_ss-g_c_ss-g_i_ss;
yC_ss=c_ss+i_ss+g_c_ss+g_i_ss;
xF_ss=o*(1/p_ss)^(-eta)*yC_ss;
xH_ss=(1-o)*(pH_ss/p_ss)^(-eta)*yC_ss;
yF_ss=xF_ss;
xHstar_ss=(tb_ss-pCostar_ss*yCo_ss+yF_ss)/pH_ss;
o_star=xHstar_ss/(pH_ss^(-eta_star)*y_star_ss);
pi_ss=pH_ss*gamma*yH_ss;
tr_ss = str_ss*y_ss;
T_ss = -(chi*pCostar_ss*yCo_ss+b_star_ss+tau_n_ss*w_ss*(1-omega)*h_o_ss+tau_k_ss*(rK_ss-delta)*k_ss/a_ss+tau_c_ss*p_ss*c_ss-p_ss*g_c_ss-p_ss*g_i_ss-Rstar_ss*xi_bar*b_star_ss/a_ss-tr_ss)/(1-omega);
tr_bar=tr_ss;
tr_o_ss=(1-omega_G)/(1-omega)*tr_ss;
tr_r_ss=omega_G/omega*tr_ss;
c_r_ss=(w_ss*h_r_ss + tr_r_ss)/((1+tau_c_ss)*p_ss);
c_o_ss=(c_ss-omega*c_r_ss)/(1-omega);
c_hat_o_ss=((1-o_c)^(1/eta_c)*(c_o_ss-varsigma*c_o_ss/a_ss)^((eta_c-1)/eta_c) + o_c^(1/eta_c)*(g_c_ss)^((eta_c-1)/eta_c))^(eta_c/(eta_c-1));
c_hat_r_ss=((1-o_c)^(1/eta_c)*(c_r_ss-varsigma*c_r_ss/a_ss)^((eta_c-1)/eta_c) + o_c^(1/eta_c)*(g_c_ss)^((eta_c-1)/eta_c))^(eta_c/(eta_c-1));
chitil_o_ss=c_hat_o_ss^sigma;
chitil_r_ss=c_hat_r_ss^sigma;
Theta_o_ss=1;
Theta_r_ss=1;
lam_o_ss=c_hat_o_ss^(-sigma)/((1+tau_c_ss)*p_ss)*((1-o_c)*c_hat_o_ss/(c_o_ss-varsigma*c_o_ss/a_ss))^(1/eta_c);
lam_r_ss=c_hat_r_ss^(-sigma)/((1+tau_c_ss)*p_ss)*((1-o_c)*c_hat_r_ss/(c_r_ss-varsigma*c_r_ss/a_ss))^(1/eta_c);
kappa_o_ss=lam_o_ss*(1-tau_n_ss)*w_ss/h_o_ss^phi;
kappa_r_ss=lam_r_ss*w_ss/h_r_ss^phi;
gdp_nco_ss = pH_ss*yH_ss/p_ss;
b_y_ss = b_star_ss/(4*y_ss);
f_y_ss = f_star_ss/(4*y_ss);
debt_agg_y_ss = (f_star_ss + b_star_ss)/(4*y_ss);
xi_a_ss = xi_bar^4-1;
w_r_ss = w_ss/p_ss;
g_c_y_ss = p_ss*g_c_ss/y_ss;
g_i_y_ss = p_ss*g_i_ss/y_ss;
tr_y_ss = tr_ss/y_ss;


//initial values for numerical solver 
lam_o=lam_o_ss;
c_hat_o=c_hat_o_ss;
c_o=c_o_ss;
h_o=h_o_ss;
i_o=i_o_ss;
k_o=k_o_ss;
f_star_o=f_star_o_ss;
Theta_o=Theta_o_ss;
chitil_o=chitil_o_ss;
lam_r=lam_r_ss;
c_hat_r=c_hat_r_ss;
c_r=c_r_ss;
h_r=h_r_ss;
Theta_r=Theta_r_ss;
chitil_r=chitil_r_ss;
c=c_ss;
h=h_ss;
i=i_ss;
k=k_ss;
f_star=f_star_ss;
q=q_ss;
w=w_ss;
rK=rK_ss;
y=y_ss;
yC=yC_ss;
yF=yF_ss;
yH=yH_ss;
xF=xF_ss;
xH=xH_ss;
xHstar=xHstar_ss;
pi=pi_ss;
pH=pH_ss;
p=p_ss;
tb=tb_ss;
xi=xi_bar;
b_star=b_star_ss;
tau_k=tau_k_ss;
tau_n=tau_n_ss;
tau_c=tau_c_ss;
tau_k_bar=tau_k_ss;
tau_n_bar=tau_n_ss;
tau_c_bar=tau_c_ss;
k_g=k_g_ss;
g_c=g_c_ss;
g_i=g_i_ss;
tr=tr_ss;
tr_o=tr_o_ss;
tr_r=tr_r_ss;
gdp_nco = gdp_nco_ss;
b_y = b_y_ss;
f_y = f_y_ss;
debt_agg_y = debt_agg_y_ss;
xi_a = xi_a_ss;
w_r = w_r_ss;
g_c_y = g_c_y_ss;
g_i_y = g_i_y_ss;
tr_y = tr_y_ss;


v=v_ss;
kappa_o=kappa_o_ss;
kappa_r=kappa_r_ss;
u=u_ss;
z=z_ss;
a=a_ss;
zeta=zeta_ss;
Rstar=Rstar_ss;
pCostar=pCostar_ss;
yCo=yCo_ss;
y_star=y_star_ss;


yNCo = y_ss-pCostar_ss*yCo_ss;
gam_YNCo=a_ss;
gama_YNCo =a_ss^4;
gam_C=a_ss;
gam_I=a_ss;
gam_G=a_ss;
gam_YCo=a_ss; 
gam_Ystar=a_ss; 
gam_pCostar=1;
gam_Ig=a_ss;
ratio_BY=b_star_ss*(1-1/a_ss)/y_ss;
ratio_FY=f_star_ss*(1-1/a_ss)/y_ss;
rer=1/p_ss;
ratio_TBY=tb_ss/y_ss;
gam_TR=a_ss;


gam_YNCo_obs=0;
gama_YNCo_obs=0;
gam_C_obs=0;
gam_I_obs=0;
xi_obs=0;
pCostar_obs=0;
YCo_obs=0;
gam_G_obs=0;
gam_Ig_obs=0;
//ratio_BY_obs=0;
//ratio_FY_obs=0;
ratio_TBY_obs=0;
//gam_rer_obs=0;
Rstar_obs=0;
Ystar_obs=0; 
gam_TR_obs=0;
hours_obs = 0;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

steady;
check;

varobs gam_YNCo_obs gam_C_obs gam_I_obs xi_obs pCostar_obs YCo_obs Rstar_obs Ystar_obs gam_G_obs gam_Ig_obs gam_TR_obs ratio_TBY_obs hours_obs;




shocks;
// Structural shocks
var eps_v = sig_v^2;
var eps_kappa = sig_kappa^2;
var eps_u = sig_u^2;
var eps_z = sig_z^2;
var eps_a = sig_a^2;
var eps_zeta = sig_zeta^2;
var eps_yCo = sig_yCo^2;
var eps_Rstar = sig_Rstar^2;
var eps_y_star = sig_y_star^2;
var eps_pCostar = sig_pCostar^2;
var eps_g_c = sig_g_c^2;
var eps_g_i = sig_g_i^2;
var eps_TR = sig_TR^2;

// Measurement errors; variance calibrated to 10% of the variance of the observable 
var eps_gam_YNCo_obs    = 0.000277994*0.1; 
var eps_gam_C_obs       = 0.000368488*0.1;
var eps_gam_I_obs       = 0.001211819*0.1;
//var eps_xi_obs          = 0.000189553*0.1;
var eps_xi_obs          = 0;
//var eps_pCostar_obs     = 0.157291026*0.1;
var eps_pCostar_obs     = 0;
//var eps_YCo_obs         = 0.4941115*0.1;
var eps_YCo_obs         = 0;
//var eps_gam_G_obs       = 0.001090118*0.1;
var eps_gam_G_obs       = 0;
//var eps_Rstar_obs       = 1.32331E-05*0.1;
var eps_Rstar_obs       = 0;
//var eps_Ystar_obs       = 0.000129497*0.1;
var eps_Ystar_obs       = 0;
//var eps_ratio_BY_obs    = 0.0025*(1-1/0.79)^2;               % According to FMI, July 2022, of total public debt, 79% (35.5/45.1) is external in 2027. Hence b_external = 0.79*b_total.
//var eps_ratio_FY_obs    = 0.000291562*(1-1/0.11)^2;          % According to FMI, July 2022, total credit to the private sector is 50.9% of GDP whereas private external debt is 6.4% in 2027. Hence f_external = 0.11*f_total
//var eps_gam_Ig_obs      = 0.037611725*0.1;
var eps_gam_Ig_obs      = 0;
//var eps_gam_TR_obs      = 0.024863619*0.1;
var eps_gam_TR_obs      = 0;
var eps_ratio_TBY_obs   = 0.000396066*0.1;
var eps_hours_obs       = 0.000397321*0.1;
var eps_gama_YNCo_obs   = 0.002371601*0.1;

end;

shock_groups;

Technology  = eps_u, eps_z, eps_a;

Foreign = eps_Rstar, eps_y_star;

Oil = eps_pCostar, eps_yCo;

Risk = eps_zeta;

Preference = eps_v, eps_kappa;

Fiscal = eps_g_c, eps_g_i, eps_TR;

Measurement = eps_gam_YNCo_obs, eps_gam_C_obs eps_gam_I_obs, eps_xi_obs, 
                    eps_pCostar_obs, eps_YCo_obs, eps_gam_G_obs, eps_Rstar_obs, 
                    eps_Ystar_obs, eps_gam_Ig_obs, 
                    eps_gam_TR_obs, eps_ratio_TBY_obs, eps_hours_obs eps_gama_YNCo_obs;

end;

estimated_params;
 
//Deep parameters
phi,                , 0, inf, normal_pdf, 0.1, 2;     // Inverse Frisch Elasticity. Prior chose to match the volatility of hours under the prior.
varsigma,           , 0 , 1 , normal_pdf, 0.9, 0.2;   // Habit formation. Posterior from Guerra-Salas et al (2021)   
hpsi,               , 0, inf, normal_pdf, 0.5, 10;    // 100 Times Elasticity of Country Premium. Prior to match volatility of country premium under priors
eta,                , 0, inf, normal_pdf, 3, 2;       // Elasticity of Substitution Between Home and Foreign Goods. Prior to match volatility of output growth under priors
gamma_k,            , 0, inf, normal_pdf, 6, 10;      // Investment Adjustment Cost Parameter. Posterior from Smets and Wouters (2003) and Coenen et al (2013)
eta_c,              , 0, inf, normal_pdf, 1.5, 2;     // Elasticity of Substitution Between Private and Government Consumption. Posterior from Coenen et al (2013)
upsilon,            , 0 , 1 , normal_pdf, 0.5, 0.5;   // Preference shifter controlling income effect on labor. Prior chose to match the volatility of hours under the prior.
//beta_zeta_pCostar,  normal_pdf, -0.5, 10;             // 100 times the effect of pCostar on zeta

//AR coefficients
rho_v,               beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021)  
rho_kappa,           beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021) 
rho_u,               beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021) 
rho_z,               beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021) 
rho_a,               beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021) 
rho_zeta,            beta_pdf, 0.75, 0.15;    // Prior from Guerra-Salas et al (2021) 
   

// Innovation std. deviations
stderr eps_v,           inv_gamma_pdf, 1, inf;      // Prior to match overall volatility of observables under the prior
stderr eps_kappa,       inv_gamma_pdf, 4, inf;      // Prior to match overall volatility of observables under the prior  
stderr eps_u,           inv_gamma_pdf, 1, inf;      // Prior to match overall volatility of observables under the prior  
stderr eps_z,           inv_gamma_pdf, 0.1, inf;    // Prior to match overall volatility of observables under the prior 
stderr eps_a,           inv_gamma_pdf, 0.1, inf;    // Prior to match overall volatility of observables under the prior 
stderr eps_zeta,        inv_gamma_pdf, 0.9, inf;    // Prior to match overall volatility of observables under the prior

//Fiscal parameters
rho_g_c,             0.700008, 0, 1, normal_pdf, 0.700008, 1;   // Prior mean from external estimation 
stderr eps_g_c,      inv_gamma_pdf, 0.027061, inf;              // Prior mean from external estimation 
alpha_g_c,           normal_pdf, 0.133003, 2;                   // Prior from external estimation (not significant)
gamma_g_c,           -0.005595,-inf,0,normal_pdf,-0.005595, 2;  // Prior from external estimation (not significant)

rho_g_i,              0.475066, 0, 1, normal_pdf, 0.475066, 1;  // Prior mean from external estimation (significant)
stderr eps_g_i,       inv_gamma_pdf,0.152928, inf;              // Prior mean from external estimation 
alpha_g_i,            normal_pdf, 1.771814, 2;                  // Prior from external estimation (significant)
gamma_g_i,            -0.128020,-inf,0,normal_pdf,-0.128020, 2; // Prior from external estimation (not significant)

rho_TR,              0.371415, 0, 1, normal_pdf, 0.371415, 1;   // Prior mean from external estimation (significant)
stderr eps_TR,       inv_gamma_pdf, 0.097554, inf;              // Prior mean from external estimation 
alpha_TR,            normal_pdf, 3.519944, 2;                   // Prior from external estimation (significant)
gamma_TR,           -0.348167,-inf,0,normal_pdf,-0.348167, 2;   // Prior from external estimation (not significant)

end;      


 
set_dynare_seed('clock'); //use to make sure estimation is consistent across different proposal values 

estimated_params_init; // From priors
phi,	            0.1;
varsigma,	        0.9;
hpsi,	            0.5;
eta,	            3;
gamma_k,	        6;
eta_c,	            1.5;
upsilon,            0.5;
rho_v,	            0.75;
rho_kappa,	        0.75;
rho_u,	            0.75;
rho_z,	            0.75;
rho_a,	            0.75;
rho_zeta,	        0.75;
rho_g_c,	        0.700008;
alpha_g_c,	        0.133003;
gamma_g_c,	        -0.005595;
rho_g_i,	        0.475066;
alpha_g_i,	        1.771814;
gamma_g_i,	        -0.128020;
rho_TR,	            0.371415;
alpha_TR,	        3.519944;
gamma_TR,	        -0.348167;
stderr eps_v,	    1;
stderr eps_kappa,	4;
stderr eps_u,	    1;
stderr eps_z,	    0.1;
stderr eps_a,	    0.1;
stderr eps_zeta,	0.9;
stderr eps_g_c,	    0.027061;
stderr eps_g_i,	    0.152928;
stderr eps_TR,	    0.097554;

end;

M_.hessian_eq_zero=0;
options_.Opt6Numb= 50000;

//estimation(datafile='../../data/analysis/estim_data.xlsx', mode_compute=6, mh_replic=500000, mh_jscale=.25, mh_nblocks=1, mh_drop=0.5, plot_priors=0, cova_compute=1);
//estimation(datafile='../../data/analysis/estim_data.xlsx', mode_file = 'SOE_Estimation_mh_mode.mat', mode_compute=0, mh_replic=500000, mh_jscale=0.25, mh_nblocks=2, mh_drop=0.5, plot_priors=0);

//identification(parameter_set=posterior_mean);
   

mymap = [1 0 0 ;0 1 0; 0 0 1;0 0 0; 1 1 0; .588 .294 0 ; 0 1 1;.96 .96 .96 ];

//shock_decomposition(datafile='../../data/analysis/estim_data.xlsx',parameter_set=calibration, use_shock_groups, colormap=mymap, nograph) gam_YNCo_obs gam_C_obs gam_I_obs hours_obs
//xi_obs pCostar_obs YCo_obs gam_G_obs Rstar_obs Ystar_obs gam_Ig_obs gam_TR_obs ratio_TBY_obs gama_YNCo_obs;


stoch_simul(order=1, irf=20,nograph);









