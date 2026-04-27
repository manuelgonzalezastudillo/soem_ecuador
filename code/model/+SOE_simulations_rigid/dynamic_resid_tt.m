function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 81);

T(1) = y(36)^(-params(3));
T(2) = y(37)-params(1)*y(1)/y(28);
T(3) = y(36)*(1-params(12))/T(2);
T(4) = 1/params(11);
T(5) = T(3)^T(4);
T(6) = y(45)^(-params(3));
T(7) = y(46)-params(1)*y(5)/y(28);
T(8) = (1-params(12))*y(45)/T(7);
T(9) = T(8)^T(4);
T(10) = y(38)^params(4);
T(11) = y(42)*y(110)*T(10);
T(12) = y(47)^params(4);
T(13) = y(48)*y(111)*T(12);
T(14) = y(114)^params(3);
T(15) = params(17)/T(14);
T(16) = (1-params(8))^(1/params(7));
T(17) = (params(7)-1)/params(7);
T(18) = params(8)^(1/params(7));
T(19) = T(16)*y(63)^T(17)+T(18)*y(62)^T(17);
T(20) = 1/y(67);
T(21) = params(8)*T(20)^(-params(7));
T(22) = (1-params(8))*(y(66)/y(67))^(-params(7));
T(23) = params(22)*y(66)^(-params(14));
T(24) = (y(17)/y(28))^params(15);
T(25) = (y(9)/y(28))^params(5);
T(26) = (y(51)*y(114))^(1-params(5)-params(15));
T(27) = exp(.01*params(2)*((y(54)+y(79))/y(58)-params(81))/params(81)+(y(115)-params(65))/params(65));
T(28) = params(16)/2;
T(29) = 1-T(28)*(y(28)*y(39)/y(2)-params(64))^2;
T(30) = y(146)*T(15)*y(151)/y(109)/y(35);
T(31) = (1-y(150))*y(149)+params(6)*y(150)+(1-params(6))*y(148);
T(32) = y(39)*params(16)*(y(28)*y(39)/y(2)-params(64))/y(2);
T(33) = T(29)-y(28)*T(32);
T(34) = y(148)*y(151)*T(15)*params(16)/y(109)/y(55);
T(35) = y(146)*T(34);
T(36) = T(35)/y(35);
T(37) = y(114)*y(147)/y(39)-params(64);
T(38) = T(36)*T(37);
T(39) = (y(114)*y(147)/y(39))^2;
T(40) = (1-params(12))^T(4);
T(41) = (params(11)-1)/params(11);
T(42) = T(40)*T(2)^T(41);
T(43) = params(12)^T(4);
T(44) = T(43)*y(74)^T(41);
T(45) = params(11)/(params(11)-1);
T(46) = T(40)*T(7)^T(41);
T(47) = T(43)*params(30)^T(41);
T(48) = (T(42)+T(47))^T(45);
T(49) = (T(48))^(-params(3));
T(50) = y(4)^(1-params(10));
T(51) = (T(48))^(params(3)*params(10));
T(52) = (T(46)+T(47))^T(45);
T(53) = (T(52))^(-params(3));
T(54) = y(6)^(1-params(10));
T(55) = (T(52))^(params(3)*params(10));
T(56) = y(9)*y(70)*(y(57)-params(6))/y(28);
T(57) = y(19)^params(36);
T(58) = y(58)/params(82);
T(59) = params(27)*T(58)^params(28);
T(60) = y(21)/y(11)/params(79);
T(61) = T(60)^params(29);
T(62) = T(59)*T(61);
T(63) = T(62)^(1-params(36));
T(64) = y(18)^params(37);
T(65) = params(30)*T(58)^params(31);
T(66) = T(60)^params(32);
T(67) = T(65)*T(66);
T(68) = T(67)^(1-params(37));
T(69) = y(20)^params(38);
T(70) = params(33)*T(58)^params(34);
T(71) = T(60)^params(35);
T(72) = T(70)*T(71);
T(73) = T(72)^(1-params(38));
T(74) = 1/(1-params(3));
T(75) = y(114)^(1-params(3));
T(76) = y(38)^(1+params(4));
T(77) = y(110)*y(42)*T(75)*T(76)/(1+params(4));
T(78) = y(47)^(1+params(4));
T(79) = y(111)*y(48)*T(75)*T(78)/(1+params(4));
T(80) = ((1-params(3))*(T(77)+params(87)))^T(74);
T(81) = ((1-params(3))*(T(79)+params(88)))^T(74);

end
