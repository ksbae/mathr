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

  # Above log(.Machine$double.xmax) exp(x) is past every double, and below
  # -1075*ln2 it is under half the least subnormal and rounds to zero.
  # Outside that window the reduction below has nothing to reduce to: g
  # grows with x until y = g*g overflows and the rational form gives NaN.
  # x is its own magnitude by now, so Neg picks the limit that applies.
  BigX   = 709.78271289338397   # log(.Machine$double.xmax), 1024*ln2
  SmallX = 745.13321910194122   # 1075*ln2
  Limit  = if (Neg) SmallX else BigX

  if (x > Limit) {
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

    # Write x as xexp*ln2 + g with xexp an integer, so exp(x) = exp(g)*2^xexp.
    # xexp must be rounded to the nearest integer: that is what leaves the
    # reduced argument in |g| <= ln2/2, the interval the rational form below
    # is fitted on. c1 + c2 is ln2 split so that xexp*c1 is exact and the
    # first subtraction loses nothing.
    xexp = Round(x * invln2)
    g = x - xexp * c1 - xexp * c2

    # exp(g) = (Q(y) + g*P(y)) / (Q(y) - g*P(y)), y = g*g, written so that
    # the correction is added to 0.5. x1 is exp(g)/2, hence xexp + 1.
    y = g * g
    g = g * ((p0 * y + p1) * y + p2)
    x1 = 0.5 + g / (((q0*y + q1) * y + q2) * y + q3 - g)
    xexp = xexp + 1

    if (Neg) { 
      x1 = 1.0 / x1
      xexp = -xexp
    }

    # 2^xexp on its own overflows to Inf, or underflows to 0, at exponents
    # where x1 * 2^xexp is still a finite nonzero number, so scale in two
    # halves. Each half is exact, as scaling by a power of two should be.
    Half = xexp %/% 2
    return(DENORM(c(DENORM(c(x1, Half)), xexp - Half)))
  }
}
