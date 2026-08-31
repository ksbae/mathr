# Regularized lower incomplete gamma function P(a, x).
# Switches between the power series and the continued fraction on the
# Cephes criterion (series when x <= 1 or x <= a, continued fraction
# otherwise), as redistributed in ALGLIB specialfunctions.cs.
gammp = function(a, x)
{
  if (x < 0.0 | a <= 0.0) {
    warning("bad args in gammp")
    return(NULL)
  }
  if (x == 0.0) return (0.0)
  if (x > 1.0 & x > a) return (1.0 - gcf(a, x))
  return (gser(a, x))
}
