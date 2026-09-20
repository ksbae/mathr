# Continued fraction for the regularized incomplete beta function,
# Abramowitz and Stegun 26.5.8, evaluated by the modified Lentz
# recurrence. The caller supplies the prefactor:
#
#   I_x(a,b) = x^a (1-x)^b / (a B(a,b)) * betacf(a, b, x)
#
# converging rapidly for x < (a+1)/(a+b+2). Follows beta_cont_frac of
# the GNU Scientific Library (specfunc/beta_inc.c).
betacf = function(a, b, x)
{
  .Scalar1("betacf", a, b, x)

  MAXITER = 512
  CUTOFF  = 2.0 * .Machine$double.xmin
  EPS     = 2.0 * .Machine$double.eps

  num = 1.0
  den = 1.0 - (a + b)*x/(a + 1.0)
  if (abs(den) < CUTOFF) den = CUTOFF
  den = 1.0/den
  cf  = den

  for (k in 1:MAXITER) {
    # even step
    coeff = k*(b - k)*x / (((a - 1.0) + 2*k) * (a + 2*k))
    den = 1.0 + coeff*den
    num = 1.0 + coeff/num
    if (abs(den) < CUTOFF) den = CUTOFF
    if (abs(num) < CUTOFF) num = CUTOFF
    den = 1.0/den
    cf  = cf * den * num

    # odd step
    coeff = -(a + k)*(a + b + k)*x / ((a + 2*k) * (a + 2*k + 1.0))
    den = 1.0 + coeff*den
    num = 1.0 + coeff/num
    if (abs(den) < CUTOFF) den = CUTOFF
    if (abs(num) < CUTOFF) num = CUTOFF
    den = 1.0/den
    delta = den * num
    cf = cf * delta

    if (abs(delta - 1.0) < EPS) break
  }
  return (cf)
}
