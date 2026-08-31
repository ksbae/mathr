# Retained for backward compatibility.
#
# In earlier releases this evaluated the incomplete gamma integral by
# 18-point Gauss-Legendre quadrature for large a. The Cephes series and
# continued fraction used by gammp and gammq converge over the whole
# range, so the separate large-a branch is no longer needed and this
# function simply forwards to them.
#
#   psig = 1 -> P(a, x),  psig = 0 -> Q(a, x)
gammpapprox = function(a, x, psig = 1)
{
  if (psig == 1) return (gammp(a, x))
  return (gammq(a, x))
}
