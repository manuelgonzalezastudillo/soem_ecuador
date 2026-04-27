function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = steady_only.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(81, 1);
    residual(1) = (y(23)*(1+y(87))*y(55)) - (T(1)*T(5));
    residual(2) = (y(55)*(1+y(87))*y(32)) - (T(6)*T(9));
    residual(3) = (y(38)) - (y(25)*(1-params(13))+y(34)*params(13));
    residual(4) = ((1-y(88))*y(44)) - (T(11)/y(23));
    residual(5) = (y(44)) - (T(13)/y(32));
    residual(6) = (y(39)) - ((1-params(13))*y(26)+params(13)*y(35));
    residual(7) = (y(86)) - (params(68)*params(18)+params(23)*(y(102)*y(57)-params(68)*params(18)));
    residual(8) = (y(23)) - (y(86)*T(15)*y(109)/y(94)*y(104));
    residual(9) = (y(47)) - (T(19)^(params(7)/(params(7)-1)));
    residual(10) = (y(50)) - (y(47)*T(21));
    residual(11) = (y(51)) - (y(47)*T(23));
    residual(12) = (y(52)) - (T(24)*y(103));
    residual(13) = (y(49)) - (y(98)*T(25)*T(27)*T(28));
    residual(14) = (y(49)) - (y(51)+y(52));
    residual(15) = (y(47)) - (y(38)+y(40)+y(90)+y(91));
    residual(16) = (y(46)) - (y(55)*(y(38)+y(40)+y(90)+y(91))+y(56));
    residual(17) = (y(56)) - (y(54)*y(52)+y(93)*y(101)-y(48));
    residual(18) = (y(42)) - ((1-params(13))*y(29));
    residual(19) = (y(42)+y(61)) - (y(12)*y(8)/y(18)+y(21)*y(9)*y(11)/y(18)-y(56)+y(101)*y(93)*(1-params(9)));
    residual(20) = (y(57)) - (params(18)*T(29));
    residual(21) = (y(28)) - ((1-params(6))*y(3)/y(18)+y(27)*T(32)*y(97));
    residual(22) = (y(41)) - ((1-params(13))*y(28));
    residual(23) = (y(40)) - ((1-params(13))*y(27));
    residual(24) = (y(43)) - (T(33)*T(34));
    residual(25) = (y(45)) - (y(18)*y(49)*y(54)*params(5)/y(7));
    residual(26) = (y(44)) - (y(49)*y(54)*(1-params(5)-params(15))/y(39));
    residual(27) = (y(55)/y(43)) - (y(97)*T(36)+T(42)*T(43)*y(110));
    residual(28) = (y(48)) - (y(50));
    residual(29) = (y(24)) - ((T(46)+T(48))^T(49));
    residual(30) = (y(33)) - ((T(48)+T(50))^T(49));
    residual(31) = (y(30)) - (y(31)*T(53));
    residual(32) = (y(31)) - (T(54)*T(55));
    residual(33) = (y(36)) - (y(37)*T(57));
    residual(34) = (y(37)) - (T(58)*T(59));
    residual(35) = (y(21)*y(9)*y(11)/y(18)+y(55)*y(90)+y(55)*y(91)+y(92)) - (y(61)+y(101)*y(93)*params(9)+y(26)*(1-params(13))*y(88)*y(44)+T(60)+y(38)*y(87)*y(55)+(1-params(13))*params(73));
    residual(36) = (y(59)) - (y(92)*(1-params(19))/(1-params(13)));
    residual(37) = (y(60)) - (y(92)*params(19)/params(13));
    residual(38) = (y(53)) - (y(49)*y(54)*params(15));
    residual(39) = (y(58)) - (y(91)+y(10)*(1-params(20))/y(18));
    residual(40) = (y(34)*(1+y(87))*y(55)) - (y(60)+y(44)*y(35));
    residual(41) = (y(62)) - (y(46)/y(55));
    residual(42) = (y(63)) - ((y(42)+y(61))/(y(46)*4));
    residual(43) = (y(64)) - (T(25)*T(27));
    residual(44) = (y(65)) - ((1-params(13))*params(73)+y(38)*y(87)*y(55)+y(26)*(1-params(13))*y(88)*y(44)+T(60));
    residual(45) = (y(66)) - (y(101)*y(93)*params(9));
    residual(46) = (y(78)) - (y(65)+y(66));
    residual(47) = (y(67)) - (y(55)*y(90)+y(55)*y(91)+y(92));
    residual(48) = (y(68)) - (y(61)/(y(46)*4));
    residual(49) = (y(69)) - (y(42)/(y(46)*4));
    residual(50) = (y(72)) - (y(90)/y(62));
    residual(51) = (y(73)) - (y(91)/y(62));
    residual(52) = (y(74)) - (y(92)/y(46));
    residual(53) = (y(70)) - (y(65)/y(46));
    residual(54) = (y(71)) - (y(66)/y(46));
    residual(55) = (y(79)) - (y(78)/y(46));
    residual(56) = (y(75)) - (y(67)/y(46));
    residual(57) = (y(76)) - ((y(65)+y(66)-y(67))/y(46));
    residual(58) = (y(77)) - (y(11)*(y(21)*y(9)-1)/y(18)/y(46));
    residual(59) = (y(80)) - (y(57)^4-1);
    residual(60) = (y(81)) - (y(44)/y(55));
    residual(61) = (y(82)) - (y(54)*y(49)/y(55));
    residual(62) = (y(83)) - (y(38)*y(87)*y(55)/y(46));
    residual(63) = (y(84)) - (y(26)*(1-params(13))*y(88)*y(44)/y(46));
    residual(64) = (y(85)) - (T(60)/y(46));
    residual(65) = (y(90)) - (params(30));
    residual(66) = (y(91)) - (params(27));
    residual(67) = (y(92)) - (params(33));
    residual(68) = (y(87)) - (params(24));
    residual(69) = (y(88)) - (params(25));
    residual(70) = (y(89)) - (params(26));
    residual(71) = (y(93)) - (params(67));
    residual(72) = (log(y(94))-log(params(59))) - (params(49)*(log(y(13))-log(params(59))));
    residual(73) = (log(y(95))-log(params(60))) - (params(50)*(log(y(14))-log(params(60))));
    residual(74) = (log(y(96))-log(params(61))) - (params(50)*(log(y(15))-log(params(61))));
    residual(75) = (log(y(97))-log(params(62))) - (params(51)*(log(y(16))-log(params(62))));
    residual(76) = (log(y(98))-log(params(63))) - (params(52)*(log(y(17))-log(params(63))));
    residual(77) = (log(y(99))-log(params(64))) - (params(53)*(log(y(18))-log(params(64))));
    residual(78) = (log(y(101))-log(params(66))) - (params(55)*(log(y(20))-log(params(66))));
    residual(79) = (log(y(100))-log(params(65))) - (params(54)*(log(y(19))-log(params(65))));
    residual(80) = (log(y(102))-log(params(68))) - (params(56)*(log(y(21))-log(params(68))));
    residual(81) = (log(y(103))-log(params(69))) - (params(58)*(log(y(22))-log(params(69))));

end
