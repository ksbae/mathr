Dbinom = function(k, n, pe)
{
  .Scalar1("Dbinom", k, n, pe)

  if (n <= 0 | pe <= 0. | pe >= 1.) {
    warning("bad args in binomial distribution")
    return(NULL)
  }
  if (k < 0) {
    warning("bad k in binomial distribution")
    return(NULL)
  }
  if (k > n) return (0.)
  return (exp(k*log(pe) + (n - k)*log(1. - pe) + gammln(n + 1.) - gammln(k + 1.) - gammln(n - k + 1.)))
}
