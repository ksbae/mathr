# Regularized incomplete beta function I_x(a, b).
#
# The continued fraction of betacf() converges quickly only for
# x < (a+1)/(a+b+2), so the symmetry I_x(a,b) = 1 - I_{1-x}(b,a) is
# used on the other side. Follows gsl_sf_beta_inc_e of the GNU
# Scientific Library (specfunc/beta_inc.c).
betai = function(a, b, x)
{
  .Scalar1("betai", a, b, x)

    if (a <= 0.0 | b <= 0.0) {
      warning("Bad a or b in routine betai")
      return(NULL)
    }
    if (x < 0.0 | x > 1.0) {
      warning("Bad x in routine betai")
      return(NULL)
    }
    if (x == 0.0 | x == 1.0) return (x)

    bt = exp(gammln(a + b) - gammln(a) - gammln(b) + a*log(x) + b*log(1.0 - x))
    if (x < (a + 1.0)/(a + b + 2.0)) return (bt * betacf(a, b, x) / a)
    else return (1.0 - bt * betacf(b, a, 1.0 - x) / b)
}
