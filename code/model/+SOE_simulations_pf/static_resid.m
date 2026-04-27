function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = SOE_simulations_pf.static_resid_tt(T, y, x, params);
end
residual = zeros(81, 1);
    residual(1) = (y(67)) - (x(8)*(params(36)+x(3))+(1-x(8))*(y(67)*.99+params(36)*0.01000000000000001));
    residual(2) = (y(66)) - (x(8)*(params(37)+x(2))+(1-x(8))*(.99*y(66)+0.01000000000000001*params(37)));
    residual(3) = (y(65)) - (x(8)*(params(38)+x(1))+(1-x(8))*(.99*y(65)+0.01000000000000001*params(38)));
    residual(4) = (y(68)) - (x(8)*(params(24)+x(4))+T(1)*T(6));
    residual(5) = (y(69)) - (x(8)*(params(25)+x(5))+T(7)*T(10));
    residual(6) = (y(70)) - (x(8)*(params(26)+x(6))+T(11)*T(14));
    residual(7) = (y(44)) - (x(8)*(params(9)*params(68)*params(47)+x(7))+(1-x(8))*y(44)^params(39)*T(15));
    residual(8) = (y(1)*(1+y(65))*y(33)) - (T(16)*T(20));
    residual(9) = (y(33)*(1+y(65))*y(10)) - (T(21)*T(24));
    residual(10) = (y(16)) - (y(3)*(1-params(13))+y(12)*params(13));
    residual(11) = ((1-y(66))*y(22)) - (T(26)/y(1));
    residual(12) = (y(22)) - (T(28)/y(10));
    residual(13) = (y(17)) - ((1-params(13))*y(4)+params(13)*y(13));
    residual(14) = (y(64)) - (params(49)*params(18)+params(23)*(y(80)*y(35)-params(49)*params(18)));
    residual(15) = (y(1)) - (y(1)*y(64)*T(30));
    residual(16) = (y(25)) - (T(34)^(params(7)/(params(7)-1)));
    residual(17) = (y(28)) - (y(25)*T(36));
    residual(18) = (y(29)) - (y(25)*T(37));
    residual(19) = (y(30)) - (T(38)*y(81));
    residual(20) = (y(27)) - (y(77)*T(39)*T(40)*T(41));
    residual(21) = (y(27)) - (y(29)+y(30));
    residual(22) = (y(25)) - (y(69)+y(68)+y(16)+y(18));
    residual(23) = (y(24)) - (y(33)*(y(69)+y(68)+y(16)+y(18))+y(34));
    residual(24) = (y(34)) - (y(32)*y(30)+y(44)/params(9)-y(26));
    residual(25) = (y(20)) - ((1-params(13))*y(7));
    residual(26) = (y(39)+y(20)) - (y(64)*y(20)/y(78)+y(39)*y(80)*y(35)/y(78)-y(34)+y(44)*(1-params(9))/params(9));
    residual(27) = (y(35)) - (params(18)*T(42));
    residual(28) = (y(6)) - (y(6)*(1-params(6))/y(78)+y(5)*T(43)*y(76));
    residual(29) = (y(19)) - ((1-params(13))*y(6));
    residual(30) = (y(18)) - ((1-params(13))*y(5));
    residual(31) = (y(21)) - (T(30)*((1-y(67))*y(23)+y(67)*params(6)+(1-params(6))*y(21)));
    residual(32) = (y(23)) - (y(78)*y(27)*y(32)*params(5)/y(19));
    residual(33) = (y(22)) - (y(27)*y(32)*(1-params(5)-params(15))/y(17));
    residual(34) = (y(33)/y(21)) - (y(76)*(T(43)-y(78)*params(16)*(y(78)-params(45)))+y(76)*T(45));
    residual(35) = (y(26)) - (y(28));
    residual(36) = (y(2)) - ((T(48)+T(50))^T(51));
    residual(37) = (y(11)) - ((T(50)+T(52))^T(51));
    residual(38) = (y(8)) - (y(9)*T(55));
    residual(39) = (y(9)) - (T(56)*T(57));
    residual(40) = (y(14)) - (y(15)*T(59));
    residual(41) = (y(15)) - (T(60)*T(61));
    residual(42) = (y(70)+y(39)*y(80)*y(35)/y(78)+y(68)*y(33)+y(69)*y(33)) - (y(39)+y(44)+y(4)*(1-params(13))*y(66)*y(22)+T(62)+y(16)*y(65)*y(33)+(1-params(13))*params(54));
    residual(43) = (y(37)) - (y(70)*(1-params(19))/(1-params(13)));
    residual(44) = (y(38)) - (y(70)*params(19)/params(13));
    residual(45) = (y(31)) - (y(27)*y(32)*params(15));
    residual(46) = (y(36)) - (y(69)+y(36)*(1-params(20))/y(78));
    residual(47) = (y(12)*(1+y(65))*y(33)) - (y(38)+y(22)*y(13));
    residual(48) = (y(40)) - (y(24)/y(33));
    residual(49) = (y(41)) - ((y(39)+y(20))/(y(24)*4));
    residual(50) = (y(42)) - (T(39)*T(40));
    residual(51) = (y(43)) - ((1-params(13))*params(54)+y(16)*y(65)*y(33)+y(4)*(1-params(13))*y(66)*y(22)+T(62));
    residual(52) = (y(56)) - (y(44)+y(43));
    residual(53) = (y(45)) - (y(70)+y(68)*y(33)+y(69)*y(33));
    residual(54) = (y(46)) - (y(39)/(y(24)*4));
    residual(55) = (y(47)) - (y(20)/(y(24)*4));
    residual(56) = (y(50)) - (y(68)/y(40));
    residual(57) = (y(51)) - (y(69)/y(40));
    residual(58) = (y(52)) - (y(70)/y(24));
    residual(59) = (y(48)) - (y(43)/y(24));
    residual(60) = (y(49)) - (y(44)/y(24));
    residual(61) = (y(57)) - (y(56)/y(24));
    residual(62) = (y(53)) - (y(45)/y(24));
    residual(63) = (y(54)) - ((y(44)+y(43)-y(45))/y(24));
    residual(64) = (y(55)) - (y(39)*(y(80)*y(35)-1)/y(78)/y(24));
    residual(65) = (y(58)) - (y(35)^4-1);
    residual(66) = (y(59)) - (y(22)/y(33));
    residual(67) = (y(60)) - (y(32)*y(27)/y(33));
    residual(68) = (y(61)) - (y(16)*y(65)*y(33)/y(24));
    residual(69) = (y(62)) - (y(4)*(1-params(13))*y(66)*y(22)/y(24));
    residual(70) = (y(63)) - (T(62)/y(24));
    residual(71) = (y(73)) - (params(40));
    residual(72) = (y(74)) - (params(41));
    residual(73) = (y(75)) - (params(42));
    residual(74) = (y(76)) - (params(43));
    residual(75) = (y(77)) - (params(44));
    residual(76) = (y(78)) - (params(45));
    residual(77) = (y(79)) - (params(46));
    residual(78) = (y(80)) - (params(49));
    residual(79) = (y(81)) - (params(50));
    residual(80) = (y(71)) - ((y(39)-y(39)/y(78))/y(24));
    residual(81) = (y(72)) - (y(34)/y(24));

end
