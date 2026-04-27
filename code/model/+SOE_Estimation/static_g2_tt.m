function T = static_g2_tt(T, y, x, params)
% function T = static_g2_tt(T, y, x, params)
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

assert(length(T) >= 168);

T = SOE_Estimation.static_g1_tt(T, y, x, params);

T(137) = getPowerDeriv(T(3),T(4),2);
T(138) = (-((-params(1))/(y(52)*y(52))));
T(139) = getPowerDeriv(T(8),T(4),2);
T(140) = (T(14)*T(14)*(-(params(17)*getPowerDeriv(y(52),params(3),2)))-T(130)*(T(14)*T(129)+T(14)*T(129)))/(T(14)*T(14)*T(14)*T(14));
T(141) = getPowerDeriv(T(19),params(7)/(params(7)-1),2);
T(142) = getPowerDeriv(T(22),(-params(7)),2);
T(143) = getPowerDeriv(y(52)*y(17),1-params(5)-params(15),2);
T(144) = getPowerDeriv(T(27),params(5),2);
T(145) = (-1)/(y(52)*y(52));
T(146) = getPowerDeriv(y(39)/y(52),params(15),2);
T(147) = T(31)*.01*params(2)*(-1)/(y(24)*y(24))/params(83);
T(148) = getPowerDeriv(T(2),T(36),2);
T(149) = getPowerDeriv(T(37)+T(39),T(40),2);
T(150) = T(38)*getPowerDeriv(y(40),T(36),2);
T(151) = T(35)*(T(123)*T(123)*T(148)+T(70)*(-((-((-(y(3)*params(1)))*(y(52)+y(52))))/(y(52)*y(52)*y(52)*y(52)))));
T(152) = getPowerDeriv(T(7),T(36),2);
T(153) = getPowerDeriv(T(39)+T(41),T(40),2);
T(154) = T(35)*(T(126)*T(126)*T(152)+T(82)*(-((-((-(params(1)*y(12)))*(y(52)+y(52))))/(y(52)*y(52)*y(52)*y(52)))));
T(155) = getPowerDeriv(T(37)+T(42),T(40),2);
T(156) = getPowerDeriv(T(43),(-params(3)),2);
T(157) = getPowerDeriv(T(43),params(3)*params(10),2);
T(158) = getPowerDeriv(T(41)+T(42),T(40),2);
T(159) = getPowerDeriv(T(47),(-params(3)),2);
T(160) = getPowerDeriv(T(47),params(3)*params(10),2);
T(161) = (-((-y(45))*(y(24)+y(24))))/(y(24)*y(24)*y(24)*y(24))/params(81);
T(162) = getPowerDeriv(T(54),params(28),2);
T(163) = getPowerDeriv(T(53)*T(55),1-params(35),2);
T(164) = (-1)/(y(24)*y(24))/params(81);
T(165) = getPowerDeriv(T(54),params(31),2);
T(166) = getPowerDeriv(T(58)*T(59),1-params(36),2);
T(167) = getPowerDeriv(T(54),params(34),2);
T(168) = getPowerDeriv(T(62)*T(63),1-params(37),2);

end
