Choose = function(n, r)
{
  .Scalar1("Choose", n, r)

  if (is.nan(n) | is.nan(r) | n==-Inf | r==+Inf | r==-Inf) return(NaN) 
  if (n == +Inf) return(+Inf)
  if (n < 0 | r < 0 | r > n | floor(n) != n | floor(r) != r) return (0)
  if (r > n / 2) r = n - r

  if (r == 0) {
    return (1)
  } else if (r == 1) {
    return (n)
  } else {
    Res = n
    for (i in 2:r) {
      Res = Res / i * (n - i + 1)
      if (Res == +Inf) {
        return(Res)
      }
    }
    return (Res)
  }
}
