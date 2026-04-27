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
    T = SOE_simulations.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(111, 1);
    residual(1) = (y(35)*(1+y(72))*y(67)) - (T(1)*T(5));
    residual(2) = (y(67)*(1+y(72))*y(44)) - (T(6)*T(9));
    residual(3) = (y(50)) - (y(37)*(1-params(13))+y(46)*params(13));
    residual(4) = ((1-y(71))*y(56)) - (T(11)/y(35));
    residual(5) = (y(56)) - (T(13)/y(44));
    residual(6) = (y(51)) - ((1-params(13))*y(38)+params(13)*y(47));
    residual(7) = (y(108)) - (params(68)*params(18)+params(23)*(y(118)*y(69)-params(68)*params(18)));
    residual(8) = (y(35)) - (y(108)*T(15)*y(151)/y(109)*y(146));
    residual(9) = (y(59)) - (T(19)^(params(7)/(params(7)-1)));
    residual(10) = (y(62)) - (y(59)*T(21));
    residual(11) = (y(63)) - (y(59)*T(22));
    residual(12) = (y(64)) - (T(23)*y(119));
    residual(13) = (y(61)) - (y(113)*T(24)*T(25)*T(26));
    residual(14) = (y(61)) - (y(63)+y(64));
    residual(15) = (y(59)) - (y(50)+y(52)+y(74)+y(75));
    residual(16) = (y(58)) - (y(67)*(y(50)+y(52)+y(74)+y(75))+y(68));
    residual(17) = (y(68)) - (y(66)*y(64)+y(117)*y(116)-y(60));
    residual(18) = (y(54)) - ((1-params(13))*y(41));
    residual(19) = (y(54)+y(79)) - (y(22)*y(10)/y(28)+y(32)*y(13)*y(21)/y(28)-y(68)+y(116)*y(117)*(1-params(9)));
    residual(20) = (y(69)) - (params(18)*T(27));
    residual(21) = (y(40)) - ((1-params(6))*y(3)/y(28)+y(39)*T(29)*y(112));
    residual(22) = (y(53)) - ((1-params(13))*y(40));
    residual(23) = (y(52)) - ((1-params(13))*y(39));
    residual(24) = (y(55)) - (T(30)*T(31));
    residual(25) = (y(57)) - (y(28)*y(61)*y(66)*params(5)/y(9));
    residual(26) = (y(56)) - (y(61)*y(66)*(1-params(5)-params(15))/y(51));
    residual(27) = (y(67)/y(55)) - (y(112)*T(33)+T(38)*T(39)*y(152));
    residual(28) = (y(60)) - (y(62));
    residual(29) = (y(36)) - ((T(42)+T(44))^T(45));
    residual(30) = (y(45)) - ((T(44)+T(46))^T(45));
    residual(31) = (y(42)) - (y(43)*T(49));
    residual(32) = (y(43)) - (T(50)*T(51));
    residual(33) = (y(48)) - (y(49)*T(53));
    residual(34) = (y(49)) - (T(54)*T(55));
    residual(35) = (y(32)*y(13)*y(21)/y(28)+y(67)*y(74)+y(67)*y(75)+y(76)) - (y(79)+y(116)*y(117)*params(9)+y(38)*(1-params(13))*y(71)*y(56)+T(56)+y(50)*y(72)*y(67)+(1-params(13))*params(73));
    residual(36) = (y(77)) - (y(76)*(1-params(19))/(1-params(13)));
    residual(37) = (y(78)) - (y(76)*params(19)/params(13));
    residual(38) = (y(65)) - (y(61)*y(66)*params(15));
    residual(39) = (y(73)) - (y(75)+y(17)*(1-params(20))/y(28));
    residual(40) = (y(72)) - (params(42)*y(16)+(1-params(42))*params(24)+x(it_, 1));
    residual(41) = (y(71)) - (params(43)*y(15)+(1-params(43))*params(25)+x(it_, 2));
    residual(42) = (y(70)) - (params(44)*y(14)+(1-params(44))*params(26)+x(it_, 3));
    residual(43) = (y(75)) - (T(57)*T(63)*exp(x(it_, 5)));
    residual(44) = (y(74)) - (T(64)*T(68)*exp(x(it_, 4)));
    residual(45) = (y(76)) - (T(69)*T(73)*exp(x(it_, 6)));
    residual(46) = (y(46)*(1+y(72))*y(67)) - (y(78)+y(56)*y(47));
    residual(47) = (y(80)) - (y(58)/y(67));
    residual(48) = (y(81)) - ((y(54)+y(79))/(y(58)*4));
    residual(49) = (y(82)) - (T(24)*T(25));
    residual(50) = (y(83)) - (T(74)*y(36)^(1-params(3))-T(77));
    residual(51) = (y(84)) - (T(74)*y(45)^(1-params(3))-T(79));
    residual(52) = (y(85)) - (1-T(80)/y(36));
    residual(53) = (y(86)) - (1-T(81)/y(45));
    residual(54) = (y(87)) - ((1-params(13))*params(73)+y(50)*y(72)*y(67)+y(38)*(1-params(13))*y(71)*y(56)+T(56));
    residual(55) = (y(88)) - (y(116)*y(117)*params(9));
    residual(56) = (y(100)) - (y(87)+y(88));
    residual(57) = (y(89)) - (y(67)*y(74)+y(67)*y(75)+y(76));
    residual(58) = (y(90)) - (y(79)/(y(58)*4));
    residual(59) = (y(91)) - (y(54)/(y(58)*4));
    residual(60) = (y(94)) - (y(74)/y(80));
    residual(61) = (y(95)) - (y(75)/y(80));
    residual(62) = (y(96)) - (y(76)/y(58));
    residual(63) = (y(92)) - (y(87)/y(58));
    residual(64) = (y(93)) - (y(88)/y(58));
    residual(65) = (y(101)) - (y(100)/y(58));
    residual(66) = (y(97)) - (y(89)/y(58));
    residual(67) = (y(98)) - ((y(87)+y(88)-y(89))/y(58));
    residual(68) = (y(99)) - (y(21)*(y(32)*y(13)-1)/y(28)/y(58));
    residual(69) = (y(102)) - (y(69)^4-1);
    residual(70) = (y(103)) - (y(56)/y(67));
    residual(71) = (y(104)) - (y(66)*y(61)/y(67));
    residual(72) = (y(105)) - (y(50)*y(72)*y(67)/y(58));
    residual(73) = (y(106)) - (y(38)*(1-params(13))*y(71)*y(56)/y(58));
    residual(74) = (y(107)) - (T(56)/y(58));
    residual(75) = (log(y(109))-log(params(59))) - (params(49)*(log(y(23))-log(params(59))));
    residual(76) = (log(y(110))-log(params(60))) - (params(50)*(log(y(24))-log(params(60))));
    residual(77) = (log(y(111))-log(params(61))) - (params(50)*(log(y(25))-log(params(61))));
    residual(78) = (log(y(112))-log(params(62))) - (params(51)*(log(y(26))-log(params(62))));
    residual(79) = (log(y(113))-log(params(63))) - (params(52)*(log(y(27))-log(params(63))));
    residual(80) = (log(y(114))-log(params(64))) - (params(53)*(log(y(28))-log(params(64))));
    residual(81) = (log(y(116))-log(params(66))) - (params(55)*(log(y(30))-log(params(66))));
    residual(82) = (log(y(115))-log(params(65))) - (params(54)*(log(y(29))-log(params(65))));
    residual(83) = (log(y(118))-log(params(68))) - (params(56)*(log(y(32))-log(params(68))));
    residual(84) = (log(y(119))-log(params(69))) - (params(58)*(log(y(33))-log(params(69))));
    residual(85) = (log(y(117))-log(params(67))) - (params(57)*(log(y(31))-log(params(67)))+x(it_, 7));
    residual(86) = (y(120)) - (y(58)-y(117)*y(116));
    residual(87) = (y(121)) - (y(28)*y(120)/y(34));
    residual(88) = (y(122)) - (y(28)*y(67)*y(50)/(y(12)*y(7)));
    residual(89) = (y(123)) - (y(28)*(y(67)*y(75)+y(67)*y(52))/(y(12)*y(8)+y(19)*y(12)));
    residual(90) = (y(124)) - (y(28)*y(67)*y(74)/(y(18)*y(12)));
    residual(91) = (y(125)) - (y(28)*y(67)*y(75)/(y(19)*y(12)));
    residual(92) = (y(126)) - ((y(79)-y(21)/y(28))/y(58));
    residual(93) = (y(130)) - ((y(54)-y(10)/y(28))/y(58));
    residual(94) = (y(128)) - (T(20));
    residual(95) = (y(127)) - (y(68)/y(58));
    residual(96) = (y(129)) - (y(28)*y(76)/y(20));
    residual(97) = (y(131)) - (y(121)-params(64));
    residual(98) = (y(132)) - (y(122)-params(64));
    residual(99) = (y(133)) - (y(123)-params(64));
    residual(100) = (y(134)) - (y(69)-params(18));
    residual(101) = (y(135)) - (log(y(117))-log(params(67)));
    residual(102) = (y(136)) - (log(y(116))-log(params(66)));
    residual(103) = (y(139)) - (log(y(118))-log(params(68)));
    residual(104) = (y(140)) - (log(y(119))-log(params(69)));
    residual(105) = (y(138)) - (y(126)-params(83)*(1-1/params(64))/params(82));
    residual(106) = (y(144)) - (y(130)-(1-1/params(64))*params(84)/params(82));
    residual(107) = (y(137)) - (y(124)-params(64));
    residual(108) = (y(141)) - (y(125)-params(64));
    residual(109) = (y(142)) - (y(129)-params(64));
    residual(110) = (y(143)) - (y(127)-params(85)/params(82));
    residual(111) = (y(145)) - (log(y(51))-log(params(86)));

end
