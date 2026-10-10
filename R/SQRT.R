SQRT = function(x)
{
  .Scalar1("SQRT", x)

  if (is.nan(x)) {
    warning ("Input is NaN.")
    return (NaN)
  } else if (is.na(x)) {
    return (NA_real_)
  } else if (x < 0) {
    warning("NaN produced")
    return (NaN)
  } else if (x == 0) {
    return (0)
  } else if (x == +Inf) {
    warning ("Input is +Inf.")
    return (+Inf)
  } else {
    Norm = NORM(x)
    x1 = Norm[1]
    xexp = Norm[2]
    sqrt2 = 1.41421356237309505
    y = (-0.1984742 * x1 + 0.8804894) * x1 + 0.3176687
    y = 0.5 * (y + x1 / y)
    y = y + x1 / y
    x1 = 0.25 * y + x1 / y
    if (xexp %% 2 == 1) {
      x1 = x1 * sqrt2
      xexp = xexp - 1
    }
    Res = DENORM(c(x1, xexp/2))
    return (Res)
  }
}

