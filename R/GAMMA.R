GAMMA = function(z)
{
  if (is.nan(z)) return (NaN)
  if (z == -Inf) return (NaN)
  if (z > 171.61) return(+Inf) # including z == +Inf case
  if (z <= 0 & z == floor(z)) return(+Inf)

  if (z < 0.5) return(pi/(sin(pi*z)*GAMMA(1 - z)))
  if (z == floor(z) & z < 172) return (tableFactorial(z - 1))

  sqrt2pi = 2.506628274631000502415765
  p = c(676.5203681218851, -1259.1392167224028,
        771.32342877765313, -176.61502916214059, 12.507343278686905,
        -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7)
  z = z - 1
  x = 0.99999999999980993
  for (i in 1:8) x = x + p[i]/(z + i)
  t = z + 7.5
  if (z > 141.2) { 
    return(sqrt2pi*exp((z + 0.5)*log(t) - t + log(x)))
  } else {
    return(sqrt2pi*t^(z + 0.5)*exp(-t)*x)
  }
}
