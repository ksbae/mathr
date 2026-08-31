# Error function erf(x) = 2/sqrt(pi) * integral_0^x exp(-t^2) dt.
#
# Obtained from the regularized lower incomplete gamma function through
#   erf(x) = P(1/2, x^2),  x >= 0
# which is the relation the GNU Scientific Library uses between
# gsl_sf_erf and gsl_sf_gamma_inc_P. gammp() carries the Cephes series
# and continued fraction, so no separate coefficient table is needed
# and the accuracy of the two functions cannot drift apart.
erf = function(x)
{
  if (is.nan(x)) return (NaN)
  if (x == 0)    return (0)
  if (x < 0)     return (-erf(-x))
  if (x > 27)    return (1)          # 1 - erfc(27) rounds to 1
  return (gammp(0.5, x*x))
}
