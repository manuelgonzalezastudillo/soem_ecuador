function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SOE_simulations_rigid.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 121
    T = [T; NaN(121 - size(T, 1), 1)];
end
T(82) = getPowerDeriv(T(3),T(4),1);
T(83) = (-(params(1)/y(80)));
T(84) = getPowerDeriv(T(2),T(41),1);
T(85) = getPowerDeriv(T(42)+T(44),T(45),1);
T(86) = getPowerDeriv(T(42)+T(47),T(45),1);
T(87) = getPowerDeriv(T(48),(-params(3)),1);
T(88) = getPowerDeriv(T(48),params(3)*params(10),1);
T(89) = y(187)*y(119)*T(75)*getPowerDeriv(y(115),1+params(4),1)/(1+params(4));
T(90) = getPowerDeriv((1-params(3))*(T(77)+params(87)),T(74),1);
T(91) = 2*(y(80)*y(116)/y(5)-params(64));
T(92) = getPowerDeriv(T(8),T(4),1);
T(93) = getPowerDeriv(T(7),T(41),1);
T(94) = getPowerDeriv(T(44)+T(46),T(45),1);
T(95) = getPowerDeriv(T(46)+T(47),T(45),1);
T(96) = getPowerDeriv(T(52),(-params(3)),1);
T(97) = getPowerDeriv(T(52),params(3)*params(10),1);
T(98) = y(188)*y(125)*T(75)*getPowerDeriv(y(124),1+params(4),1)/(1+params(4));
T(99) = getPowerDeriv((1-params(3))*(T(79)+params(88)),T(74),1);
T(100) = getPowerDeriv(y(128)*y(191),1-params(5)-params(15),1);
T(101) = (-(y(80)*(-(y(33)*(y(144)*y(152)+y(144)*y(129))))/((y(33)*y(18)+y(41)*y(33))*(y(33)*y(18)+y(41)*y(33)))));
T(102) = 1/y(80);
T(103) = getPowerDeriv(y(19)/y(80),params(5),1);
T(104) = (-(params(18)*T(27)*.01*params(2)*1/y(135)/params(81)));
T(105) = (-(1/(y(135)*4)));
T(106) = (-(1/y(135)));
T(107) = (-y(45))/(y(24)*y(24))/params(79);
T(108) = getPowerDeriv(T(60),params(29),1);
T(109) = getPowerDeriv(T(62),1-params(36),1);
T(110) = getPowerDeriv(T(60),params(32),1);
T(111) = getPowerDeriv(T(67),1-params(37),1);
T(112) = getPowerDeriv(T(60),params(35),1);
T(113) = getPowerDeriv(T(72),1-params(38),1);
T(114) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(115) = getPowerDeriv(y(143)/y(144),(-params(7)),1);
T(116) = getPowerDeriv(y(39)/y(80),params(15),1);
T(117) = T(43)*getPowerDeriv(y(151),T(41),1);
T(118) = 1/y(24)/params(79);
T(119) = (-(y(19)*y(147)*(y(134)-params(6))))/(y(80)*y(80));
T(120) = (-(params(17)*getPowerDeriv(y(191),params(3),1)))/(T(14)*T(14));
T(121) = getPowerDeriv(y(191),1-params(3),1);
end
