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

assert(length(T) >= 136);

T = SOE_Estimation.static_resid_tt(T, y, x, params);

T(65) = getPowerDeriv(y(2),(-params(3)),1);
T(66) = (1-params(12))/T(2);
T(67) = getPowerDeriv(T(3),T(4),1);
T(68) = 1-params(1)/y(52);
T(69) = (-(y(2)*(1-params(12))*T(68)))/(T(2)*T(2));
T(70) = getPowerDeriv(T(2),T(36),1);
T(71) = getPowerDeriv(T(37)+T(39),T(40),1);
T(72) = getPowerDeriv(T(37)+T(42),T(40),1);
T(73) = getPowerDeriv(T(43),(-params(3)),1);
T(74) = getPowerDeriv(T(43),params(3)*params(10),1);
T(75) = getPowerDeriv(y(4),params(4),1);
T(76) = y(8)*y(48)*T(75);
T(77) = getPowerDeriv(y(9),1-params(10),1);
T(78) = getPowerDeriv(y(11),(-params(3)),1);
T(79) = (1-params(12))/T(7);
T(80) = getPowerDeriv(T(8),T(4),1);
T(81) = (-((1-params(12))*y(11)*T(68)))/(T(7)*T(7));
T(82) = getPowerDeriv(T(7),T(36),1);
T(83) = getPowerDeriv(T(39)+T(41),T(40),1);
T(84) = getPowerDeriv(T(41)+T(42),T(40),1);
T(85) = getPowerDeriv(T(47),(-params(3)),1);
T(86) = getPowerDeriv(T(47),params(3)*params(10),1);
T(87) = getPowerDeriv(y(13),params(4),1);
T(88) = y(14)*y(49)*T(87);
T(89) = getPowerDeriv(y(15),1-params(10),1);
T(90) = getPowerDeriv(y(52)*y(17),1-params(5)-params(15),1);
T(91) = 1/y(52);
T(92) = getPowerDeriv(T(27),params(5),1);
T(93) = .01*params(2)*1/y(24)/params(83);
T(94) = (-(params(18)*T(31)*T(93)));
T(95) = .01*params(2)*(-(y(20)+y(45)))/(y(24)*y(24))/params(83);
T(96) = T(31)*T(95);
T(97) = 1/params(84);
T(98) = params(26)*T(97)*getPowerDeriv(T(52),params(27),1);
T(99) = (-y(45))/(y(24)*y(24))/params(81);
T(100) = getPowerDeriv(T(54),params(28),1);
T(101) = getPowerDeriv(T(53)*T(55),1-params(35),1);
T(102) = params(29)*T(97)*getPowerDeriv(T(52),params(30),1);
T(103) = getPowerDeriv(T(54),params(31),1);
T(104) = getPowerDeriv(T(58)*T(59),1-params(36),1);
T(105) = params(32)*T(97)*getPowerDeriv(T(52),params(33),1);
T(106) = getPowerDeriv(T(54),params(34),1);
T(107) = getPowerDeriv(T(62)*T(63),1-params(37),1);
T(108) = T(18)*getPowerDeriv(y(28),T(17),1);
T(109) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(110) = T(16)*getPowerDeriv(y(29),T(17),1);
T(111) = getPowerDeriv(T(22),(-params(7)),1);
T(112) = params(22)*getPowerDeriv(y(32),(-params(14)),1);
T(113) = (-1)/(y(33)*y(33));
T(114) = getPowerDeriv(T(20),(-params(7)),1);
T(115) = params(8)*T(113)*T(114);
T(116) = (-y(32))/(y(33)*y(33));
T(117) = getPowerDeriv(y(39)/y(52),params(15),1);
T(118) = T(38)*getPowerDeriv(y(40),T(36),1);
T(119) = getPowerDeriv(y(40),params(36),1);
T(120) = getPowerDeriv(y(41),params(35),1);
T(121) = getPowerDeriv(y(42),params(37),1);
T(122) = 1/y(24)/params(81);
T(123) = (-((-(y(3)*params(1)))/(y(52)*y(52))));
T(124) = (-(y(2)*(1-params(12))*T(123)))/(T(2)*T(2));
T(125) = T(67)*T(124);
T(126) = (-((-(params(1)*y(12)))/(y(52)*y(52))));
T(127) = (-((1-params(12))*y(11)*T(126)))/(T(7)*T(7));
T(128) = T(80)*T(127);
T(129) = getPowerDeriv(y(52),params(3),1);
T(130) = (-(params(17)*T(129)));
T(131) = T(130)/(T(14)*T(14));
T(132) = y(51)*T(117)*(-y(39))/(y(52)*y(52));
T(133) = T(92)*(-y(19))/(y(52)*y(52));
T(134) = T(28)*T(132)+T(26)*T(133);
T(135) = (-(params(16)/2*2*(y(52)-params(66))));
T(136) = T(31)*1/params(67);

end
