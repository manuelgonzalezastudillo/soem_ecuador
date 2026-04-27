function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = steady_only.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 202
    T = [T; NaN(202 - size(T, 1), 1)];
end
T(166) = getPowerDeriv(T(3),T(4),2);
T(167) = T(146)*T(166);
T(168) = (-((-params(1))/(y(77)*y(77))));
T(169) = getPowerDeriv(T(8),T(4),2);
T(170) = T(149)*T(169);
T(171) = (T(14)*T(14)*(-(params(17)*getPowerDeriv(y(158),params(3),2)))-T(157)*(T(14)*T(156)+T(14)*T(156)))/(T(14)*T(14)*T(14)*T(14));
T(172) = getPowerDeriv(T(19),params(7)/(params(7)-1),2);
T(173) = getPowerDeriv(T(22),(-params(7)),2);
T(174) = getPowerDeriv(y(98)*y(158),1-params(5)-params(15),2);
T(175) = getPowerDeriv(T(26),params(5),2);
T(176) = T(107)*(-1)/(y(77)*y(77))+T(106)*(-y(19))/(y(77)*y(77))*T(175);
T(177) = getPowerDeriv(y(36)/y(77),params(15),2);
T(178) = T(131)*(-1)/(y(77)*y(77))+T(106)*(-y(36))/(y(77)*y(77))*T(177);
T(179) = (-y(36))/(y(77)*y(77))*(-y(36))/(y(77)*y(77))*T(177)+T(131)*(-((-y(36))*(y(77)+y(77))))/(y(77)*y(77)*y(77)*y(77));
T(180) = (-y(19))/(y(77)*y(77))*(-y(19))/(y(77)*y(77))*T(175)+T(107)*(-((-y(19))*(y(77)+y(77))))/(y(77)*y(77)*y(77)*y(77));
T(181) = (-(y(80)*y(39)))/(y(77)*y(77));
T(182) = (-(y(35)*y(39)))/(y(77)*y(77));
T(183) = T(29)*.01*params(2)*(-1)/(y(105)*y(105))/params(81);
T(184) = (-(T(30)*(T(82)*y(77)*(-((-y(86))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+T(81)*2*T(81))));
T(185) = getPowerDeriv(T(2),T(45),2);
T(186) = T(71)*T(185);
T(187) = getPowerDeriv(T(46)+T(48),T(49),2);
T(188) = T(47)*getPowerDeriv(y(149),T(45),2);
T(189) = T(44)*(T(145)*T(145)*T(185)+T(73)*(-((-((-(params(1)*y(3)))*(y(77)+y(77))))/(y(77)*y(77)*y(77)*y(77)))));
T(190) = getPowerDeriv(T(7),T(45),2);
T(191) = T(71)*T(190);
T(192) = getPowerDeriv(T(48)+T(50),T(49),2);
T(193) = T(44)*(T(148)*T(148)*T(190)+T(96)*(-((-((-(params(1)*y(12)))*(y(77)+y(77))))/(y(77)*y(77)*y(77)*y(77)))));
T(194) = getPowerDeriv(T(46)+T(51),T(49),2);
T(195) = getPowerDeriv(T(52),(-params(3)),2);
T(196) = getPowerDeriv(T(52),params(3)*params(10),2);
T(197) = getPowerDeriv(T(50)+T(51),T(49),2);
T(198) = getPowerDeriv(T(56),(-params(3)),2);
T(199) = getPowerDeriv(T(56),params(3)*params(10),2);
T(200) = (-((-(y(19)*y(148)*(y(104)-params(6))))*(y(77)+y(77))))/(y(77)*y(77)*y(77)*y(77));
T(201) = (-((-4)/(y(105)*4*y(105)*4)));
T(202) = (-((-1)/(y(105)*y(105))));
end
