function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SOE_simulations_rigid.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 107
    T = [T; NaN(107 - size(T, 1), 1)];
end
T(70) = getPowerDeriv(T(3),T(4),1);
T(71) = 1-params(1)/y(80);
T(72) = getPowerDeriv(T(2),T(32),1);
T(73) = getPowerDeriv(T(33)+T(35),T(36),1);
T(74) = getPowerDeriv(T(33)+T(38),T(36),1);
T(75) = getPowerDeriv(T(39),(-params(3)),1);
T(76) = getPowerDeriv(T(39),params(3)*params(10),1);
T(77) = y(76)*y(8)*T(63)*getPowerDeriv(y(4),1+params(4),1)/(1+params(4));
T(78) = getPowerDeriv((1-params(3))*(T(65)+params(87)),T(62),1);
T(79) = getPowerDeriv(T(8),T(4),1);
T(80) = getPowerDeriv(T(7),T(32),1);
T(81) = getPowerDeriv(T(35)+T(37),T(36),1);
T(82) = getPowerDeriv(T(37)+T(38),T(36),1);
T(83) = getPowerDeriv(T(43),(-params(3)),1);
T(84) = getPowerDeriv(T(43),params(3)*params(10),1);
T(85) = y(77)*y(14)*T(63)*getPowerDeriv(y(13),1+params(4),1)/(1+params(4));
T(86) = getPowerDeriv((1-params(3))*(T(67)+params(88)),T(62),1);
T(87) = getPowerDeriv(y(80)*y(17),1-params(5)-params(15),1);
T(88) = 1/y(80);
T(89) = getPowerDeriv(y(19)/y(80),params(5),1);
T(90) = (-(params(18)*T(27)*.01*params(2)*1/y(24)/params(81)));
T(91) = (-(1/(y(24)*4)));
T(92) = (-y(45))/(y(24)*y(24))/params(79);
T(93) = getPowerDeriv(T(51),params(29),1);
T(94) = getPowerDeriv(T(50)*T(52),1-params(36),1);
T(95) = getPowerDeriv(T(51),params(32),1);
T(96) = getPowerDeriv(T(55)*T(56),1-params(37),1);
T(97) = getPowerDeriv(T(51),params(35),1);
T(98) = getPowerDeriv(T(59)*T(60),1-params(38),1);
T(99) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(100) = getPowerDeriv(y(32)/y(33),(-params(7)),1);
T(101) = (-(1/y(24)));
T(102) = getPowerDeriv(y(39)/y(80),params(15),1);
T(103) = T(34)*getPowerDeriv(y(40),T(32),1);
T(104) = 1/y(24)/params(79);
T(105) = (-(params(17)*getPowerDeriv(y(80),params(3),1)))/(T(14)*T(14));
T(106) = (-(y(19)*y(36)*(y(23)-params(6))))/(y(80)*y(80));
T(107) = getPowerDeriv(y(80),1-params(3),1);
end
