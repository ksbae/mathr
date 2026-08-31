Dpois = function(n, lam)
{
  if (n < 0) {
    warning("bad n for a Poisson distribution")
    return(NULL)
  }
  if (lam <= 0.) {
    warning("bad lambda for a Poisson distribution")
    return(NULL)
  }
  return (exp(-lam + n*log(lam) - gammln(n + 1.)))
}
