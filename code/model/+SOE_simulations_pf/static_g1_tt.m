function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 94);

T = SOE_simulations_pf.static_resid_tt(T, y, x, params);

T(63) = getPowerDeriv(T(18),T(19),1);
T(64) = 1-params(1)/y(78);
T(65) = getPowerDeriv(T(17),T(47),1);
T(66) = getPowerDeriv(T(48)+T(50),T(51),1);
T(67) = getPowerDeriv(T(48)+T(53),T(51),1);
T(68) = getPowerDeriv(T(54),(-params(3)),1);
T(69) = getPowerDeriv(T(54),params(3)*params(10),1);
T(70) = getPowerDeriv(T(23),T(19),1);
T(71) = getPowerDeriv(T(22),T(47),1);
T(72) = getPowerDeriv(T(50)+T(52),T(51),1);
T(73) = getPowerDeriv(T(52)+T(53),T(51),1);
T(74) = getPowerDeriv(T(58),(-params(3)),1);
T(75) = getPowerDeriv(T(58),params(3)*params(10),1);
T(76) = getPowerDeriv(y(78)*y(17),1-params(5)-params(15),1);
T(77) = getPowerDeriv(y(19)/y(78),params(5),1);
T(78) = (-(params(18)*T(42)*.01*params(2)*1/y(24)/params(62)));
T(79) = (-(1/(y(24)*4)));
T(80) = (-y(39))/(y(24)*y(24))/params(60);
T(81) = getPowerDeriv(T(4),params(30),1);
T(82) = getPowerDeriv(T(3)*T(5),1-params(34),1);
T(83) = getPowerDeriv(T(4),params(28),1);
T(84) = getPowerDeriv(T(8)*T(9),1-params(33),1);
T(85) = getPowerDeriv(T(4),params(32),1);
T(86) = getPowerDeriv(T(12)*T(13),1-params(35),1);
T(87) = getPowerDeriv(T(34),params(7)/(params(7)-1),1);
T(88) = getPowerDeriv(y(32)/y(33),(-params(7)),1);
T(89) = (-(1/y(24)));
T(90) = getPowerDeriv(y(36)/y(78),params(15),1);
T(91) = 1/y(24)/params(60);
T(92) = T(49)*getPowerDeriv(y(68),T(47),1);
T(93) = (-(params(17)*getPowerDeriv(y(78),params(3),1)))/(T(29)*T(29));
T(94) = (-(y(19)*y(67)*(y(23)-params(6))))/(y(78)*y(78));

end
