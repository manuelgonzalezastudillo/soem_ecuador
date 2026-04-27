function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(1)=(params(9)*params(68)*params(47))^(1-params(39));
  residual(1)=(y(44))-(x(8)*(params(9)*params(68)*params(47)+x(7))+(1-x(8))*y(44)^params(39)*T(1));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1-(1-x(8))*T(1)*getPowerDeriv(y(44),params(39),1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
