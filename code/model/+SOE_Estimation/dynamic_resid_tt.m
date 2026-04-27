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

assert(length(T) >= 78);

T(1) = y(38)^(-params(3));
T(2) = y(39)-params(1)*y(1)/y(24);
T(3) = y(38)*(1-params(12))/T(2);
T(4) = 1/params(11);
T(5) = T(3)^T(4);
T(6) = y(47)^(-params(3));
T(7) = y(48)-params(1)*y(5)/y(24);
T(8) = (1-params(12))*y(47)/T(7);
T(9) = T(8)^T(4);
T(10) = y(40)^params(4);
T(11) = y(44)*y(84)*T(10);
T(12) = y(49)^params(4);
T(13) = y(50)*y(85)*T(12);
T(14) = y(88)^params(3);
T(15) = params(17)/T(14);
T(16) = (1-params(8))^(1/params(7));
T(17) = (params(7)-1)/params(7);
T(18) = params(8)^(1/params(7));
T(19) = T(16)*y(65)^T(17)+T(18)*y(64)^T(17);
T(20) = 1/y(69);
T(21) = params(8)*T(20)^(-params(7));
T(22) = y(68)/y(69);
T(23) = (1-params(8))*T(22)^(-params(7));
T(24) = params(22)*y(68)^(-params(14));
T(25) = (y(14)/y(24))^params(15);
T(26) = y(87)*T(25);
T(27) = y(9)/y(24);
T(28) = T(27)^params(5);
T(29) = T(26)*T(28);
T(30) = (y(53)*y(88))^(1-params(5)-params(15));
T(31) = exp(.01*params(2)*((y(56)+y(81))/y(60)-params(83))/params(83)+(y(89)-params(67))/params(67));
T(32) = params(16)/2;
T(33) = y(41)/y(2);
T(34) = 1-T(32)*(y(24)*T(33)-params(66))^2;
T(35) = y(126)*T(15)*y(131)/y(83)/y(37);
T(36) = (1-y(130))*y(129)+params(6)*y(130)+(1-params(6))*y(128);
T(37) = y(41)*params(16)*(y(24)*T(33)-params(66))/y(2);
T(38) = T(34)-y(24)*T(37);
T(39) = y(128)*y(131)*T(15)*params(16)/y(83)/y(57);
T(40) = y(126)*T(39);
T(41) = T(40)/y(37);
T(42) = y(127)/y(41);
T(43) = y(88)*T(42)-params(66);
T(44) = T(41)*T(43);
T(45) = (y(88)*T(42))^2;
T(46) = (1-params(12))^T(4);
T(47) = (params(11)-1)/params(11);
T(48) = T(46)*T(2)^T(47);
T(49) = params(12)^T(4);
T(50) = T(49)*y(76)^T(47);
T(51) = params(11)/(params(11)-1);
T(52) = T(46)*T(7)^T(47);
T(53) = T(49)*params(29)^T(47);
T(54) = (T(48)+T(53))^T(51);
T(55) = (T(54))^(-params(3));
T(56) = y(4)^(1-params(10));
T(57) = (T(54))^(params(3)*params(10));
T(58) = (T(52)+T(53))^T(51);
T(59) = (T(58))^(-params(3));
T(60) = y(6)^(1-params(10));
T(61) = (T(58))^(params(3)*params(10));
T(62) = y(16)^params(35);
T(63) = y(60)/params(84);
T(64) = params(26)*T(63)^params(27);
T(65) = y(18)/y(11)/params(81);
T(66) = T(65)^params(28);
T(67) = T(64)*T(66);
T(68) = T(67)^(1-params(35));
T(69) = y(15)^params(36);
T(70) = params(29)*T(63)^params(30);
T(71) = T(65)^params(31);
T(72) = T(70)*T(71);
T(73) = T(72)^(1-params(36));
T(74) = y(17)^params(37);
T(75) = params(32)*T(63)^params(33);
T(76) = T(65)^params(34);
T(77) = T(75)*T(76);
T(78) = T(77)^(1-params(37));

end
