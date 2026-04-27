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
    T = steady_only.static_resid_tt(T, y, x, params);
end
residual = zeros(81, 1);
    residual(1) = (y(1)*(1+y(65))*y(33)) - (T(1)*T(5));
    residual(2) = (y(33)*(1+y(65))*y(10)) - (T(6)*T(9));
    residual(3) = (y(16)) - (y(3)*(1-params(13))+y(12)*params(13));
    residual(4) = ((1-y(66))*y(22)) - (T(11)/y(1));
    residual(5) = (y(22)) - (T(13)/y(10));
    residual(6) = (y(17)) - ((1-params(13))*y(4)+params(13)*y(13));
    residual(7) = (y(64)) - (params(68)*params(18)+params(23)*(y(80)*y(35)-params(68)*params(18)));
    residual(8) = (y(1)) - (y(1)*y(64)*T(15));
    residual(9) = (y(25)) - (T(19)^(params(7)/(params(7)-1)));
    residual(10) = (y(28)) - (y(25)*T(21));
    residual(11) = (y(29)) - (y(25)*T(22));
    residual(12) = (y(30)) - (T(23)*y(81));
    residual(13) = (y(27)) - (y(76)*T(24)*T(25)*T(26));
    residual(14) = (y(27)) - (y(29)+y(30));
    residual(15) = (y(25)) - (y(16)+y(18)+y(68)+y(69));
    residual(16) = (y(24)) - (y(33)*(y(16)+y(18)+y(68)+y(69))+y(34));
    residual(17) = (y(34)) - (y(32)*y(30)+y(71)*y(79)-y(26));
    residual(18) = (y(20)) - ((1-params(13))*y(7));
    residual(19) = (y(20)+y(39)) - (y(64)*y(20)/y(77)+y(80)*y(35)*y(39)/y(77)-y(34)+y(79)*y(71)*(1-params(9)));
    residual(20) = (y(35)) - (params(18)*T(27));
    residual(21) = (y(6)) - (y(6)*(1-params(6))/y(77)+y(5)*T(28)*y(75));
    residual(22) = (y(19)) - ((1-params(13))*y(6));
    residual(23) = (y(18)) - ((1-params(13))*y(5));
    residual(24) = (y(21)) - (T(15)*((1-y(67))*y(23)+params(6)*y(67)+(1-params(6))*y(21)));
    residual(25) = (y(23)) - (y(77)*y(27)*y(32)*params(5)/y(19));
    residual(26) = (y(22)) - (y(27)*y(32)*(1-params(5)-params(15))/y(17));
    residual(27) = (y(33)/y(21)) - (y(75)*(T(28)-y(77)*params(16)*(y(77)-params(64)))+y(75)*T(30));
    residual(28) = (y(26)) - (y(28));
    residual(29) = (y(2)) - ((T(33)+T(35))^T(36));
    residual(30) = (y(11)) - ((T(35)+T(37))^T(36));
    residual(31) = (y(8)) - (y(9)*T(40));
    residual(32) = (y(9)) - (T(41)*T(42));
    residual(33) = (y(14)) - (y(15)*T(44));
    residual(34) = (y(15)) - (T(45)*T(46));
    residual(35) = (y(80)*y(35)*y(39)/y(77)+y(33)*y(68)+y(33)*y(69)+y(70)) - (y(39)+y(79)*y(71)*params(9)+y(4)*(1-params(13))*y(66)*y(22)+T(47)+y(16)*y(65)*y(33)+(1-params(13))*params(73));
    residual(36) = (y(37)) - (y(70)*(1-params(19))/(1-params(13)));
    residual(37) = (y(38)) - (y(70)*params(19)/params(13));
    residual(38) = (y(31)) - (y(27)*y(32)*params(15));
    residual(39) = (y(36)) - (y(69)+y(36)*(1-params(20))/y(77));
    residual(40) = (y(12)*(1+y(65))*y(33)) - (y(38)+y(22)*y(13));
    residual(41) = (y(40)) - (y(24)/y(33));
    residual(42) = (y(41)) - ((y(20)+y(39))/(y(24)*4));
    residual(43) = (y(42)) - (T(24)*T(25));
    residual(44) = (y(43)) - ((1-params(13))*params(73)+y(16)*y(65)*y(33)+y(4)*(1-params(13))*y(66)*y(22)+T(47));
    residual(45) = (y(44)) - (y(79)*y(71)*params(9));
    residual(46) = (y(56)) - (y(43)+y(44));
    residual(47) = (y(45)) - (y(33)*y(68)+y(33)*y(69)+y(70));
    residual(48) = (y(46)) - (y(39)/(y(24)*4));
    residual(49) = (y(47)) - (y(20)/(y(24)*4));
    residual(50) = (y(50)) - (y(68)/y(40));
    residual(51) = (y(51)) - (y(69)/y(40));
    residual(52) = (y(52)) - (y(70)/y(24));
    residual(53) = (y(48)) - (y(43)/y(24));
    residual(54) = (y(49)) - (y(44)/y(24));
    residual(55) = (y(57)) - (y(56)/y(24));
    residual(56) = (y(53)) - (y(45)/y(24));
    residual(57) = (y(54)) - ((y(43)+y(44)-y(45))/y(24));
    residual(58) = (y(55)) - (y(39)*(y(80)*y(35)-1)/y(77)/y(24));
    residual(59) = (y(58)) - (y(35)^4-1);
    residual(60) = (y(59)) - (y(22)/y(33));
    residual(61) = (y(60)) - (y(32)*y(27)/y(33));
    residual(62) = (y(61)) - (y(16)*y(65)*y(33)/y(24));
    residual(63) = (y(62)) - (y(4)*(1-params(13))*y(66)*y(22)/y(24));
    residual(64) = (y(63)) - (T(47)/y(24));
    residual(65) = (y(68)) - (params(30));
    residual(66) = (y(69)) - (params(27));
    residual(67) = (y(70)) - (params(33));
    residual(68) = (y(65)) - (params(24));
    residual(69) = (y(66)) - (params(25));
    residual(70) = (y(67)) - (params(26));
    residual(71) = (y(71)) - (params(67));
    residual(72) = (log(y(72))-log(params(59))) - ((log(y(72))-log(params(59)))*params(49));
    residual(73) = (log(y(73))-log(params(60))) - ((log(y(73))-log(params(60)))*params(50));
    residual(74) = (log(y(74))-log(params(61))) - (params(50)*(log(y(74))-log(params(61))));
    residual(75) = (log(y(75))-log(params(62))) - ((log(y(75))-log(params(62)))*params(51));
    residual(76) = (log(y(76))-log(params(63))) - ((log(y(76))-log(params(63)))*params(52));
    residual(77) = (log(y(77))-log(params(64))) - ((log(y(77))-log(params(64)))*params(53));
    residual(78) = (log(y(79))-log(params(66))) - ((log(y(79))-log(params(66)))*params(55));
    residual(79) = (log(y(78))-log(params(65))) - ((log(y(78))-log(params(65)))*params(54));
    residual(80) = (log(y(80))-log(params(68))) - ((log(y(80))-log(params(68)))*params(56));
    residual(81) = (log(y(81))-log(params(69))) - ((log(y(81))-log(params(69)))*params(58));

end
