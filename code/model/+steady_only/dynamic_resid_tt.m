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

assert(length(T) >= 60);

T(1) = y(24)^(-params(3));
T(2) = y(25)-params(1)*y(1)/y(18);
T(3) = y(24)*(1-params(12))/T(2);
T(4) = 1/params(11);
T(5) = T(3)^T(4);
T(6) = y(33)^(-params(3));
T(7) = y(34)-params(1)*y(5)/y(18);
T(8) = (1-params(12))*y(33)/T(7);
T(9) = T(8)^T(4);
T(10) = y(26)^params(4);
T(11) = y(30)*y(95)*T(10);
T(12) = y(35)^params(4);
T(13) = y(36)*y(96)*T(12);
T(14) = y(99)^params(3);
T(15) = params(17)/T(14);
T(16) = (1-params(8))^(1/params(7));
T(17) = (params(7)-1)/params(7);
T(18) = params(8)^(1/params(7));
T(19) = T(16)*y(51)^T(17)+T(18)*y(50)^T(17);
T(20) = 1/y(55);
T(21) = params(8)*T(20)^(-params(7));
T(22) = y(54)/y(55);
T(23) = (1-params(8))*T(22)^(-params(7));
T(24) = params(22)*y(54)^(-params(14));
T(25) = (y(10)/y(18))^params(15);
T(26) = y(7)/y(18);
T(27) = T(26)^params(5);
T(28) = (y(39)*y(99))^(1-params(5)-params(15));
T(29) = exp(.01*params(2)*((y(42)+y(61))/y(46)-params(81))/params(81)+(y(100)-params(65))/params(65));
T(30) = params(16)/2;
T(31) = y(27)/y(2);
T(32) = 1-T(30)*(y(18)*T(31)-params(64))^2;
T(33) = y(104)*T(15)*y(109)/y(94)/y(23);
T(34) = (1-y(108))*y(107)+params(6)*y(108)+(1-params(6))*y(106);
T(35) = y(27)*params(16)*(y(18)*T(31)-params(64))/y(2);
T(36) = T(32)-y(18)*T(35);
T(37) = y(106)*y(109)*T(15)*params(16)/y(94)/y(43);
T(38) = y(104)*T(37);
T(39) = T(38)/y(23);
T(40) = y(105)/y(27);
T(41) = y(99)*T(40)-params(64);
T(42) = T(39)*T(41);
T(43) = (y(99)*T(40))^2;
T(44) = (1-params(12))^T(4);
T(45) = (params(11)-1)/params(11);
T(46) = T(44)*T(2)^T(45);
T(47) = params(12)^T(4);
T(48) = T(47)*y(90)^T(45);
T(49) = params(11)/(params(11)-1);
T(50) = T(44)*T(7)^T(45);
T(51) = T(47)*params(30)^T(45);
T(52) = (T(46)+T(51))^T(49);
T(53) = (T(52))^(-params(3));
T(54) = y(4)^(1-params(10));
T(55) = (T(52))^(params(3)*params(10));
T(56) = (T(50)+T(51))^T(49);
T(57) = (T(56))^(-params(3));
T(58) = y(6)^(1-params(10));
T(59) = (T(56))^(params(3)*params(10));
T(60) = y(7)*y(89)*(y(45)-params(6))/y(18);

end
