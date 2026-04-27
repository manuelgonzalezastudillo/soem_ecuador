function [y, T, residual, g1] = dynamic_10(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(9)=log(params(68));
  residual(1)=(log(y(161))-T(9))-(params(56)*(log(y(80))-T(9)));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1/y(161);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
