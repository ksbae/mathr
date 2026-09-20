# Inverse of the regularized lower incomplete gamma function: returns x
# with gammp(a, x) = p.
#
# A Wilson-Hilferty cube-root normal approximation (Wilson and Hilferty,
# PNAS 17:684, 1931) supplies the starting point for a > 1, and the
# small-p series x ~ (p Gamma(a+1))^(1/a) is used otherwise. The root is
# then refined by Newton steps that are kept inside a bracket and fall
# back to bisection whenever a step would leave it. This is the strategy
# the GNU Scientific Library uses for gsl_cdf_gamma_Pinv, and it carries
# no fitted constants of its own.
invgammp = function(p, a)
{
  .Scalar1("invgammp", p, a)

    if (a <= 0.) {
      warning("a must be pos in invgammap")
      return(NULL)
    }
    if (p >= 1.) return (max(100., a + 100.*sqrt(a)))
    if (p <= 0.) return (0.0)

    gln = gammln(a)

    # starting point
    if (a > 1.) {
      z  = -sqrt(2) * inverfc(2*p)          # standard normal quantile
      ch = 1. - 1./(9.*a) + z/(3.*sqrt(a))
      x  = if (ch > 0) a*ch^3 else a*.Machine$double.eps
    } else {
      x = exp((log(p) + gln + log(a))/a)    # p ~ x^a / (a Gamma(a))
    }
    if (!is.finite(x) || x <= 0) x = a

    # bracket the root
    lo = 0.
    hi = x
    while (gammp(a, hi) < p) {
      lo = hi
      hi = hi * 2.
      if (hi > 1e300) break
    }
    if (x <= lo || x >= hi) x = 0.5*(lo + hi)

    # bisection-safeguarded Newton.
    # Above the median the residual is taken in the upper tail: both
    # gammp(a,x) and p are then close to 1 and their difference would
    # lose every significant digit, while q - gammq(a,x) is a difference
    # of two small numbers and keeps full relative precision.
    q = 1. - p
    upper = (p > 0.5)
    EPS = 1e-14
    for (j in 1:200) {
      err = if (upper) q - gammq(a, x) else gammp(a, x) - p
      if (err > 0) hi = x else lo = x
      d = exp(-x + (a - 1.)*log(x) - gln)   # dP/dx
      dx = if (d > 0) err/d else 0
      xn = x - dx
      if (!is.finite(xn) || xn <= lo || xn >= hi) xn = 0.5*(lo + hi)
      if (abs(xn - x) < EPS*abs(xn)) { x = xn; break }
      x = xn
    }
    return (x)
}
