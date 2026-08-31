Qbinom = function(p, n, pe)
{
  if (n <= 0 | pe <= 0. | pe >= 1.) {
    warning("bad args in binomial distribution")
    return(NULL)
  }
  if (p < 0 | p > 1) {
    warning("bad p in binomial distribution")
    return(NULL)
  }

  inc = 1
  k = max(0, min(n, floor(n*pe)))
  if (p < Pbinom(k, n, pe)) {
    k = max(k - inc, 0)
    inc = inc * 2
    while (p < Pbinom(k, n, pe)) {
      k = max(k - inc, 0)
      inc = inc * 2
    }
    kl = k
    ku = k + inc/2
  } else {
    k = min(k + inc, n + 1)
    inc = inc * 2
    while (p > Pbinom(k, n, pe)) {
      k = min(k + inc, n + 1)
      inc = inc * 2
    }
    ku = k
    kl = k - inc/2
  }
  while (ku - kl > 1) {
    k = (kl + ku)/2
    if (p < Pbinom(k, n, pe)) ku = k
    else kl = k
  }
  return (kl)
}
