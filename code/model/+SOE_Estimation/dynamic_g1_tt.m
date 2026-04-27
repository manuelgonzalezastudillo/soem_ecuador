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

assert(length(T) >= 195);

T = SOE_Estimation.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(79) = (-1);
T(80) = (-(y(126)*T(15)*y(131)/y(83)));
T(81) = T(80)/(y(37)*y(37));
T(82) = (-T(40))/(y(37)*y(37));
T(83) = T(43)*T(82);
T(84) = T(15)*y(131)/y(83)/y(37);
T(85) = T(39)/y(37);
T(86) = T(43)*T(85);
T(87) = getPowerDeriv(y(38),(-params(3)),1);
T(88) = (1-params(12))/T(2);
T(89) = getPowerDeriv(T(3),T(4),1);
T(90) = (-(params(1)/y(24)));
T(91) = (-(y(38)*(1-params(12))*T(90)))/(T(2)*T(2));
T(92) = getPowerDeriv(T(2),T(47),1);
T(93) = getPowerDeriv(T(48)+T(50),T(51),1);
T(94) = getPowerDeriv(T(48)+T(53),T(51),1);
T(95) = getPowerDeriv(T(54),(-params(3)),1);
T(96) = getPowerDeriv(T(54),params(3)*params(10),1);
T(97) = (-(y(38)*(1-params(12))))/(T(2)*T(2));
T(98) = getPowerDeriv(y(40),params(4),1);
T(99) = y(44)*y(84)*T(98);
T(100) = y(24)*(-y(41))/(y(2)*y(2));
T(101) = 2*(y(24)*T(33)-params(66));
T(102) = (-(T(32)*T(100)*T(101)))-y(24)*(y(2)*y(41)*params(16)*T(100)-y(41)*params(16)*(y(24)*T(33)-params(66)))/(y(2)*y(2));
T(103) = y(24)*1/y(2);
T(104) = y(86)*(-(T(32)*T(101)*T(103)));
T(105) = (-(T(32)*T(101)*T(103)))-y(24)*(params(16)*(y(24)*T(33)-params(66))+y(41)*params(16)*T(103))/y(2);
T(106) = y(88)*(-y(127))/(y(41)*y(41));
T(107) = T(106)*2*y(88)*T(42);
T(108) = y(88)*1/y(41);
T(109) = 2*y(88)*T(42)*T(108);
T(110) = getPowerDeriv(y(4),1-params(10),1);
T(111) = getPowerDeriv(y(47),(-params(3)),1);
T(112) = (1-params(12))/T(7);
T(113) = getPowerDeriv(T(8),T(4),1);
T(114) = (-((1-params(12))*y(47)*T(90)))/(T(7)*T(7));
T(115) = getPowerDeriv(T(7),T(47),1);
T(116) = getPowerDeriv(T(50)+T(52),T(51),1);
T(117) = getPowerDeriv(T(52)+T(53),T(51),1);
T(118) = getPowerDeriv(T(58),(-params(3)),1);
T(119) = getPowerDeriv(T(58),params(3)*params(10),1);
T(120) = (-((1-params(12))*y(47)))/(T(7)*T(7));
T(121) = getPowerDeriv(y(49),params(4),1);
T(122) = y(50)*y(85)*T(121);
T(123) = getPowerDeriv(y(6),1-params(10),1);
T(124) = getPowerDeriv(y(53)*y(88),1-params(5)-params(15),1);
T(125) = (y(12)*y(8)+y(16)*y(12))*(y(12)*y(8)+y(16)*y(12));
T(126) = (-(y(24)*(-(y(12)*(y(69)*y(77)+y(69)*y(54))))/T(125)));
T(127) = 1/y(24);
T(128) = getPowerDeriv(T(27),params(5),1);
T(129) = .01*params(2)*1/y(60)/params(83);
T(130) = (-(params(18)*T(31)*T(129)));
T(131) = (-(y(128)*y(131)*T(15)*params(16)/y(83)))/(y(57)*y(57));
T(132) = y(126)*T(131);
T(133) = T(132)/y(37);
T(134) = T(43)*T(133);
T(135) = y(131)*T(15)*params(16)/y(83)/y(57);
T(136) = y(126)*T(135);
T(137) = T(136)/y(37);
T(138) = T(43)*T(137);
T(139) = (-y(18))/(y(11)*y(11))/params(81);
T(140) = getPowerDeriv(T(65),params(28),1);
T(141) = getPowerDeriv(T(67),1-params(35),1);
T(142) = getPowerDeriv(T(65),params(31),1);
T(143) = getPowerDeriv(T(72),1-params(36),1);
T(144) = getPowerDeriv(T(65),params(34),1);
T(145) = getPowerDeriv(T(77),1-params(37),1);
T(146) = .01*params(2)*(-(y(56)+y(81)))/(y(60)*y(60))/params(83);
T(147) = T(31)*T(146);
T(148) = 1/params(84);
T(149) = params(26)*T(148)*getPowerDeriv(T(63),params(27),1);
T(150) = params(29)*T(148)*getPowerDeriv(T(63),params(30),1);
T(151) = params(32)*T(148)*getPowerDeriv(T(63),params(33),1);
T(152) = T(18)*getPowerDeriv(y(64),T(17),1);
T(153) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(154) = T(16)*getPowerDeriv(y(65),T(17),1);
T(155) = getPowerDeriv(T(22),(-params(7)),1);
T(156) = params(22)*getPowerDeriv(y(68),(-params(14)),1);
T(157) = T(79)/(y(69)*y(69));
T(158) = getPowerDeriv(T(20),(-params(7)),1);
T(159) = params(8)*T(157)*T(158);
T(160) = (-y(68))/(y(69)*y(69));
T(161) = getPowerDeriv(y(14)/y(24),params(15),1);
T(162) = getPowerDeriv(y(15),params(36),1);
T(163) = T(49)*getPowerDeriv(y(76),T(47),1);
T(164) = getPowerDeriv(y(16),params(35),1);
T(165) = getPowerDeriv(y(17),params(37),1);
T(166) = 1/y(11)/params(81);
T(167) = y(126)*(-(T(15)*y(131)))/(y(83)*y(83))/y(37);
T(168) = y(128)*(-(y(131)*T(15)*params(16)))/(y(83)*y(83))/y(57);
T(169) = y(126)*T(168);
T(170) = T(169)/y(37);
T(171) = T(43)*T(170);
T(172) = y(126)*T(15)/y(83)/y(37);
T(173) = y(128)*T(15)*params(16)/y(83)/y(57);
T(174) = y(126)*T(173);
T(175) = T(174)/y(37);
T(176) = T(43)*T(175);
T(177) = (-((-(params(1)*y(1)))/(y(24)*y(24))));
T(178) = (-(y(38)*(1-params(12))*T(177)))/(T(2)*T(2));
T(179) = T(89)*T(178);
T(180) = (-((-(params(1)*y(5)))/(y(24)*y(24))));
T(181) = (-((1-params(12))*y(47)*T(180)))/(T(7)*T(7));
T(182) = T(113)*T(181);
T(183) = y(87)*T(161)*(-y(14))/(y(24)*y(24));
T(184) = T(128)*(-y(9))/(y(24)*y(24));
T(185) = T(28)*T(183)+T(26)*T(184);
T(186) = getPowerDeriv(y(88),params(3),1);
T(187) = (-(params(17)*T(186)));
T(188) = T(187)/(T(14)*T(14));
T(189) = y(126)*y(131)*T(188)/y(83)/y(37);
T(190) = y(128)*y(131)*params(16)*T(188)/y(83)/y(57);
T(191) = y(126)*T(190);
T(192) = T(191)/y(37);
T(193) = T(43)*T(192)+T(41)*T(42);
T(194) = T(42)*2*y(88)*T(42);
T(195) = T(31)*1/params(67);

end
