# Retained for backward compatibility.
#
# In earlier releases this evaluated the incomplete beta integral by
# 18-point Gauss-Legendre quadrature for large a and b. The continued
# fraction used by betai() converges over the whole range once the
# symmetry transform is applied, so the separate large-parameter branch
# is no longer needed and this function forwards to betai().
betaiapprox = function(a, b, x)
{
  .Scalar1("betaiapprox", a, b, x)

  return (betai(a, b, x))
}
