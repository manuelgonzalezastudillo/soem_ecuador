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
lam_o             % Optimizer Marginal Utility of Consumption
c_hat_o           % Optimizer Consumption Composite
c_o               % Optimizer Private Consumpion of Final Good
h_o               % Optimizer Labor Supply
i_o               % Optimizer Investment
k_o               % Optimizer Capital Stock 
f_star_o          % Optimizer Foreign Debt in Terms of Foregin Good
Theta_o           % Optimizer Wealth Effect on Labor Supply 1
chitil_o          % Optimizer Wealth Effect on Labor Supply 2
lam_r             % Rule of Thumb Marginal Utility of Consumption
c_hat_r           % Rule of Thumb Consumption Composite
c_r               % Rule of Thumb Private Consumption of Final Good
h_r               % Rule of Thumb Labor Supply;
Theta_r           % Rule of Thumb  Wealth Effect on Labor Supply 1 
chitil_r          % Rule of Thumb  Wealth Effect on Labor Supply 2
c                 % Aggregate Private Consumption of Final Good
h                 % Aggregate Labor Supply
i                 % Aggregate Private Investment in Terms of Final Good
k                 % Aggregarw Public Capital
f_star            % Aggregate Private Foreign Debt in Terms of Foreign Good
q                 % Tobins q
w                 % Wage in Terms of Foreign Good
rK                % Return to Private Capitalin Terms of Foreigh Good
y                 % GDP in Termss of Foreign Good
yC                % Final Good
yF                % Imports
yH                % Production of Home Good
xF                % Foreign Good Input to Final Good
xH                % Home Good Input to Final Good
xHstar            % Foreign Purcahses of Home Good
pi                % Profits for Home Good Producer in Terms of Foreign Good
pH                % Price of Home Good in Terms of Foreign Good
p                 % Price of Final Good in Terms of Foreign Good
tb                % Trade Balance in Terms of Foreign Good
xi                % Country Premium
tau_k             % Capital Tax Rate
tau_n             % Labor Tax Rate
tau_c             % Consumption Tax Rate
k_g               % Government Capital
g_c               % Government Consumption of Final Good
g_i               % Government Investment Using Final Good
tr                % Aggregate Transfers in Terms of Foreign Good
tr_o              % Transfers to Optimizer in Terms of Foreign Good
tr_r              % Transfers to Rule of Thumb in Terms of Foreign Good
b_star            % Government Foreign Debt in Terms of Foreign Good
gdp               % GDP in Terms of Domestic Good
debt_agg_y        % Annual Aggreagte Debt to GDP in Terms of Domestic Good
capital_agg       % Capital Portion of Home Production Function
welfare_o         % Spot Utility of Optimizer
welfare_r         % Spot Utility of Rule of Thumb
ce_o              % Consumption Equivalent Change in Spot Utility for Optimizer 
ce_r              % Consumption Equivlaent Change in Spot Utility for Rule of Thumb
t_revenue         % Tax Revenue in Terms of Foreign Good
o_revenue         % Oil Revenue in Terms of Foreign Good
spending          % Spending in Terms of Foreign Good
b_y               % Annual Foregin Government Debt to GDP Ratio
f_y               % Annual Foreign Private Debt to GDP Ratio
tR_y              % Tax Revenue Over GDP
oR_y              % Oil Revenue Over GDP
g_c_y             % Government Consumption Over GDP
g_i_y             % Government Investment Over GDP
tr_y              % Transfers Over GDP
S_y               % Spending Over GDP
primary_balance_y % Primary Balance Over GDP
interest_y        % Interest Payments Over GDP
revenue           % Total Revenue
R_y               % Revenue Over GDP
xi_a              % Annual Net Country Premium
w_r               % Wage in Terms of Final Good
gdp_nco           % Non-Oil GDP in Terms of Final Good
tau_c_y           % Consumption Tax Revenue Over GDP
tau_n_y           % Labor Tax Revenue Over GDP
tau_k_y           % Capital Tax Revenue Over GDP
R                 % Domestic Interest Rate




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
gam_YNCo            % Growth Rate of Non-oil GDP
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
gam_C_obs           % Observed Demeaned gam_C
gam_I_obs           % Observed Demeaned gam_I
xi_obs              % Observed Demeaned xi
pCostar_obs         % Observed Demeaned pCostar
YCo_obs             % Observed Demeaned YCo
gam_G_obs           % Observed Demenaed gam_G
ratio_BY_obs        % Observed Demeaned ratio_BY
Rstar_obs           % Observed Demeaned Rstar
Ystar_obs           % Observed Demeaned Ystar
gam_Ig_obs          % Observed Demenaed gam_Ig
gam_TR_obs          % Observed Demeaned gam_TR
ratio_TBY_obs       % Observed Demeaned Ratio_TBY
ratio_FY_obs        % Observed Demeaned Ratio_FY
hours_obs           % Observed Demeaned Hours
;


    
// Exogenous innovations 
varexo 
eps_tau_c           % Shock to Consumption Tax
eps_tau_n           % Shock to Labor Tax
eps_tau_k           % Shock to Capital Tax
eps_g_c             % Shock to Government Consumption
eps_g_i             % Shock to Government Investment 
eps_TR              % Shock to Transfers
eps_pCostar         % Shock to Oil Price
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
mu        % Pass through from foreing to domestic interest rate

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
rho_tau_c % Persistence of Consumption Tax
rho_tau_n % Persistence of Labor Tax
rho_tau_k % Persistence of Capital Tax
sig_tau_c % SD of Consumption Tax
sig_tau_n % SD of Labor Tax
sig_tau_k % SD of Capital Tax
sig_pCostar % SD of oil price shock

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
fb_star_bar      % Steady State Aggregate Debt
y_ss             % Steady State GDP
b_star_ss        % Steady State Foreign Government Debt
f_star_ss        % Steady State Foreign Private Deby
tb_ss            % Steady State Trade Balance
h_ss             % Steady State Aggregate Hours
welfare_o_ss     % Steady State Optimizer Spot Utility
welfare_r_ss     % Steady State Rule of Thumb Spot Utility
;



// Calibrated parameters (Endogenous: beta, kappa_o_ss, kappa_r_ss, o_star, g_c_bar, g_i_bar, yCo_ss, fb_star_bar, tr_bar, 
// k_r, y_ss, b_star_ss, f_star_ss, tb_ss, h_ss)

sigma=1.000000001;       // log utility (Medina and Soto, 2007)              
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
sig_pCostar = sqrt(0.036797);       // significant
mu = 1;


//Tax parameters
rho_tau_c = .999;
sig_tau_c = .01;

rho_tau_n = .999;
sig_tau_n = .01;

rho_tau_k = .999;
sig_tau_k = .01;


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

[name='Domestic Interest Rate']
R = Rstar_ss*xi_bar + mu*(Rstar*xi-Rstar_ss*xi_bar);

[name='Optimizer Euler Equation']
lam_o = beta/a^sigma*R*v(+1)/v*lam_o(+1); 

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
f_star + b_star = R(-1)*f_star(-1)/(a(-1)) + Rstar(-1)*xi(-1)*b_star(-1)/a(-1) - tb + (1-chi)*pCostar*yCo; 

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

[name='Transfers to Optimizers']
tr_o = (1-omega_G)/(1-omega)*tr; 

[name='Transfers to Rule of Thumb']
tr_r = (omega_G/omega)*tr; 

[name='Profits of Home Good Producer']
pi = pH*gamma*yH; 

[name='Evolution of Government Capital']
k_g = (1-delta_g)*k_g(-1)/a(-1) + g_i; 

[name='Consumption Tax']
tau_c = rho_tau_c*tau_c(-1) + (1-rho_tau_c)*tau_c_bar + eps_tau_c; 

[name='Labor Tax']
tau_n = rho_tau_n*tau_n(-1) + (1-rho_tau_n)*tau_n_bar + eps_tau_n;

[name='Capital Tax']
tau_k = rho_tau_k*tau_k(-1) + (1-rho_tau_k)*tau_k_bar + eps_tau_k;

[name='Government Investment Rule']
g_i = (g_i(-1))^(rho_g_i)*(g_i_bar*(y/y_ss)^alpha_g_i*(b_star(-1)/y(-1)/b_bar)^gamma_g_i)^(1-rho_g_i)*exp(eps_g_i); 

[name='Government Consumption Rule']
g_c = (g_c(-1))^(rho_g_c)*(g_c_bar*(y/y_ss)^alpha_g_c*(b_star(-1)/y(-1)/b_bar)^gamma_g_c)^(1-rho_g_c)*exp(eps_g_c); 

[name='Government Transfers Rule']
tr = (tr(-1))^(rho_TR)*(tr_bar*(y/y_ss)^alpha_TR*(b_star(-1)/y(-1)/b_bar)^gamma_TR)^(1-rho_TR)*exp(eps_TR); 

[name='Rule of Thumb Budget Constraint']
(1+tau_c)*p*c_r = w*h_r + tr_r; 

[name='Real GDP']
gdp = y/p;

[name='Annual Aggregate Debt to GDP']
debt_agg_y = (f_star + b_star)/(4*y);

[name='Aggregate Capitak']
capital_agg = (k_g(-1)/a(-1))^gamma*(k(-1)/a(-1))^alpha;

[name='Optimizer Spot Utility']
welfare_o = 1/(1-sigma)*c_hat_o^(1-sigma) - Theta_o*a^(1-sigma)*kappa_o*h_o^(1+phi)/(1+phi);

[name='Rule of Thumb Spot Utiluty']
welfare_r = 1/(1-sigma)*c_hat_r^(1-sigma) - Theta_r*a^(1-sigma)*kappa_r*h_r^(1+phi)/(1+phi);

[name='Optimizer Consumption Equivalent Utility']
ce_o = 1-((1-sigma)*(welfare_o_ss + Theta_o*a^(1-sigma)*kappa_o*h_o^(1+phi)/(1+phi)))^(1/(1-sigma))/(c_hat_o);

[name='Rule of Thumb Consumption Equivalent Utility']
ce_r = 1-((1-sigma)*(welfare_r_ss + Theta_r*a^(1-sigma)*kappa_r*h_r^(1+phi)/(1+phi)))^(1/(1-sigma))/(c_hat_r);

[name='Tax Revenue']
t_revenue =  tau_n*w*(1-omega)*h_o + tau_k*(rK-delta)*k(-1)/a(-1) + tau_c*p*c + T_ss*(1-omega) ;

[name='Oil Revenue']
o_revenue = chi*pCostar*yCo;

[name='Revenue']
revenue = t_revenue + o_revenue;

[name='Spending']
spending = p*g_i + p*g_c + tr;

[name= 'Annual Government Debt to GDP']
b_y = b_star/(4*y); //annual debt to GDP

[name='Annual Private Debt to GDP']
f_y = f_star/(4*y);

[name='Government Consumption to GDP']
g_c_y = g_c/gdp;

[name='Government Investment to GDP']
g_i_y = g_i/gdp;

[name='Transfers to GDP']
tr_y = tr/y;

[name= 'Tax Revenue to GDP']
tR_y = t_revenue/y;

[name='Oil Revenue to GDP']
oR_y = o_revenue/y;

[name='Revenue to GDP']
R_y = revenue/y;

[name='Spending to GDP']
S_y = spending/y;

[name='Primary Balance to GDP']
primary_balance_y = (t_revenue + o_revenue - spending)/y;

[name='Interest Payments to GDP']
interest_y = ((xi(-1)*Rstar(-1)-1)*b_star(-1)/a(-1))/y;

[name='Annual Net Country Premium ']
xi_a = xi^4-1;

[name='Real Wage']
w_r = w/p;

[name='Real Non-Oil GDP']
gdp_nco = pH*yH/p;

[name='Consumption Tax Revenue to GDP']
tau_c_y = tau_c*p*c/y;

[name = 'Labor Tax Revenue to GDP']
tau_n_y = tau_n*w*(1-omega)*h_o/y; 

[name='Capital Tax Revenue to GDP']
tau_k_y = tau_k*(rK-delta)*k(-1)/a(-1)/y;



// Exogenous AR(1) processes  

[name='Time Preference Shifter Process']
log(v)-log(v_ss)=rho_v*(log(v(-1))-log(v_ss));

[name='Optimizer Labor Supply Preference Shifter Process']
log(kappa_o)-log(kappa_o_ss)=rho_kappa*(log(kappa_o(-1))-log(kappa_o_ss));

[name='Rule of Thumb Labor Supply Preference Shifter Process']
log(kappa_r)-log(kappa_r_ss)=rho_kappa*(log(kappa_r(-1))-log(kappa_r_ss));

[name='Investment Specific Productivity Process']
log(u)-log(u_ss)=rho_u*(log(u(-1))-log(u_ss));

[name='TFP Process']
log(z)-log(z_ss)=rho_z*(log(z(-1))-log(z_ss));

[name='Growth Rate Process']
log(a)-log(a_ss)=rho_a*(log(a(-1))-log(a_ss));

[name='Oil Quantity Process']
log(yCo)-log(yCo_ss)=rho_yCo*(log(yCo(-1))-log(yCo_ss));

[name='Idiosyncratic Component of Country Premium Process']
log(zeta)-log(zeta_ss)=rho_zeta*(log(zeta(-1))-log(zeta_ss));

[name='Foreign Inerest Rate Process']
log(Rstar)-log(Rstar_ss)=rho_Rstar*(log(Rstar(-1))-log(Rstar_ss));

[name='Foreign GDP Process']
log(y_star)-log(y_star_ss)=rho_y_star*(log(y_star(-1))-log(y_star_ss));

[name='Oil Price Process']
log(pCostar)-log(pCostar_ss)=rho_pCostar*(log(pCostar(-1))-log(pCostar_ss)) + eps_pCostar;


// Definitions For Observables
[name='Non-oil GDP in Terms of Foreign Goods']
yNCo=y-pCostar*yCo; 

[name='Growth Rate of Non-oil GDP in Terms of Foreign goods']
gam_YNCo=yNCo/yNCo(-1)*a(-1);

[name='Growth Rate of Private Consumption in  terms of Foreign Goods']
gam_C= (p*c)/(p(-1)*c(-1))*a(-1);

[name='Growth Rate of Total Investment in Terms of Foreign Goods']
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
//data is demeaned

[name='Growth Rate of Non-oil GDP (Observation)']
gam_YNCo_obs = gam_YNCo-a_ss;   

[name='Growth Rate of Private Consumption (Observation)']
gam_C_obs = gam_C-a_ss;         

[name='Growth Rate of Total Investment (Observation)']
gam_I_obs = gam_I-a_ss ;         

[name='Country Premium (Observation)']
xi_obs = xi-xi_bar ;          

[name='Oil Price (Observation)']
pCostar_obs = log(pCostar)-log(pCostar_ss) ; 

[name='Oil Quantity (Observation)']
YCo_obs = log(yCo)-log(yCo_ss) ;

[name='Foreign Interest Rate (Observation)']
Rstar_obs = log(Rstar)-log(Rstar_ss) ;         

[name='Foreign GDP (Observation)']
Ystar_obs = log(y_star)-log(y_star_ss); 

[name='Change in Government Debt Over GDP (Observation)']
ratio_BY_obs = ratio_BY-b_star_ss*(1-1/a_ss)/y_ss ;

[name='Change in Private Debt Pver GDP (Observation)']
ratio_FY_obs = ratio_FY-f_star_ss*(1-1/a_ss)/y_ss;

[name='Growth Rate of Government Consumption (Observation)']
gam_G_obs= gam_G-a_ss;

[name='Growth Rate of Government Investment (Observation)']
gam_Ig_obs = gam_Ig-a_ss ;

[name='Growth Rate of Transfers (Observation)']
gam_TR_obs = gam_TR-a_ss ;

[name='Trade Balance Over GDP (Observation)']
ratio_TBY_obs = ratio_TBY-tb_ss/y_ss ;

[name='Hours (Observation)']
hours_obs = log(h) - log(h_ss) ;




//Notes on observation equations and data:
//1. The price of the foreign good is the numeraire, so the observed data should be nominal data deflated by some foreign price index,
//   such as the US GDP deflator or US PPI, and NOT real data from national accounts or other sources.
//2. In the model, the foreign interest rate and risk premium are expressed on a gross quarterly basis, and not on the conventional net annual basis.
//3. Furthermore, the sovereign risk premium is conventionally quoted in basis points on a net annual basis, e.g. 200 basis points.
//4. To transform an interest rate (e.g., LIBOR in %) from net annual to gross quarterly, do (1+LIBOR/100)^(1/4).
//5. To transform risk premium (e.g. EMBI in bp) from net annual to gross quarterly, do (1+EMBI/10000)^(1/4). 

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
gdp_ss = y_ss/p_ss;
debt_agg_y_ss = (f_star_ss + b_star_ss)/(4*y_ss);
capital_agg_ss = (k_g_ss/a_ss)^gamma*(k_ss/a_ss)^alpha;
welfare_o_ss = 1/(1-sigma)*c_hat_o_ss^(1-sigma) - Theta_o_ss*a_ss^(1-sigma)*kappa_o_ss*h_o_ss^(1+phi)/(1+phi);
welfare_r_ss = 1/(1-sigma)*c_hat_r_ss^(1-sigma) - Theta_r_ss*a_ss^(1-sigma)*kappa_r_ss*h_r_ss^(1+phi)/(1+phi);
ce_o_ss = 0;
ce_r_ss = 0;
t_revenue_ss =  tau_n_ss*w_ss*(1-omega)*h_o_ss + tau_k_ss*(rK_ss-delta)*k_ss/a_ss + tau_c_ss*p_ss*c_ss + T_ss*(1-omega);
o_revenue_ss = chi*pCostar_ss*yCo_ss;
revenue_ss = t_revenue_ss + o_revenue_ss;
spending_ss = p_ss*g_i_ss + p_ss*g_c_ss + tr_ss;
b_y_ss = b_star_ss/(4*y_ss);
f_y_ss = f_star_ss/(4*y_ss);
g_c_y_ss = g_c_ss/gdp_ss;
g_i_y_ss = g_i_ss/gdp_ss;
tr_y_ss = tr_ss/y_ss;
oR_y_ss = o_revenue_ss/y_ss;
tR_y_ss = t_revenue_ss/y_ss;
S_y_ss = spending_ss/y_ss;
primary_balance_y_ss = (o_revenue_ss + t_revenue_ss - spending_ss)/y_ss;
interest_y_ss = ((xi_bar*Rstar_ss-1)*b_star_ss/a_ss)/y_ss;
R_y_ss = revenue_ss/y_ss;
xi_a_ss = xi_bar^4-1;
w_r_ss = w_ss/p_ss;
gdp_nco_ss = pH_ss*yH_ss/p_ss;
tau_c_y_ss = tau_c_ss*p_ss*c_ss/y_ss;
tau_n_y_ss = tau_n_ss*w_ss*(1-omega)*h_o_ss/y_ss;
tau_k_y_ss = tau_k_ss*(rK_ss-delta)*k_ss/a_ss/y_ss;
R_ss = xi_bar*Rstar_ss;



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
gdp = gdp_ss;
debt_agg_y = debt_agg_y_ss;
capital_agg = capital_agg_ss;
welfare_o = welfare_o_ss;
welfare_r = welfare_r_ss;
ce_o = ce_o_ss;
ce_r = ce_r_ss;
t_revenue = t_revenue_ss;
o_revenue = o_revenue_ss;
revenue = revenue_ss;
spending = spending_ss;
b_y = b_y_ss;
f_y = f_y_ss;
g_c_y = g_c_y_ss;
g_i_y = g_i_y_ss;
tr_y = tr_y_ss;
tR_y = tR_y_ss;
oR_y = oR_y_ss;
S_y = S_y_ss;
primary_balance_y = primary_balance_y_ss;
interest_y = interest_y_ss;
R_y = R_y_ss;
xi_a = xi_a_ss;
w_r = w_r_ss;
gdp_nco = gdp_nco_ss;
tau_c_y = tau_c_y_ss;
tau_n_y = tau_n_y_ss;
tau_k_y = tau_k_y_ss;
R = R_ss;






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
gam_C_obs=0;
gam_I_obs=0;
xi_obs=0;
pCostar_obs=0;
YCo_obs=0;
gam_G_obs=0;
gam_Ig_obs=0;
ratio_BY_obs=0;
ratio_FY_obs=0;
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

shocks;
// Structural shocks
var eps_tau_c = sig_tau_c^2;
var eps_tau_n = sig_tau_n^2;
var eps_tau_k = sig_tau_k^2;
var eps_g_c = sig_g_c^2;
var eps_g_i = sig_g_i^2;
var eps_TR = sig_TR^2;
var eps_pCostar = sig_pCostar^2;

 

end;

stoch_simul(order=1, irf=81, nograph);














