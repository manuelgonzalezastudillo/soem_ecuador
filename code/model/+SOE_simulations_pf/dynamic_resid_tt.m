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

assert(length(T) >= 83);

T(1) = y(18)^params(34);
T(2) = (1-x(it_, 8))*T(1);
T(3) = y(46)/params(63);
T(4) = params(24)*T(3)^params(29);
T(5) = y(12)/y(9)/params(60);
T(6) = T(5)^params(30);
T(7) = T(4)*T(6);
T(8) = T(7)^(1-params(34));
T(9) = y(19)^params(33);
T(10) = (1-x(it_, 8))*T(9);
T(11) = params(25)*T(3)^params(27);
T(12) = T(5)^params(28);
T(13) = T(11)*T(12);
T(14) = T(13)^(1-params(33));
T(15) = y(20)^params(35);
T(16) = (1-x(it_, 8))*T(15);
T(17) = params(26)*T(3)^params(31);
T(18) = T(5)^params(32);
T(19) = T(17)*T(18);
T(20) = T(19)^(1-params(35));
T(21) = (params(9)*params(68)*params(47))^(1-params(39));
T(22) = y(13)^params(39)*T(21);
T(23) = y(24)^(-params(3));
T(24) = y(25)-params(1)*y(1)/y(21);
T(25) = y(24)*(1-params(12))/T(24);
T(26) = 1/params(11);
T(27) = T(25)^T(26);
T(28) = y(33)^(-params(3));
T(29) = y(34)-params(1)*y(5)/y(21);
T(30) = (1-params(12))*y(33)/T(29);
T(31) = T(30)^T(26);
T(32) = y(26)^params(4);
T(33) = y(30)*y(96)*T(32);
T(34) = y(35)^params(4);
T(35) = y(36)*y(97)*T(34);
T(36) = y(100)^params(3);
T(37) = params(17)/T(36);
T(38) = (1-params(8))^(1/params(7));
T(39) = (params(7)-1)/params(7);
T(40) = params(8)^(1/params(7));
T(41) = T(38)*y(51)^T(39)+T(40)*y(50)^T(39);
T(42) = 1/y(55);
T(43) = params(8)*T(42)^(-params(7));
T(44) = y(54)/y(55);
T(45) = (1-params(8))*T(44)^(-params(7));
T(46) = params(22)*y(54)^(-params(14));
T(47) = (y(11)/y(21))^params(15);
T(48) = y(7)/y(21);
T(49) = T(48)^params(5);
T(50) = (y(39)*y(100))^(1-params(5)-params(15));
T(51) = exp(.01*params(2)*((y(42)+y(61))/y(46)-params(62))/params(62)+(y(101)-params(46))/params(46));
T(52) = params(16)/2;
T(53) = y(27)/y(2);
T(54) = 1-T(52)*(y(21)*T(53)-params(45))^2;
T(55) = y(104)*T(37)*y(109)/y(95)/y(23);
T(56) = (1-y(108))*y(107)+params(6)*y(108)+(1-params(6))*y(106);
T(57) = y(27)*params(16)*(y(21)*T(53)-params(45))/y(2);
T(58) = T(54)-y(21)*T(57);
T(59) = y(106)*y(109)*T(37)*params(16)/y(95)/y(43);
T(60) = y(104)*T(59);
T(61) = T(60)/y(23);
T(62) = y(105)/y(27);
T(63) = y(100)*T(62)-params(45);
T(64) = T(61)*T(63);
T(65) = (y(100)*T(62))^2;
T(66) = (1-params(12))^T(26);
T(67) = (params(11)-1)/params(11);
T(68) = T(66)*T(24)^T(67);
T(69) = params(12)^T(26);
T(70) = T(69)*y(90)^T(67);
T(71) = params(11)/(params(11)-1);
T(72) = T(66)*T(29)^T(67);
T(73) = T(69)*params(24)^T(67);
T(74) = (T(68)+T(73))^T(71);
T(75) = (T(74))^(-params(3));
T(76) = y(4)^(1-params(10));
T(77) = (T(74))^(params(3)*params(10));
T(78) = (T(72)+T(73))^T(71);
T(79) = (T(78))^(-params(3));
T(80) = y(6)^(1-params(10));
T(81) = (T(78))^(params(3)*params(10));
T(82) = y(7)*y(89)*(y(45)-params(6))/y(21);
T(83) = y(12)/y(21);

end
