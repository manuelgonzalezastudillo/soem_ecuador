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

assert(length(T) >= 47);

T(1) = y(2)^(-params(3));
T(2) = y(3)-y(3)*params(1)/y(77);
T(3) = y(2)*(1-params(12))/T(2);
T(4) = 1/params(11);
T(5) = T(3)^T(4);
T(6) = y(11)^(-params(3));
T(7) = y(12)-params(1)*y(12)/y(77);
T(8) = (1-params(12))*y(11)/T(7);
T(9) = T(8)^T(4);
T(10) = y(4)^params(4);
T(11) = y(8)*y(73)*T(10);
T(12) = y(13)^params(4);
T(13) = y(14)*y(74)*T(12);
T(14) = y(77)^params(3);
T(15) = params(17)/T(14);
T(16) = (1-params(8))^(1/params(7));
T(17) = (params(7)-1)/params(7);
T(18) = params(8)^(1/params(7));
T(19) = T(16)*y(29)^T(17)+T(18)*y(28)^T(17);
T(20) = 1/y(33);
T(21) = params(8)*T(20)^(-params(7));
T(22) = (1-params(8))*(y(32)/y(33))^(-params(7));
T(23) = params(22)*y(32)^(-params(14));
T(24) = (y(36)/y(77))^params(15);
T(25) = (y(19)/y(77))^params(5);
T(26) = (y(77)*y(17))^(1-params(5)-params(15));
T(27) = exp(.01*params(2)*((y(20)+y(39))/y(24)-params(81))/params(81)+(y(78)-params(65))/params(65));
T(28) = 1-params(16)/2*(y(77)-params(64))^2;
T(29) = y(77)^2;
T(30) = (y(77)-params(64))*T(15)*params(16)*T(29);
T(31) = (1-params(12))^T(4);
T(32) = (params(11)-1)/params(11);
T(33) = T(31)*T(2)^T(32);
T(34) = params(12)^T(4);
T(35) = T(34)*y(68)^T(32);
T(36) = params(11)/(params(11)-1);
T(37) = T(31)*T(7)^T(32);
T(38) = T(34)*params(30)^T(32);
T(39) = (T(33)+T(38))^T(36);
T(40) = (T(39))^(-params(3));
T(41) = y(9)^(1-params(10));
T(42) = (T(39))^(params(3)*params(10));
T(43) = (T(37)+T(38))^T(36);
T(44) = (T(43))^(-params(3));
T(45) = y(15)^(1-params(10));
T(46) = (T(43))^(params(3)*params(10));
T(47) = y(19)*y(67)*(y(23)-params(6))/y(77);

end
