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

assert(length(T) >= 165);

T = steady_only.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(61) = (-(y(104)*T(15)*y(109)/y(94)));
T(62) = T(61)/(y(23)*y(23));
T(63) = (-T(38))/(y(23)*y(23));
T(64) = T(41)*T(63);
T(65) = T(15)*y(109)/y(94)/y(23);
T(66) = T(37)/y(23);
T(67) = T(41)*T(66);
T(68) = getPowerDeriv(y(24),(-params(3)),1);
T(69) = (1-params(12))/T(2);
T(70) = getPowerDeriv(T(3),T(4),1);
T(71) = (-(params(1)/y(18)));
T(72) = (-(y(24)*(1-params(12))*T(71)))/(T(2)*T(2));
T(73) = getPowerDeriv(T(2),T(45),1);
T(74) = getPowerDeriv(T(46)+T(48),T(49),1);
T(75) = getPowerDeriv(T(46)+T(51),T(49),1);
T(76) = getPowerDeriv(T(52),(-params(3)),1);
T(77) = getPowerDeriv(T(52),params(3)*params(10),1);
T(78) = (-(y(24)*(1-params(12))))/(T(2)*T(2));
T(79) = getPowerDeriv(y(26),params(4),1);
T(80) = y(30)*y(95)*T(79);
T(81) = y(18)*(-y(27))/(y(2)*y(2));
T(82) = 2*(y(18)*T(31)-params(64));
T(83) = (-(T(30)*T(81)*T(82)))-y(18)*(y(2)*y(27)*params(16)*T(81)-y(27)*params(16)*(y(18)*T(31)-params(64)))/(y(2)*y(2));
T(84) = y(18)*1/y(2);
T(85) = y(97)*(-(T(30)*T(82)*T(84)));
T(86) = (-(T(30)*T(82)*T(84)))-y(18)*(params(16)*(y(18)*T(31)-params(64))+y(27)*params(16)*T(84))/y(2);
T(87) = y(99)*(-y(105))/(y(27)*y(27));
T(88) = T(87)*2*y(99)*T(40);
T(89) = y(99)*1/y(27);
T(90) = 2*y(99)*T(40)*T(89);
T(91) = getPowerDeriv(y(4),1-params(10),1);
T(92) = getPowerDeriv(y(33),(-params(3)),1);
T(93) = (1-params(12))/T(7);
T(94) = getPowerDeriv(T(8),T(4),1);
T(95) = (-((1-params(12))*y(33)*T(71)))/(T(7)*T(7));
T(96) = getPowerDeriv(T(7),T(45),1);
T(97) = getPowerDeriv(T(48)+T(50),T(49),1);
T(98) = getPowerDeriv(T(50)+T(51),T(49),1);
T(99) = getPowerDeriv(T(56),(-params(3)),1);
T(100) = getPowerDeriv(T(56),params(3)*params(10),1);
T(101) = (-((1-params(12))*y(33)))/(T(7)*T(7));
T(102) = getPowerDeriv(y(35),params(4),1);
T(103) = y(36)*y(96)*T(102);
T(104) = getPowerDeriv(y(6),1-params(10),1);
T(105) = getPowerDeriv(y(39)*y(99),1-params(5)-params(15),1);
T(106) = 1/y(18);
T(107) = getPowerDeriv(T(26),params(5),1);
T(108) = (-(y(89)*(y(45)-params(6))/y(18)));
T(109) = .01*params(2)*1/y(46)/params(81);
T(110) = (-(params(18)*T(29)*T(109)));
T(111) = (-(1/(y(46)*4)));
T(112) = (-(y(106)*y(109)*T(15)*params(16)/y(94)))/(y(43)*y(43));
T(113) = y(104)*T(112);
T(114) = T(113)/y(23);
T(115) = T(41)*T(114);
T(116) = y(109)*T(15)*params(16)/y(94)/y(43);
T(117) = y(104)*T(116);
T(118) = T(117)/y(23);
T(119) = T(41)*T(118);
T(120) = .01*params(2)*(-(y(42)+y(61)))/(y(46)*y(46))/params(81);
T(121) = T(29)*T(120);
T(122) = T(18)*getPowerDeriv(y(50),T(17),1);
T(123) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(124) = T(16)*getPowerDeriv(y(51),T(17),1);
T(125) = getPowerDeriv(T(22),(-params(7)),1);
T(126) = params(22)*getPowerDeriv(y(54),(-params(14)),1);
T(127) = (-1)/(y(55)*y(55));
T(128) = getPowerDeriv(T(20),(-params(7)),1);
T(129) = params(8)*T(127)*T(128);
T(130) = (-y(54))/(y(55)*y(55));
T(131) = getPowerDeriv(y(10)/y(18),params(15),1);
T(132) = (-(1/y(46)));
T(133) = (-(y(7)*(y(45)-params(6))/y(18)));
T(134) = T(47)*getPowerDeriv(y(90),T(45),1);
T(135) = y(104)*(-(T(15)*y(109)))/(y(94)*y(94))/y(23);
T(136) = y(106)*(-(y(109)*T(15)*params(16)))/(y(94)*y(94))/y(43);
T(137) = y(104)*T(136);
T(138) = T(137)/y(23);
T(139) = T(41)*T(138);
T(140) = y(104)*T(15)/y(94)/y(23);
T(141) = y(106)*T(15)*params(16)/y(94)/y(43);
T(142) = y(104)*T(141);
T(143) = T(142)/y(23);
T(144) = T(41)*T(143);
T(145) = (-((-(params(1)*y(1)))/(y(18)*y(18))));
T(146) = (-(y(24)*(1-params(12))*T(145)))/(T(2)*T(2));
T(147) = T(70)*T(146);
T(148) = (-((-(params(1)*y(5)))/(y(18)*y(18))));
T(149) = (-((1-params(12))*y(33)*T(148)))/(T(7)*T(7));
T(150) = T(94)*T(149);
T(151) = T(131)*(-y(10))/(y(18)*y(18));
T(152) = y(98)*T(151);
T(153) = T(107)*(-y(7))/(y(18)*y(18));
T(154) = T(27)*T(152)+y(98)*T(25)*T(153);
T(155) = (-(y(7)*y(89)*(y(45)-params(6))))/(y(18)*y(18));
T(156) = getPowerDeriv(y(99),params(3),1);
T(157) = (-(params(17)*T(156)));
T(158) = T(157)/(T(14)*T(14));
T(159) = y(104)*y(109)*T(158)/y(94)/y(23);
T(160) = y(106)*y(109)*params(16)*T(158)/y(94)/y(43);
T(161) = y(104)*T(160);
T(162) = T(161)/y(23);
T(163) = T(41)*T(162)+T(39)*T(40);
T(164) = T(40)*2*y(99)*T(40);
T(165) = T(29)*1/params(65);

end
