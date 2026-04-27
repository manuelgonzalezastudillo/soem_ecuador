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

assert(length(T) >= 74);

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
T(22) = (1-params(8))*(y(68)/y(69))^(-params(7));
T(23) = params(22)*y(68)^(-params(14));
T(24) = (y(14)/y(24))^params(15);
T(25) = y(87)*T(24);
T(26) = (y(9)/y(24))^params(5);
T(27) = T(25)*T(26);
T(28) = (y(53)*y(88))^(1-params(5)-params(15));
T(29) = exp(.01*params(2)*((y(56)+y(81))/y(60)-params(83))/params(83)+(y(89)-params(67))/params(67));
T(30) = params(16)/2;
T(31) = 1-T(30)*(y(24)*y(41)/y(2)-params(66))^2;
T(32) = y(126)*T(15)*y(131)/y(83)/y(37);
T(33) = (1-y(130))*y(129)+params(6)*y(130)+(1-params(6))*y(128);
T(34) = y(41)*params(16)*(y(24)*y(41)/y(2)-params(66))/y(2);
T(35) = T(31)-y(24)*T(34);
T(36) = y(128)*y(131)*T(15)*params(16)/y(83)/y(57);
T(37) = y(126)*T(36);
T(38) = T(37)/y(37);
T(39) = y(88)*y(127)/y(41)-params(66);
T(40) = T(38)*T(39);
T(41) = (y(88)*y(127)/y(41))^2;
T(42) = (1-params(12))^T(4);
T(43) = (params(11)-1)/params(11);
T(44) = T(42)*T(2)^T(43);
T(45) = params(12)^T(4);
T(46) = T(45)*y(76)^T(43);
T(47) = params(11)/(params(11)-1);
T(48) = T(42)*T(7)^T(43);
T(49) = T(45)*params(29)^T(43);
T(50) = (T(44)+T(49))^T(47);
T(51) = (T(50))^(-params(3));
T(52) = y(4)^(1-params(10));
T(53) = (T(50))^(params(3)*params(10));
T(54) = (T(48)+T(49))^T(47);
T(55) = (T(54))^(-params(3));
T(56) = y(6)^(1-params(10));
T(57) = (T(54))^(params(3)*params(10));
T(58) = y(16)^params(35);
T(59) = y(60)/params(84);
T(60) = params(26)*T(59)^params(27);
T(61) = y(18)/y(11)/params(81);
T(62) = T(61)^params(28);
T(63) = T(60)*T(62);
T(64) = T(63)^(1-params(35));
T(65) = y(15)^params(36);
T(66) = params(29)*T(59)^params(30);
T(67) = T(61)^params(31);
T(68) = T(66)*T(67);
T(69) = T(68)^(1-params(36));
T(70) = y(17)^params(37);
T(71) = params(32)*T(59)^params(33);
T(72) = T(61)^params(34);
T(73) = T(71)*T(72);
T(74) = T(73)^(1-params(37));

end
