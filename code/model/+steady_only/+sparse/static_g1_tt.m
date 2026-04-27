function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = steady_only.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 72
    T = [T; NaN(72 - size(T, 1), 1)];
end
T(48) = getPowerDeriv(T(3),T(4),1);
T(49) = 1-params(1)/y(77);
T(50) = getPowerDeriv(T(2),T(32),1);
T(51) = getPowerDeriv(T(33)+T(35),T(36),1);
T(52) = getPowerDeriv(T(33)+T(38),T(36),1);
T(53) = getPowerDeriv(T(39),(-params(3)),1);
T(54) = getPowerDeriv(T(39),params(3)*params(10),1);
T(55) = getPowerDeriv(T(8),T(4),1);
T(56) = getPowerDeriv(T(7),T(32),1);
T(57) = getPowerDeriv(T(35)+T(37),T(36),1);
T(58) = getPowerDeriv(T(37)+T(38),T(36),1);
T(59) = getPowerDeriv(T(43),(-params(3)),1);
T(60) = getPowerDeriv(T(43),params(3)*params(10),1);
T(61) = getPowerDeriv(y(77)*y(17),1-params(5)-params(15),1);
T(62) = 1/y(77);
T(63) = getPowerDeriv(y(19)/y(77),params(5),1);
T(64) = (-(params(18)*T(27)*.01*params(2)*1/y(24)/params(81)));
T(65) = (-(1/(y(24)*4)));
T(66) = getPowerDeriv(T(19),params(7)/(params(7)-1),1);
T(67) = getPowerDeriv(y(32)/y(33),(-params(7)),1);
T(68) = getPowerDeriv(y(36)/y(77),params(15),1);
T(69) = (-(1/y(24)));
T(70) = T(34)*getPowerDeriv(y(68),T(32),1);
T(71) = (-(params(17)*getPowerDeriv(y(77),params(3),1)))/(T(14)*T(14));
T(72) = (-(y(19)*y(67)*(y(23)-params(6))))/(y(77)*y(77));
end
