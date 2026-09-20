Pbinom = function(k, n, pe)
{
  .Scalar1("Pbinom", k, n, pe)

  if (n <= 0 | pe <= 0. | pe >= 1.) {
    warning("bad args in binomial distribution")
    return(NULL)
  }
  if (k < 0) {
    warning("bad k in binomial distribution")
    return(NULL)
  }
  if (k >= n) return (1.)
  # P(X <= k) = I_{1-pe}(n-k, k+1). Taken in this direction the far
  # lower tail stays accurate; the complementary form 1 - I_pe(k+1, n-k)
  # cancels to zero there (Pbinom(0, 50, 0.7) is 0.3^50 = 7.2e-27).
  return (betai(n - k, k + 1., 1. - pe))
}
