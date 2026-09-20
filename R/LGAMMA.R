LGAMMA = function(z)
{
  .Scalar1("LGAMMA", z)

  if (is.nan(z)) return(NaN)
  if (z == -Inf) return(NaN)
  if (z > 2.5327372760800758e+305) return(+Inf)  # including z == +Inf case
  if (z <= 0 & z == floor(z)) return(+Inf)

  if (z < 0.5) return(log(abs(pi/sin(pi*z))) - LGAMMA(1 - z))

  if (abs(z) <= 171) return(log(abs(GAMMA(z))))
  else if (abs(z) > 1e17) return(z*(log(z) - 1.))
  else {
    lnsqrt2pi = 0.9189385332046727417803296
    p = c(676.5203681218851, -1259.1392167224028,
          771.32342877765313, -176.61502916214059, 12.507343278686905,
          -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7)

    z = z - 1
    x = 0.99999999999980993
    for (i in 1:8) x = x + p[i]/(z + i)
    t = z + 7.5
    return(lnsqrt2pi + (z + 0.5)*log(t) - t + log(x))
  }
}
