Qpois = function(p, lam)
{
  .Scalar1("Qpois", p, lam)

  if (lam <= 0.) {
    warning("bad lam in Poisson distribution")
    return(NULL)
  }
  if (p <= 0. | p >= 1.) {
    warning("bad p in Poisson distribution")
    return(NULL)
  }
  # Quantile convention of base R: the smallest n whose cumulative
  # probability reaches p. Ppois is built from the incomplete gamma
  # and beta and agrees with base R to about 1e-12 relative, so a
  # cumulative probability may land just under p and push the
  # answer up by one. The fuzz is sized to that accuracy; base R
  # applies the same guard with a tighter constant.
  pf = p * (1 - 4096*.Machine$double.eps)
  if (pf <= exp(-lam)) return (0)

  inc = 1
  n = floor(max(sqrt(lam), 5.))
  if (pf < Ppois(n, lam)) {
    n = max(n - inc, 0)
    inc = inc * 2
    while (pf < Ppois(n, lam)) {
      n = max(n - inc, 0)
      inc = inc * 2
    }
    nl = n
    nu = n + inc/2
  } else {
    n = n + inc
    inc = inc * 2
    while (pf > Ppois(n, lam)) {
      n = n + inc
      inc = inc * 2
    }
    nu = n
    nl = n - inc/2
  }
  while (nu - nl > 1) {
    n = (nl + nu)/2
    if (pf < Ppois(n, lam)) nu = n
    else nl = n
  }
  if (Ppois(nl, lam) >= pf) return (nl)
  return (nu)
}

