function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 62);

T(1) = y(2)^(-params(3));
T(2) = y(3)-y(3)*params(1)/y(52);
T(3) = y(2)*(1-params(12))/T(2);
T(4) = 1/params(11);
T(5) = T(3)^T(4);
T(6) = y(11)^(-params(3));
T(7) = y(12)-params(1)*y(12)/y(52);
T(8) = (1-params(12))*y(11)/T(7);
T(9) = T(8)^T(4);
T(10) = y(4)^params(4);
T(11) = y(8)*y(48)*T(10);
T(12) = y(13)^params(4);
T(13) = y(14)*y(49)*T(12);
T(14) = y(52)^params(3);
T(15) = params(17)/T(14);
T(16) = (1-params(8))^(1/params(7));
T(17) = (params(7)-1)/params(7);
T(18) = params(8)^(1/params(7));
T(19) = T(16)*y(29)^T(17)+T(18)*y(28)^T(17);
T(20) = 1/y(33);
T(21) = params(8)*T(20)^(-params(7));
T(22) = (1-params(8))*(y(32)/y(33))^(-params(7));
T(23) = params(22)*y(32)^(-params(14));
T(24) = (y(39)/y(52))^params(15);
T(25) = y(51)*T(24);
T(26) = (y(19)/y(52))^params(5);
T(27) = T(25)*T(26);
T(28) = (y(52)*y(17))^(1-params(5)-params(15));
T(29) = exp(.01*params(2)*((y(20)+y(45))/y(24)-params(83))/params(83)+(y(53)-params(67))/params(67));
T(30) = 1-params(16)/2*(y(52)-params(66))^2;
T(31) = y(52)^2;
T(32) = (y(52)-params(66))*T(15)*params(16)*T(31);
T(33) = (1-params(12))^T(4);
T(34) = (params(11)-1)/params(11);
T(35) = T(33)*T(2)^T(34);
T(36) = params(12)^T(4);
T(37) = T(36)*y(40)^T(34);
T(38) = params(11)/(params(11)-1);
T(39) = T(33)*T(7)^T(34);
T(40) = T(36)*params(29)^T(34);
T(41) = (T(35)+T(40))^T(38);
T(42) = (T(41))^(-params(3));
T(43) = y(9)^(1-params(10));
T(44) = (T(41))^(params(3)*params(10));
T(45) = (T(39)+T(40))^T(38);
T(46) = (T(45))^(-params(3));
T(47) = y(15)^(1-params(10));
T(48) = (T(45))^(params(3)*params(10));
T(49) = y(41)^params(35);
T(50) = y(24)/params(84);
T(51) = params(26)*T(50)^params(27);
T(52) = y(45)/y(24)/params(81);
T(53) = T(52)^params(28);
T(54) = (T(51)*T(53))^(1-params(35));
T(55) = y(40)^params(36);
T(56) = params(29)*T(50)^params(30);
T(57) = T(52)^params(31);
T(58) = (T(56)*T(57))^(1-params(36));
T(59) = y(42)^params(37);
T(60) = params(32)*T(50)^params(33);
T(61) = T(52)^params(34);
T(62) = (T(60)*T(61))^(1-params(37));

end
