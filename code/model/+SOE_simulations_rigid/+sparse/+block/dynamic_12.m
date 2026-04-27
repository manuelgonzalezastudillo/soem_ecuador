function [y, T, residual, g1] = dynamic_12(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(14)=log(params(67));
  T(15)=log(y(194))-T(14);
  residual(1)=(T(15))-(params(57)*(log(y(83))-T(14))+x(7));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1/y(194);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
