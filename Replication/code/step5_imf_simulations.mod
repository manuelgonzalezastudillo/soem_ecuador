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
k_g               % Government Capital
tr_o              % Transfers to Optimizer in Terms of Foreign Good
tr_r              % Transfers to Rule of Thumb in Terms of Foreign Good
b_star            % Government Foreign Debt in Terms of Foreign Good
gdp               % GDP in Terms of Domestic Good
debt_agg_y        % Annual Aggreagte Debt to GDP in Terms of Domestic Good
capital_agg       % Capital Portion of Home Production Function
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
tau_c             % Consumption Tax
tau_n             % Labor Tax
tau_k             % Capital Tax
g_c               % Government Consumption
g_i               % Government Investment 
tr                % Transfers
ratio_BY          % Deficit over GDP
ratio_TBY         % Trade Balance over GDP


// Exogenous state variables 
v             % Time Preference Shifter
kappa_o       % Optimizer Labor Preference Shifter
kappa_r       % Rule of Thumb Labor Preference Shifter
u             % Productivity of Investment Process
z             % TFP 
a             % Growth Rate of Labor Productivity (and the Enitre Economy)
zeta          % Idiosyncratic Component of Risk Premium
Rstar         % Foreign Interest Rate in Terms of Foreign Good
y_star        % Foreign GDP in Terms of Foreign Good
;

    
// Exogenous innovations 
varexo 
eps_tau_c           % Consumption Tax shock
eps_tau_n           % Labor Tax shock
eps_tau_k           % Capital Tax shock
eps_g_c             % Government Consumption shock
eps_g_i             % Investment shock
eps_tr              % Transfers shock
eps_o_revenue       % Oil Revenue shock
ind_imf             % Indicator for IMF consolidation
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
mu        % Pass through from foreign to domestic interest rate


g_c_bar   % Steady State Government Consumption
g_i_bar   % Government Investment steady state
tr_bar    % Transfers steady state
alpha_g_i % Reaction of Government Spending to Output Gap
gamma_g_i % Reaction of Government Spending to Debt
alpha_g_c % Reaction of Government Consumption to Output Gap
gamma_g_c % Reaction of  Government Consumption to Debt 
alpha_TR  % Reaction of Transfers to Output Gap
gamma_TR  % Reaction of Transfers to Debt
rho_g_i   % Persistence of Government Investment 
rho_g_c   % Persistence of Government Consumption
rho_TR    % Persistence of Transfers
tau_k_bar % Capital tax steady state
tau_n_bar % Labor tax steady state
tau_c_bar % Consumption tax steady state
rho_pCostar % Persistence of oil price



v_ss             % Steady State Time Preference Shifter
kappa_o_ss       % Steady State Optimizer Labor Preference Shifter
kappa_r_ss       % Steady State Rule of Thumb Labor Preference Shifter
u_ss             % Steady State Productivity of Investment Process
z_ss             % Steady State TFP 
a_ss             % Steady State Growth Rate of Labor Productivity (and the Enitre Economy)
zeta_ss          % Steady State Idiosyncratic Component of Risk Premium
yCo_ss           % Steady State Oil Production
o_revenue_ss     % Steady State Oil Revenue in Terms of Foreign Good
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
f_star_ss        % Steady State Foreign Private Debt
tb_ss            % Steady State Trade Balance
h_ss             % Steady State Aggregate Hours
pCostar_ss       % Steady State Oil Price
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
mu = 1;


 
// Deep Parameters
phi          =   3.421587887494021;      
varsigma     =   0.738370963191099; 
hpsi         =   2.210565902756527; 
eta          =   6.075943008381720; 
gamma_k      =   8.854549591310821;
eta_c        =   0.794029592118338;
upsilon      =   0.700769221922841;



// Spending parameters  
rho_g_i   =     0.773151296679890; 
alpha_g_i =     2.581136188194960;         
gamma_g_i =     -1.820671564944772; 


rho_g_c   =     0.881944929959026;
alpha_g_c =     0.593524641111012; 
gamma_g_c =     -0.497803637718900; 
    

rho_TR    =     0.473017824489847;
alpha_TR  =     5.462229514950716;      
gamma_TR  =     -0.261494559041695; 

rho_pCostar = 0.87142;

  



%----------------------------------------------------------------
% 2. Model (137=49+49+11+14+14 equations)
%----------------------------------------------------------------
%

model;

// Equilibrium conditions 

[name='Capital Tax']
tau_k = ind_imf*(tau_k_bar + eps_tau_k) + (1-ind_imf)*(.99*tau_k(-1) + (1-.99)*tau_k_bar);

[name='Labor Tax']
tau_n = ind_imf*(tau_n_bar + eps_tau_n) + (1-ind_imf)*(.99*tau_n(-1) + (1-.99)*tau_n_bar);

[name='Consumption Tax']
tau_c = ind_imf*(tau_c_bar + eps_tau_c) + (1-ind_imf)*(.99*tau_c(-1) + (1-.99)*tau_c_bar);

[name='Government Consumtpion']
g_c = ind_imf*(g_c_bar + eps_g_c) + (1-ind_imf)*(g_c(-1))^(rho_g_c)*(g_c_bar*(y/y_ss)^alpha_g_c*(b_star(-1)/y(-1)/b_bar)^gamma_g_c)^(1-rho_g_c);

[name='Government Investment']
g_i = ind_imf*(g_i_bar + eps_g_i) + (1-ind_imf)*(g_i(-1))^(rho_g_i)*(g_i_bar*(y/y_ss)^alpha_g_i*(b_star(-1)/y(-1)/b_bar)^gamma_g_i)^(1-rho_g_i);

[name='Transfers']
tr = ind_imf*(tr_bar + eps_tr) + (1-ind_imf)*(tr(-1))^(rho_TR)*(tr_bar*(y/y_ss)^alpha_TR*(b_star(-1)/y(-1)/b_bar)^gamma_TR)^(1-rho_TR);

[name='Oil Revenue']
o_revenue = ind_imf*(chi*pCostar_ss*yCo_ss + eps_o_revenue) + (1-ind_imf)*(o_revenue(-1)^rho_pCostar*(chi*pCostar_ss*yCo_ss)^(1-rho_pCostar));

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
tb = pH*xHstar + o_revenue/chi - yF; 

[name='Aggregate Privately Held Foreign Debt']
f_star = (1-omega)*f_star_o; 

[name='Balance of Payments Identity']
f_star + b_star = R(-1)*f_star(-1)/(a(-1)) + Rstar(-1)*xi(-1)*b_star(-1)/a(-1) - tb + (1-chi)*o_revenue/chi; 

[name='Country Premium']
xi = xi_bar*exp(.01*hpsi*((f_star+b_star)/y - fb_star_bar)/fb_star_bar + (zeta-zeta_ss)/zeta_ss); 

[name='Evolution of Optimizer Capital']
k_o =(1-delta)*k_o(-1)/a(-1)+(1-gamma_k/2*(i_o/i_o(-1)*a(-1)-a_ss)^2)*u*i_o; 

[name='Aggregate Private Capital']
k = (1-omega)*k_o; 

[name='Aggregate Private Investment']
i = (1-omega)*i_o; 

[name='Tobins q for Private Investment']
q = beta/a^sigma*v(+1)/v*lam_o(+1)/lam_o*((1-tau_k(+1))*rK(+1)+ delta*tau_k(+1) + q(+1)*(1-delta)); 

[name='Return to Capital Equals Marginal Product of Capital']
rK = pH*alpha*yH/k(-1)*a(-1); 

[name='Wage Equals Marginal Product of Labor']
w = pH*(1-alpha-gamma)*yH/h; 

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
p*g_c+p*g_i+ Rstar(-1)*xi(-1)*b_star(-1)/a(-1)+tr = o_revenue +b_star+tau_n*w*(1-omega)*h_o+tau_k*(rK-delta)*k(-1)/a(-1)+tau_c*p*c+T_ss*(1-omega); 

[name='Transfers to Optimizers']
tr_o = (1-omega_G)/(1-omega)*tr; 

[name='Transfers to Rule of Thumb']
tr_r = (omega_G/omega)*tr; 

[name='Profits of Home Good Producer']
pi = pH*gamma*yH; 

[name='Evolution of Government Capital']
k_g = (1-delta_g)*k_g(-1)/a(-1) + g_i; 

[name='Rule of Thumb Budget Constraint']
(1+tau_c)*p*c_r = w*h_r + tr_r; 

[name='Real GDP']
gdp = y/p;

[name='Annual Aggregate Debt to GDP']
debt_agg_y = (f_star + b_star)/(4*y);

[name='Aggregate Capitak']
capital_agg = (k_g(-1)/a(-1))^gamma*(k(-1)/a(-1))^alpha;

[name='Tax Revenue']
t_revenue =  tau_n*w*(1-omega)*h_o + tau_k*(rK-delta)*k(-1)/a(-1) + tau_c*p*c + T_ss*(1-omega) ;

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
v = v_ss;

[name='Optimizer Labor Supply Preference Shifter Process']
kappa_o = kappa_o_ss;

[name='Rule of Thumb Labor Supply Preference Shifter Process']
kappa_r = kappa_r_ss;

[name='Investment Specific Productivity Process']
u = u_ss;

[name='TFP Process']
z = z_ss;

[name='Growth Rate Process']
a = a_ss;

[name='Idiosyncratic Component of Country Premium Process']
zeta = zeta_ss;

[name='Foreign Inerest Rate Process']
Rstar = Rstar_ss;

[name='Foreign GDP Process']
y_star = y_star_ss;

[name='Change in Government Debt Over GDP']
ratio_BY = (b_star-b_star(-1)/a(-1))/y;

[name='Trade Balance Over GDP']
ratio_TBY = tb/y;

end;

%----------------------------------------------------------------
% 3. Steady state
%----------------------------------------------------------------

steady_state_model; 

tau_k_ss = tau_k_bar;
tau_n_ss = tau_n_bar;
tau_c_ss = tau_c_bar;

beta=a_ss^sigma/Rstar_ss/xi_bar;
h_ss=(1-omega)*h_o_ss+omega*h_r_ss;
q_ss=p_ss;
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
g_c_bar = g_c_ss;
g_i_bar = g_i_ss;
tr_bar = tr_ss;

//initial values for numerical solver 
tr = tr_ss;
g_c = g_c_ss;
g_i = g_i_ss;
tau_k = tau_k_ss;
tau_c = tau_c_ss;
tau_n = tau_n_ss;
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
k_g=k_g_ss;
tr_o=tr_o_ss;
tr_r=tr_r_ss;
gdp = gdp_ss;
debt_agg_y = debt_agg_y_ss;
capital_agg = capital_agg_ss;
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
y_star=y_star_ss;

ratio_BY=b_star_ss*(1-1/a_ss)/y_ss;
ratio_TBY=tb_ss/y_ss;

end;





 














