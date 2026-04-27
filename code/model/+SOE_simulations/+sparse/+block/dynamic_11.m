function [y, T, residual, g1] = dynamic_11(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(12)=log(params(69));
  T(13)=log(y(196))-T(12);
  residual(1)=(T(13))-(params(58)*(log(y(85))-T(12)));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1/y(196);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
