function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 234);

T = SOE_Estimation.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(196) = getPowerDeriv(T(3),T(4),2);
T(197) = T(178)*T(196);
T(198) = (-((-params(1))/(y(24)*y(24))));
T(199) = getPowerDeriv(T(8),T(4),2);
T(200) = T(181)*T(199);
T(201) = (T(14)*T(14)*(-(params(17)*getPowerDeriv(y(88),params(3),2)))-T(187)*(T(14)*T(186)+T(14)*T(186)))/(T(14)*T(14)*T(14)*T(14));
T(202) = getPowerDeriv(T(19),params(7)/(params(7)-1),2);
T(203) = getPowerDeriv(T(22),(-params(7)),2);
T(204) = getPowerDeriv(y(53)*y(88),1-params(5)-params(15),2);
T(205) = getPowerDeriv(T(27),params(5),2);
T(206) = T(79)/(y(24)*y(24));
T(207) = getPowerDeriv(y(14)/y(24),params(15),2);
T(208) = T(31)*.01*params(2)*T(79)/(y(60)*y(60))/params(83);
T(209) = (-(T(32)*(T(101)*y(24)*(-((-y(41))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))+T(100)*2*T(100))));
T(210) = getPowerDeriv(T(2),T(47),2);
T(211) = T(90)*T(210);
T(212) = getPowerDeriv(T(48)+T(50),T(51),2);
T(213) = T(49)*getPowerDeriv(y(76),T(47),2);
T(214) = T(46)*(T(177)*T(177)*T(210)+T(92)*(-((-((-(params(1)*y(1)))*(y(24)+y(24))))/(y(24)*y(24)*y(24)*y(24)))));
T(215) = getPowerDeriv(T(7),T(47),2);
T(216) = T(90)*T(215);
T(217) = getPowerDeriv(T(50)+T(52),T(51),2);
T(218) = T(46)*(T(180)*T(180)*T(215)+T(115)*(-((-((-(params(1)*y(5)))*(y(24)+y(24))))/(y(24)*y(24)*y(24)*y(24)))));
T(219) = getPowerDeriv(T(48)+T(53),T(51),2);
T(220) = getPowerDeriv(T(54),(-params(3)),2);
T(221) = getPowerDeriv(T(54),params(3)*params(10),2);
T(222) = getPowerDeriv(T(52)+T(53),T(51),2);
T(223) = getPowerDeriv(T(58),(-params(3)),2);
T(224) = getPowerDeriv(T(58),params(3)*params(10),2);
T(225) = (-((-y(18))*(y(11)+y(11))))/(y(11)*y(11)*y(11)*y(11))/params(81);
T(226) = getPowerDeriv(T(65),params(28),2);
T(227) = getPowerDeriv(T(67),1-params(35),2);
T(228) = T(79)/(y(11)*y(11))/params(81);
T(229) = getPowerDeriv(T(65),params(31),2);
T(230) = getPowerDeriv(T(72),1-params(36),2);
T(231) = getPowerDeriv(T(65),params(34),2);
T(232) = getPowerDeriv(T(77),1-params(37),2);
T(233) = (-(y(24)*(-((-(y(12)*(y(69)*y(77)+y(69)*y(54))))*(y(12)*(y(12)*y(8)+y(16)*y(12))+y(12)*(y(12)*y(8)+y(16)*y(12)))))/(T(125)*T(125))));
T(234) = (-(y(24)*(-(y(69)*y(12)))/T(125)));

end
