# Inverse of the regularized incomplete beta function: returns x with
# betai(a, b, x) = p.
#
# The mean a/(a+b) supplies the starting point and the root is refined
# by Newton steps that are kept inside the bracket [0, 1], falling back
# to bisection whenever a step would leave it. This is the strategy the
# GNU Scientific Library uses for gsl_cdf_beta_Pinv, and it carries no
# fitted constants of its own.
invbetai = function(p, a, b)
{
  .Scalar1("invbetai", p, a, b)

  if (a <= 0. | b <= 0.) {
    warning("Bad a or b in routine invbetai")
    return(NULL)
  }
  if (p <= 0.) return (0.)
  if (p >= 1.) return (1.)

  afac = gammln(a + b) - gammln(a) - gammln(b)
  a1 = a - 1.
  b1 = b - 1.

  lo = 0.
  hi = 1.
  x  = a/(a + b)

  # Above the median the residual is taken in the upper tail, where
  # q - betai(b, a, 1-x) is a difference of two small numbers instead of
  # two numbers close to 1.
  q = 1. - p
  upper = (p > 0.5)
  EPS = 1e-14
  for (j in 1:200) {
    err = if (upper) q - betai(b, a, 1. - x) else betai(a, b, x) - p
    if (err > 0) hi = x else lo = x
    d = exp(a1*log(x) + b1*log(1. - x) + afac)   # dI/dx
    dx = if (is.finite(d) && d > 0) err/d else 0
    xn = x - dx
    if (!is.finite(xn) || xn <= lo || xn >= hi) xn = 0.5*(lo + hi)
    if (abs(xn - x) < EPS*abs(xn)) { x = xn; break }
    x = xn
  }
  return (x)
}
