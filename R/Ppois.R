Ppois = function(n, lam)
{
  .Scalar1("Ppois", n, lam)

  if (n < 0) {
    warning("bad n in Poisson distribution")
    return(NULL)
  }
  if (lam <= 0.) {
    warning("bad lam in Poisson distribution")
    return(NULL)
  }
  return (gammq(n + 1, lam))   # Q(n+1, lam) = P(X <= n)
}
