function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 106);

T = SOE_Decomposition.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(75) = getPowerDeriv(T(3),T(4),1);
T(76) = (-(params(1)/y(24)));
T(77) = getPowerDeriv(T(2),T(43),1);
T(78) = getPowerDeriv(T(44)+T(46),T(47),1);
T(79) = getPowerDeriv(T(44)+T(49),T(47),1);
T(80) = getPowerDeriv(T(50),(-params(3)),1);
T(81) = getPowerDeriv(T(50),params(3)*params(10),1);
T(82) = 2*(y(24)*y(41)/y(2)-params(66));
T(83) = getPowerDeriv(T(8),T(4),1);
T(84) = getPowerDeriv(T(7),T(43),1);
T(85) = getPowerDeriv(T(46)+T(48),T(47),1);
T(86) = getPowerDeriv(T(48)+T(49),T(47),1);
T(87) = getPowerDeriv(T(54),(-params(3)),1);
T(88) = getPowerDeriv(T(54),params(3)*params(10),1);
T(89) = getPowerDeriv(y(53)*y(88),1-params(5)-params(15),1);
T(90) = (-(y(24)*(-(y(12)*(y(69)*y(77)+y(69)*y(54))))/((y(12)*y(8)+y(16)*y(12))*(y(12)*y(8)+y(16)*y(12)))));
T(91) = 1/y(24);
T(92) = getPowerDeriv(y(9)/y(24),params(5),1);
T(93) = (-(params(18)*T(29)*.01*params(2)*1/y(60)/params(83)));
T(94) = (-y(18))/(y(11)*y(11))/params(81);
T(95) = getPowerDeriv(T(61),params(28),1);
T(96) = getPowerDeriv(T(63),1-params(35),1);
T(97) = getPowerDeriv(T(61),params(31),1);
T(98) = getPowerDeriv(T(68),1-params(36),1);
T(99) = getPowerDeriv(T(61),params(34),1);
T(100) = getPowerDeriv(T(73),1-params(37),1);
T(101) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(102) = getPowerDeriv(y(68)/y(69),(-params(7)),1);
T(103) = getPowerDeriv(y(14)/y(24),params(15),1);
T(104) = T(45)*getPowerDeriv(y(76),T(43),1);
T(105) = 1/y(11)/params(81);
T(106) = (-(params(17)*getPowerDeriv(y(88),params(3),1)))/(T(14)*T(14));

end
