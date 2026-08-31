Qpois = function(p, lam)
{
  if (lam <= 0.) {
    warning("bad lam in Poisson distribution")
    return(NULL)
  }
  if (p <= 0. | p >= 1.) {
    warning("bad p in Poisson distribution")
    return(NULL)
  }
  if (p < exp(-lam)) return (0)

  inc = 1
  n = floor(max(sqrt(lam), 5.))
  if (p < Ppois(n, lam)) {
    n = max(n - inc, 0)
    inc = inc * 2
    while (p < Ppois(n, lam)) {
      n = max(n - inc, 0)
      inc = inc * 2
    }
    nl = n
    nu = n + inc/2
  } else {
    n = n + inc
    inc = inc * 2
    while (p > Ppois(n, lam)) {
      n = n + inc
      inc = inc * 2
    }
    nu = n
    nl = n - inc/2
  }
  while (nu - nl > 1) {
    n = (nl + nu)/2
    if (p < Ppois(n, lam)) nu = n
    else nl = n
  }
  return (nl)
}

