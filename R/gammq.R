# Regularized upper incomplete gamma function Q(a, x) = 1 - P(a, x).
# Switches between the continued fraction and the power series on the
# Cephes criterion, as redistributed in ALGLIB specialfunctions.cs.
gammq = function(a, x)
{
  if (x < 0.0 | a <= 0.0) {
    warning("bad args in gammq")
    return(NULL)
  }
  if (x == 0.0) return (1.0)
  if (x < 1.0 | x < a) return (1.0 - gser(a, x))
  return (gcf(a, x))
}
