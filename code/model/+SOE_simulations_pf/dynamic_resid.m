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
    T = SOE_simulations_pf.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(81, 1);
    residual(1) = (y(89)) - (x(it_, 8)*(params(36)+x(it_, 3))+(1-x(it_, 8))*(.99*y(17)+params(36)*0.01000000000000001));
    residual(2) = (y(88)) - (x(it_, 8)*(params(37)+x(it_, 2))+(1-x(it_, 8))*(.99*y(16)+0.01000000000000001*params(37)));
    residual(3) = (y(87)) - (x(it_, 8)*(params(38)+x(it_, 1))+(1-x(it_, 8))*(.99*y(15)+0.01000000000000001*params(38)));
    residual(4) = (y(90)) - (x(it_, 8)*(params(24)+x(it_, 4))+T(2)*T(8));
    residual(5) = (y(91)) - (x(it_, 8)*(params(25)+x(it_, 5))+T(10)*T(14));
    residual(6) = (y(92)) - (x(it_, 8)*(params(26)+x(it_, 6))+T(16)*T(20));
    residual(7) = (y(66)) - (x(it_, 8)*(params(9)*params(68)*params(47)+x(it_, 7))+(1-x(it_, 8))*T(22));
    residual(8) = (y(23)*(1+y(87))*y(55)) - (T(23)*T(27));
    residual(9) = (y(55)*(1+y(87))*y(32)) - (T(28)*T(31));
    residual(10) = (y(38)) - (y(25)*(1-params(13))+y(34)*params(13));
    residual(11) = ((1-y(88))*y(44)) - (T(33)/y(23));
    residual(12) = (y(44)) - (T(35)/y(32));
    residual(13) = (y(39)) - ((1-params(13))*y(26)+params(13)*y(35));
    residual(14) = (y(86)) - (params(49)*params(18)+params(23)*(y(102)*y(57)-params(49)*params(18)));
    residual(15) = (y(23)) - (y(86)*T(37)*y(109)/y(95)*y(104));
    residual(16) = (y(47)) - (T(41)^(params(7)/(params(7)-1)));
    residual(17) = (y(50)) - (y(47)*T(43));
    residual(18) = (y(51)) - (y(47)*T(45));
    residual(19) = (y(52)) - (T(46)*y(103));
    residual(20) = (y(49)) - (y(99)*T(47)*T(49)*T(50));
    residual(21) = (y(49)) - (y(51)+y(52));
    residual(22) = (y(47)) - (y(91)+y(90)+y(38)+y(40));
    residual(23) = (y(46)) - (y(55)*(y(91)+y(90)+y(38)+y(40))+y(56));
    residual(24) = (y(56)) - (y(54)*y(52)+y(66)/params(9)-y(48));
    residual(25) = (y(42)) - ((1-params(13))*y(29));
    residual(26) = (y(42)+y(61)) - (y(14)*y(8)/y(21)+y(12)*y(22)*y(10)/y(21)-y(56)+y(66)*(1-params(9))/params(9));
    residual(27) = (y(57)) - (params(18)*T(51));
    residual(28) = (y(28)) - ((1-params(6))*y(3)/y(21)+y(27)*T(54)*y(98));
    residual(29) = (y(41)) - ((1-params(13))*y(28));
    residual(30) = (y(40)) - ((1-params(13))*y(27));
    residual(31) = (y(43)) - (T(55)*T(56));
    residual(32) = (y(45)) - (y(21)*y(49)*y(54)*params(5)/y(7));
    residual(33) = (y(44)) - (y(49)*y(54)*(1-params(5)-params(15))/y(39));
    residual(34) = (y(55)/y(43)) - (y(98)*T(58)+T(64)*T(65)*y(110));
    residual(35) = (y(48)) - (y(50));
    residual(36) = (y(24)) - ((T(68)+T(70))^T(71));
    residual(37) = (y(33)) - ((T(70)+T(72))^T(71));
    residual(38) = (y(30)) - (y(31)*T(75));
    residual(39) = (y(31)) - (T(76)*T(77));
    residual(40) = (y(36)) - (y(37)*T(79));
    residual(41) = (y(37)) - (T(80)*T(81));
    residual(42) = (y(92)+y(12)*y(22)*y(10)/y(21)+y(90)*y(55)+y(91)*y(55)) - (y(66)+y(61)+y(26)*(1-params(13))*y(88)*y(44)+T(82)+y(38)*y(87)*y(55)+(1-params(13))*params(54));
    residual(43) = (y(59)) - (y(92)*(1-params(19))/(1-params(13)));
    residual(44) = (y(60)) - (y(92)*params(19)/params(13));
    residual(45) = (y(53)) - (y(49)*y(54)*params(15));
    residual(46) = (y(58)) - (y(91)+y(11)*(1-params(20))/y(21));
    residual(47) = (y(34)*(1+y(87))*y(55)) - (y(60)+y(44)*y(35));
    residual(48) = (y(62)) - (y(46)/y(55));
    residual(49) = (y(63)) - ((y(42)+y(61))/(y(46)*4));
    residual(50) = (y(64)) - (T(47)*T(49));
    residual(51) = (y(65)) - ((1-params(13))*params(54)+y(38)*y(87)*y(55)+y(26)*(1-params(13))*y(88)*y(44)+T(82));
    residual(52) = (y(78)) - (y(66)+y(65));
    residual(53) = (y(67)) - (y(92)+y(90)*y(55)+y(91)*y(55));
    residual(54) = (y(68)) - (y(61)/(y(46)*4));
    residual(55) = (y(69)) - (y(42)/(y(46)*4));
    residual(56) = (y(72)) - (y(90)/y(62));
    residual(57) = (y(73)) - (y(91)/y(62));
    residual(58) = (y(74)) - (y(92)/y(46));
    residual(59) = (y(70)) - (y(65)/y(46));
    residual(60) = (y(71)) - (y(66)/y(46));
    residual(61) = (y(79)) - (y(78)/y(46));
    residual(62) = (y(75)) - (y(67)/y(46));
    residual(63) = (y(76)) - ((y(66)+y(65)-y(67))/y(46));
    residual(64) = (y(77)) - (y(12)*(y(22)*y(10)-1)/y(21)/y(46));
    residual(65) = (y(80)) - (y(57)^4-1);
    residual(66) = (y(81)) - (y(44)/y(55));
    residual(67) = (y(82)) - (y(54)*y(49)/y(55));
    residual(68) = (y(83)) - (y(38)*y(87)*y(55)/y(46));
    residual(69) = (y(84)) - (y(26)*(1-params(13))*y(88)*y(44)/y(46));
    residual(70) = (y(85)) - (T(82)/y(46));
    residual(71) = (y(95)) - (params(40));
    residual(72) = (y(96)) - (params(41));
    residual(73) = (y(97)) - (params(42));
    residual(74) = (y(98)) - (params(43));
    residual(75) = (y(99)) - (params(44));
    residual(76) = (y(100)) - (params(45));
    residual(77) = (y(101)) - (params(46));
    residual(78) = (y(102)) - (params(49));
    residual(79) = (y(103)) - (params(50));
    residual(80) = (y(93)) - ((y(61)-T(83))/y(46));
    residual(81) = (y(94)) - (y(56)/y(46));

end
