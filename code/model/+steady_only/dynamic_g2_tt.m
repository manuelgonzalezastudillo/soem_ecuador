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

assert(length(T) >= 202);

T = steady_only.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(166) = getPowerDeriv(T(3),T(4),2);
T(167) = T(146)*T(166);
T(168) = (-((-params(1))/(y(18)*y(18))));
T(169) = getPowerDeriv(T(8),T(4),2);
T(170) = T(149)*T(169);
T(171) = (T(14)*T(14)*(-(params(17)*getPowerDeriv(y(99),params(3),2)))-T(157)*(T(14)*T(156)+T(14)*T(156)))/(T(14)*T(14)*T(14)*T(14));
T(172) = getPowerDeriv(T(19),params(7)/(params(7)-1),2);
T(173) = getPowerDeriv(T(22),(-params(7)),2);
T(174) = getPowerDeriv(y(39)*y(99),1-params(5)-params(15),2);
T(175) = getPowerDeriv(T(26),params(5),2);
T(176) = T(107)*(-1)/(y(18)*y(18))+T(106)*(-y(7))/(y(18)*y(18))*T(175);
T(177) = getPowerDeriv(y(10)/y(18),params(15),2);
T(178) = T(131)*(-1)/(y(18)*y(18))+T(106)*(-y(10))/(y(18)*y(18))*T(177);
T(179) = (-y(10))/(y(18)*y(18))*(-y(10))/(y(18)*y(18))*T(177)+T(131)*(-((-y(10))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18));
T(180) = (-y(7))/(y(18)*y(18))*(-y(7))/(y(18)*y(18))*T(175)+T(107)*(-((-y(7))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18));
T(181) = (-(y(21)*y(11)))/(y(18)*y(18));
T(182) = (-(y(9)*y(11)))/(y(18)*y(18));
T(183) = T(29)*.01*params(2)*(-1)/(y(46)*y(46))/params(81);
T(184) = (-(T(30)*(T(82)*y(18)*(-((-y(27))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))+T(81)*2*T(81))));
T(185) = getPowerDeriv(T(2),T(45),2);
T(186) = T(71)*T(185);
T(187) = getPowerDeriv(T(46)+T(48),T(49),2);
T(188) = T(47)*getPowerDeriv(y(90),T(45),2);
T(189) = T(44)*(T(145)*T(145)*T(185)+T(73)*(-((-((-(params(1)*y(1)))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18)))));
T(190) = getPowerDeriv(T(7),T(45),2);
T(191) = T(71)*T(190);
T(192) = getPowerDeriv(T(48)+T(50),T(49),2);
T(193) = T(44)*(T(148)*T(148)*T(190)+T(96)*(-((-((-(params(1)*y(5)))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18)))));
T(194) = getPowerDeriv(T(46)+T(51),T(49),2);
T(195) = getPowerDeriv(T(52),(-params(3)),2);
T(196) = getPowerDeriv(T(52),params(3)*params(10),2);
T(197) = getPowerDeriv(T(50)+T(51),T(49),2);
T(198) = getPowerDeriv(T(56),(-params(3)),2);
T(199) = getPowerDeriv(T(56),params(3)*params(10),2);
T(200) = (-((-(y(7)*y(89)*(y(45)-params(6))))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18));
T(201) = (-((-4)/(y(46)*4*y(46)*4)));
T(202) = (-((-1)/(y(46)*y(46))));

end
