NORM = function(x)
{
  .Scalar1("NORM", x)

  if (x == 0) return(c(0,0))
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
