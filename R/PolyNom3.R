PolyNom3 = function(x)
{
  .Scalar1("PolyNom3", x)

  CO1  = 0.4361836
  CO2  =-0.1201676
  CO3  = 0.9372980
  CO4  = 0.33267
  TMP1 = exp(-x*x/2)/sqrt(2*pi)
  TMP2 = 1/(1 + abs(x)*CO4)
  y    = TMP1*(CO1*TMP2+CO2*TMP2**2+CO3*TMP2**3)
  if (x > 0) y = 1 - y
  return(y)
}
