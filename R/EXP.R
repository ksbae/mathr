EXP = function(x)
{
  if (is.nan(x)) {
    warning ("Input is NaN.") 
    return (NaN)
  } else if (x == +Inf) {
    warning ("Input is +Inf.") 
    return (+Inf)
  } else if (x == -Inf) {
    warning ("Input is -Inf.") 
    return (-Inf)
  } else if (x == 0) {
    return (1.0)
  }

  if (x < 0) {
    x = -x 
    Neg = TRUE
  } else {
    Neg = FALSE
  }

  if (x > 0.9 * .Machine$double.xmax) {
    if (Neg) { 
      return (0)
    } else { 
      warning ("+Inf produced")    
      return (+Inf) 
    }
  } else {
    p0     =  0.31555192765684646356e-4
    p1     =  0.75753180159422776666e-2
    p2     =  0.25000000000000000000e+0
    q0     =  0.75104028399870046114e-6
    q1     =  0.63121894374398503557e-3
    q2     =  0.56817302698551221787e-1
    q3     =  0.50000000000000000000e+0
    c1     =  22713.0/32768.0
    c2     =  1.428606820309417232e-6
    invln2 =  1.4426950408889634074
    Rteps  = SQRT(.Machine$double.eps)

    xexp = x * invln2
    g = x - xexp * c1 - xexp * c2
    if (g > -Rteps & g < Rteps) { 
      x1 = 1.0
    } else {
      y = g * g
      g = g * ((p0 * y + p1) * y + p2)
      x1 = 0.5 + g / (((q0*y + q1) * y + q2) * y + q3 - g)
      xexp = xexp + 1
    }
    if (Neg) { 
      x1 = 1.0 / x1
      xexp = -xexp
    }
    # Check overflow before return
    return(DENORM(c(x1, xexp)))
  }
}
