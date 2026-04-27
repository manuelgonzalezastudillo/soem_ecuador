function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(149)=params(42)*y(38)+(1-params(42))*params(24)+x(1);
  y(148)=params(43)*y(37)+(1-params(43))*params(25)+x(2);
  y(147)=params(44)*y(36)+(1-params(44))*params(26)+x(3);
end
