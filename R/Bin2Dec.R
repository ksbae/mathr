Bin2Dec = function(b)
{
  nBit = length(b)
  
# Check input
  for (i in 1:nBit) {
   if (b[i] != 0 & b[i] != 1) return(NaN)
  }

  if (nBit == 32) {        # Float (single precision number)
    Index = c(2, 9, 10, 32, 127)
  } else if (nBit == 64) { # Double (double precision number)
    Index = c(2, 12, 13, 64, 1023)
  } else {
    return(NaN)
  }

  S = 1                 # Sign
  if (b[1] == 1) S = -1

  E = 0                 # Exponent
  for (i in Index[1]:Index[2]) {
    E = 2*E
    E = E + b[i]
  }
  
  maxE = FALSE          # E is maximum value?
  if ((nBit == 32 & E == 255) | (nBit == 64 & E == 2047)) maxE = TRUE

  M = 0                  # Fraction
  for (i in Index[4]:Index[3]) {
    M = M + b[i]
    M = M/2
  }

  if (M > 0 & maxE) {
    Expr = "NaN"
    Val = NaN
  } else if (M == 0 & maxE) {
    if (S == +1) {
      Expr = "+Inf"
      Val = +Inf
    } else {
      Expr = "-Inf"
      Val = -Inf
    }
  } else if (M == 0 & E == 0) {
    if (S == +1) {
      Expr = "+0.0"
      Val = +0
    } else {
      Expr = "-0.0"
      Val = -0
    }
  } else {
    M = 1 + M              # This is the case of normalized form
    Expr = paste0(S, "*2^", E - Index[5],"*", M)
    Val  = S*2^(E - Index[5])*M
  }

  attr(Val, "Expression") = Expr
  return(Val)
}

