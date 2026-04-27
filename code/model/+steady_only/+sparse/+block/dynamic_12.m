function [y, T] = dynamic_12(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(118)=y(151)*(1-params(19))/(1-params(13));
  y(119)=y(151)*params(19)/params(13);
  y(117)=y(150)+y(36)*(1-params(20))/y(77);
  y(125)=y(160)*y(152)*params(9);
end
