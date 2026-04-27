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

assert(length(T) >= 92);

T = SOE_Decomposition_prior.static_resid_tt(T, y, x, params);

T(63) = getPowerDeriv(T(3),T(4),1);
T(64) = 1-params(1)/y(52);
T(65) = getPowerDeriv(T(2),T(34),1);
T(66) = getPowerDeriv(T(35)+T(37),T(38),1);
T(67) = getPowerDeriv(T(35)+T(40),T(38),1);
T(68) = getPowerDeriv(T(41),(-params(3)),1);
T(69) = getPowerDeriv(T(41),params(3)*params(10),1);
T(70) = getPowerDeriv(T(8),T(4),1);
T(71) = getPowerDeriv(T(7),T(34),1);
T(72) = getPowerDeriv(T(37)+T(39),T(38),1);
T(73) = getPowerDeriv(T(39)+T(40),T(38),1);
T(74) = getPowerDeriv(T(45),(-params(3)),1);
T(75) = getPowerDeriv(T(45),params(3)*params(10),1);
T(76) = getPowerDeriv(y(52)*y(17),1-params(5)-params(15),1);
T(77) = 1/y(52);
T(78) = getPowerDeriv(y(19)/y(52),params(5),1);
T(79) = (-(params(18)*T(29)*.01*params(2)*1/y(24)/params(83)));
T(80) = (-y(45))/(y(24)*y(24))/params(81);
T(81) = getPowerDeriv(T(52),params(28),1);
T(82) = getPowerDeriv(T(51)*T(53),1-params(35),1);
T(83) = getPowerDeriv(T(52),params(31),1);
T(84) = getPowerDeriv(T(56)*T(57),1-params(36),1);
T(85) = getPowerDeriv(T(52),params(34),1);
T(86) = getPowerDeriv(T(60)*T(61),1-params(37),1);
T(87) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(88) = getPowerDeriv(y(32)/y(33),(-params(7)),1);
T(89) = getPowerDeriv(y(39)/y(52),params(15),1);
T(90) = T(36)*getPowerDeriv(y(40),T(34),1);
T(91) = 1/y(24)/params(81);
T(92) = (-(params(17)*getPowerDeriv(y(52),params(3),1)))/(T(14)*T(14));

end
