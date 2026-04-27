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

assert(length(T) >= 121);

T = SOE_simulations.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(82) = getPowerDeriv(T(3),T(4),1);
T(83) = (-(params(1)/y(28)));
T(84) = getPowerDeriv(T(2),T(41),1);
T(85) = getPowerDeriv(T(42)+T(44),T(45),1);
T(86) = getPowerDeriv(T(42)+T(47),T(45),1);
T(87) = getPowerDeriv(T(48),(-params(3)),1);
T(88) = getPowerDeriv(T(48),params(3)*params(10),1);
T(89) = y(110)*y(42)*T(75)*getPowerDeriv(y(38),1+params(4),1)/(1+params(4));
T(90) = getPowerDeriv((1-params(3))*(T(77)+params(87)),T(74),1);
T(91) = 2*(y(28)*y(39)/y(2)-params(64));
T(92) = getPowerDeriv(T(8),T(4),1);
T(93) = getPowerDeriv(T(7),T(41),1);
T(94) = getPowerDeriv(T(44)+T(46),T(45),1);
T(95) = getPowerDeriv(T(46)+T(47),T(45),1);
T(96) = getPowerDeriv(T(52),(-params(3)),1);
T(97) = getPowerDeriv(T(52),params(3)*params(10),1);
T(98) = y(111)*y(48)*T(75)*getPowerDeriv(y(47),1+params(4),1)/(1+params(4));
T(99) = getPowerDeriv((1-params(3))*(T(79)+params(88)),T(74),1);
T(100) = getPowerDeriv(y(51)*y(114),1-params(5)-params(15),1);
T(101) = (-(y(28)*(-(y(12)*(y(67)*y(75)+y(67)*y(52))))/((y(12)*y(8)+y(19)*y(12))*(y(12)*y(8)+y(19)*y(12)))));
T(102) = 1/y(28);
T(103) = getPowerDeriv(y(9)/y(28),params(5),1);
T(104) = (-(params(18)*T(27)*.01*params(2)*1/y(58)/params(81)));
T(105) = (-(1/(y(58)*4)));
T(106) = (-(1/y(58)));
T(107) = (-y(21))/(y(11)*y(11))/params(79);
T(108) = getPowerDeriv(T(60),params(29),1);
T(109) = getPowerDeriv(T(62),1-params(36),1);
T(110) = getPowerDeriv(T(60),params(32),1);
T(111) = getPowerDeriv(T(67),1-params(37),1);
T(112) = getPowerDeriv(T(60),params(35),1);
T(113) = getPowerDeriv(T(72),1-params(38),1);
T(114) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(115) = getPowerDeriv(y(66)/y(67),(-params(7)),1);
T(116) = getPowerDeriv(y(17)/y(28),params(15),1);
T(117) = T(43)*getPowerDeriv(y(74),T(41),1);
T(118) = 1/y(11)/params(79);
T(119) = (-(y(9)*y(70)*(y(57)-params(6))))/(y(28)*y(28));
T(120) = (-(params(17)*getPowerDeriv(y(114),params(3),1)))/(T(14)*T(14));
T(121) = getPowerDeriv(y(114),1-params(3),1);

end
