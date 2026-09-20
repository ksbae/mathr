# Complementary error function erfc(x) = 1 - erf(x), evaluated directly
# so that no accuracy is lost to cancellation in the right tail.
#
# Obtained from the regularized upper incomplete gamma function through
#   erfc(x) = Q(1/2, x^2),  x >= 0
# which is the relation the GNU Scientific Library uses between
# gsl_sf_erfc and gsl_sf_gamma_inc_Q. This holds to full precision down
# to erfc(26) = 5.7e-296, where a rational fit in x alone has long since
# lost its significant digits.
erfc = function(x)
{
  .Scalar1("erfc", x)

  if (is.nan(x)) return (NaN)
  if (x == 0)    return (1)
  if (x < 0)     return (2 - erfc(-x))
  return (gammq(0.5, x*x))
}
