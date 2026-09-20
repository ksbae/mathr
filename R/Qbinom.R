Qbinom = function(p, n, pe)
{
  .Scalar1("Qbinom", p, n, pe)

  if (n <= 0 | pe <= 0. | pe >= 1.) {
    warning("bad args in binomial distribution")
    return(NULL)
  }
  if (p < 0 | p > 1) {
    warning("bad p in binomial distribution")
    return(NULL)
  }
  if (p >= 1.) return (n)

  # Quantile convention of base R: the smallest k whose cumulative
  # probability reaches p. Pbinom is built from the incomplete gamma
  # and beta and agrees with base R to about 1e-12 relative, so a
  # cumulative probability may land just under p and push the
  # answer up by one. The fuzz is sized to that accuracy; base R
  # applies the same guard with a tighter constant.
  pf = p * (1 - 4096*.Machine$double.eps)
  if (pf <= Pbinom(0, n, pe)) return (0)

  inc = 1
  k = max(0, min(n, floor(n*pe)))
  if (pf < Pbinom(k, n, pe)) {
    k = max(k - inc, 0)
    inc = inc * 2
    while (pf < Pbinom(k, n, pe)) {
      k = max(k - inc, 0)
      inc = inc * 2
    }
    kl = k
    ku = k + inc/2
  } else {
    k = min(k + inc, n + 1)
    inc = inc * 2
    while (pf > Pbinom(k, n, pe)) {
      k = min(k + inc, n + 1)
      inc = inc * 2
    }
    ku = k
    kl = k - inc/2
  }
  while (ku - kl > 1) {
    k = (kl + ku)/2
    if (pf < Pbinom(k, n, pe)) ku = k
    else kl = k
  }
  if (Pbinom(kl, n, pe) >= pf) return (kl)
  return (min(ku, n))
}
