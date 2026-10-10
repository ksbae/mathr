NORM = function(x)
{
  .Scalar1("NORM", x)

  # Halving Inf, or doubling a negative number, never reaches [0.5, 1],
  # so either would loop forever below.
  if (!is.finite(x)) stop ("NORM needs a finite x.", call. = FALSE)
  if (x == 0) return(c(0,0))
  if (x < 0) {                  # the fraction carries the sign
    Res = NORM(-x)
    return(c(-Res[1], Res[2]))
  }
  n = 0
  if (x > 0.5) {
    while (x > 1) {
      x = x / 2
      n = n + 1
    }
  } else {
    while (x < 0.5) {
      x = x * 2
      n = n - 1
    }
  }
  return(c(x, n))
}
