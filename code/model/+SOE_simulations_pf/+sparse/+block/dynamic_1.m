function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(148)=x(8)*(params(36)+x(3))+(1-x(8))*(.99*y(67)+params(36)*0.01000000000000001);
  y(147)=x(8)*(params(37)+x(2))+(1-x(8))*(.99*y(66)+0.01000000000000001*params(37));
  y(146)=x(8)*(params(38)+x(1))+(1-x(8))*(.99*y(65)+0.01000000000000001*params(38));
  T(1)=(params(9)*params(68)*params(47))^(1-params(39));
  y(125)=x(8)*(params(9)*params(68)*params(47)+x(7))+(1-x(8))*y(44)^params(39)*T(1);
  y(154)=params(40);
  y(155)=params(41);
  y(156)=params(42);
  y(157)=params(43);
  y(158)=params(44);
  y(159)=params(45);
  y(160)=params(46);
  y(161)=params(49);
  y(162)=params(50);
end
