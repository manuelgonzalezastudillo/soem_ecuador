function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = SOE_simulations_pf.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 252
    T = [T; NaN(252 - size(T, 1), 1)];
end
T(208) = (-((-y(39))*(y(24)+y(24))))/(y(24)*y(24)*y(24)*y(24))/params(60);
T(209) = getPowerDeriv(T(5),params(30),2);
T(210) = getPowerDeriv(T(7),1-params(34),2);
T(211) = (-1)/(y(24)*y(24))/params(60);
T(212) = getPowerDeriv(T(5),params(28),2);
T(213) = getPowerDeriv(T(13),1-params(33),2);
T(214) = getPowerDeriv(T(5),params(32),2);
T(215) = getPowerDeriv(T(19),1-params(35),2);
T(216) = getPowerDeriv(T(25),T(26),2);
T(217) = T(188)*T(216);
T(218) = (-((-params(1))/(y(78)*y(78))));
T(219) = getPowerDeriv(T(30),T(26),2);
T(220) = T(191)*T(219);
T(221) = (T(36)*T(36)*(-(params(17)*getPowerDeriv(y(159),params(3),2)))-T(199)*(T(36)*T(198)+T(36)*T(198)))/(T(36)*T(36)*T(36)*T(36));
T(222) = getPowerDeriv(T(41),params(7)/(params(7)-1),2);
T(223) = getPowerDeriv(T(44),(-params(7)),2);
T(224) = getPowerDeriv(y(98)*y(159),1-params(5)-params(15),2);
T(225) = getPowerDeriv(T(48),params(5),2);
T(226) = T(130)*(-1)/(y(78)*y(78))+T(129)*(-y(19))/(y(78)*y(78))*T(225);
T(227) = getPowerDeriv(y(36)/y(78),params(15),2);
T(228) = T(166)*(-1)/(y(78)*y(78))+T(129)*(-y(36))/(y(78)*y(78))*T(227);
T(229) = (-y(36))/(y(78)*y(78))*(-y(36))/(y(78)*y(78))*T(227)+T(166)*(-((-y(36))*(y(78)+y(78))))/(y(78)*y(78)*y(78)*y(78));
T(230) = (-y(19))/(y(78)*y(78))*(-y(19))/(y(78)*y(78))*T(225)+T(130)*(-((-y(19))*(y(78)+y(78))))/(y(78)*y(78)*y(78)*y(78));
T(231) = (-(y(39)*y(80)))/(y(78)*y(78));
T(232) = (-(y(39)*y(35)))/(y(78)*y(78));
T(233) = T(51)*.01*params(2)*(-1)/(y(105)*y(105))/params(62);
T(234) = (-(T(52)*(T(105)*y(78)*(-((-y(86))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+T(104)*2*T(104))));
T(235) = getPowerDeriv(T(24),T(67),2);
T(236) = T(94)*T(235);
T(237) = getPowerDeriv(T(68)+T(70),T(71),2);
T(238) = T(69)*getPowerDeriv(y(149),T(67),2);
T(239) = T(66)*(T(187)*T(187)*T(235)+T(96)*(-((-((-(params(1)*y(3)))*(y(78)+y(78))))/(y(78)*y(78)*y(78)*y(78)))));
T(240) = getPowerDeriv(T(29),T(67),2);
T(241) = T(94)*T(240);
T(242) = getPowerDeriv(T(70)+T(72),T(71),2);
T(243) = T(66)*(T(190)*T(190)*T(240)+T(119)*(-((-((-(params(1)*y(12)))*(y(78)+y(78))))/(y(78)*y(78)*y(78)*y(78)))));
T(244) = getPowerDeriv(T(68)+T(73),T(71),2);
T(245) = getPowerDeriv(T(74),(-params(3)),2);
T(246) = getPowerDeriv(T(74),params(3)*params(10),2);
T(247) = getPowerDeriv(T(72)+T(73),T(71),2);
T(248) = getPowerDeriv(T(78),(-params(3)),2);
T(249) = getPowerDeriv(T(78),params(3)*params(10),2);
T(250) = (-((-(y(19)*y(148)*(y(104)-params(6))))*(y(78)+y(78))))/(y(78)*y(78)*y(78)*y(78));
T(251) = (-((-4)/(y(105)*4*y(105)*4)));
T(252) = (-((-1)/(y(105)*y(105))));
end
