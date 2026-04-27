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

assert(length(T) >= 207);

T = SOE_simulations_pf.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(84) = (-(y(104)*T(37)*y(109)/y(95)));
T(85) = T(84)/(y(23)*y(23));
T(86) = (-T(60))/(y(23)*y(23));
T(87) = T(63)*T(86);
T(88) = T(37)*y(109)/y(95)/y(23);
T(89) = T(59)/y(23);
T(90) = T(63)*T(89);
T(91) = getPowerDeriv(y(24),(-params(3)),1);
T(92) = (1-params(12))/T(24);
T(93) = getPowerDeriv(T(25),T(26),1);
T(94) = (-(params(1)/y(21)));
T(95) = (-(y(24)*(1-params(12))*T(94)))/(T(24)*T(24));
T(96) = getPowerDeriv(T(24),T(67),1);
T(97) = getPowerDeriv(T(68)+T(70),T(71),1);
T(98) = getPowerDeriv(T(68)+T(73),T(71),1);
T(99) = getPowerDeriv(T(74),(-params(3)),1);
T(100) = getPowerDeriv(T(74),params(3)*params(10),1);
T(101) = (-(y(24)*(1-params(12))))/(T(24)*T(24));
T(102) = getPowerDeriv(y(26),params(4),1);
T(103) = y(30)*y(96)*T(102);
T(104) = y(21)*(-y(27))/(y(2)*y(2));
T(105) = 2*(y(21)*T(53)-params(45));
T(106) = (-(T(52)*T(104)*T(105)))-y(21)*(y(2)*y(27)*params(16)*T(104)-y(27)*params(16)*(y(21)*T(53)-params(45)))/(y(2)*y(2));
T(107) = y(21)*1/y(2);
T(108) = y(98)*(-(T(52)*T(105)*T(107)));
T(109) = (-(T(52)*T(105)*T(107)))-y(21)*(params(16)*(y(21)*T(53)-params(45))+y(27)*params(16)*T(107))/y(2);
T(110) = y(100)*(-y(105))/(y(27)*y(27));
T(111) = T(110)*2*y(100)*T(62);
T(112) = y(100)*1/y(27);
T(113) = 2*y(100)*T(62)*T(112);
T(114) = getPowerDeriv(y(4),1-params(10),1);
T(115) = getPowerDeriv(y(33),(-params(3)),1);
T(116) = (1-params(12))/T(29);
T(117) = getPowerDeriv(T(30),T(26),1);
T(118) = (-((1-params(12))*y(33)*T(94)))/(T(29)*T(29));
T(119) = getPowerDeriv(T(29),T(67),1);
T(120) = getPowerDeriv(T(70)+T(72),T(71),1);
T(121) = getPowerDeriv(T(72)+T(73),T(71),1);
T(122) = getPowerDeriv(T(78),(-params(3)),1);
T(123) = getPowerDeriv(T(78),params(3)*params(10),1);
T(124) = (-((1-params(12))*y(33)))/(T(29)*T(29));
T(125) = getPowerDeriv(y(35),params(4),1);
T(126) = y(36)*y(97)*T(125);
T(127) = getPowerDeriv(y(6),1-params(10),1);
T(128) = getPowerDeriv(y(39)*y(100),1-params(5)-params(15),1);
T(129) = 1/y(21);
T(130) = getPowerDeriv(T(48),params(5),1);
T(131) = (-(y(89)*(y(45)-params(6))/y(21)));
T(132) = .01*params(2)*1/y(46)/params(62);
T(133) = (-(params(18)*T(51)*T(132)));
T(134) = (-(1/(y(46)*4)));
T(135) = (-(y(106)*y(109)*T(37)*params(16)/y(95)))/(y(43)*y(43));
T(136) = y(104)*T(135);
T(137) = T(136)/y(23);
T(138) = T(63)*T(137);
T(139) = y(109)*T(37)*params(16)/y(95)/y(43);
T(140) = y(104)*T(139);
T(141) = T(140)/y(23);
T(142) = T(63)*T(141);
T(143) = (-y(12))/(y(9)*y(9))/params(60);
T(144) = getPowerDeriv(T(5),params(30),1);
T(145) = getPowerDeriv(T(7),1-params(34),1);
T(146) = getPowerDeriv(T(5),params(28),1);
T(147) = getPowerDeriv(T(13),1-params(33),1);
T(148) = getPowerDeriv(T(5),params(32),1);
T(149) = getPowerDeriv(T(19),1-params(35),1);
T(150) = 1/params(63);
T(151) = params(24)*T(150)*getPowerDeriv(T(3),params(29),1);
T(152) = params(25)*T(150)*getPowerDeriv(T(3),params(27),1);
T(153) = params(26)*T(150)*getPowerDeriv(T(3),params(31),1);
T(154) = .01*params(2)*(-(y(42)+y(61)))/(y(46)*y(46))/params(62);
T(155) = T(51)*T(154);
T(156) = T(40)*getPowerDeriv(y(50),T(39),1);
T(157) = getPowerDeriv(T(41),params(7)/(params(7)-1),1);
T(158) = T(38)*getPowerDeriv(y(51),T(39),1);
T(159) = getPowerDeriv(T(44),(-params(7)),1);
T(160) = params(22)*getPowerDeriv(y(54),(-params(14)),1);
T(161) = (-1)/(y(55)*y(55));
T(162) = getPowerDeriv(T(42),(-params(7)),1);
T(163) = params(8)*T(161)*T(162);
T(164) = (-y(54))/(y(55)*y(55));
T(165) = (-(1/y(46)));
T(166) = getPowerDeriv(y(11)/y(21),params(15),1);
T(167) = 1/y(9)/params(60);
T(168) = T(21)*getPowerDeriv(y(13),params(39),1);
T(169) = (-(y(7)*(y(45)-params(6))/y(21)));
T(170) = getPowerDeriv(y(18),params(34),1);
T(171) = (1-x(it_, 8))*T(170);
T(172) = T(69)*getPowerDeriv(y(90),T(67),1);
T(173) = getPowerDeriv(y(19),params(33),1);
T(174) = (1-x(it_, 8))*T(173);
T(175) = getPowerDeriv(y(20),params(35),1);
T(176) = (1-x(it_, 8))*T(175);
T(177) = y(104)*(-(T(37)*y(109)))/(y(95)*y(95))/y(23);
T(178) = y(106)*(-(y(109)*T(37)*params(16)))/(y(95)*y(95))/y(43);
T(179) = y(104)*T(178);
T(180) = T(179)/y(23);
T(181) = T(63)*T(180);
T(182) = y(104)*T(37)/y(95)/y(23);
T(183) = y(106)*T(37)*params(16)/y(95)/y(43);
T(184) = y(104)*T(183);
T(185) = T(184)/y(23);
T(186) = T(63)*T(185);
T(187) = (-((-(params(1)*y(1)))/(y(21)*y(21))));
T(188) = (-(y(24)*(1-params(12))*T(187)))/(T(24)*T(24));
T(189) = T(93)*T(188);
T(190) = (-((-(params(1)*y(5)))/(y(21)*y(21))));
T(191) = (-((1-params(12))*y(33)*T(190)))/(T(29)*T(29));
T(192) = T(117)*T(191);
T(193) = T(166)*(-y(11))/(y(21)*y(21));
T(194) = y(99)*T(193);
T(195) = T(130)*(-y(7))/(y(21)*y(21));
T(196) = T(49)*T(194)+y(99)*T(47)*T(195);
T(197) = (-(y(7)*y(89)*(y(45)-params(6))))/(y(21)*y(21));
T(198) = getPowerDeriv(y(100),params(3),1);
T(199) = (-(params(17)*T(198)));
T(200) = T(199)/(T(36)*T(36));
T(201) = y(104)*y(109)*T(200)/y(95)/y(23);
T(202) = y(106)*y(109)*params(16)*T(200)/y(95)/y(43);
T(203) = y(104)*T(202);
T(204) = T(203)/y(23);
T(205) = T(63)*T(204)+T(61)*T(62);
T(206) = T(62)*2*y(100)*T(62);
T(207) = T(51)*1/params(46);

end
