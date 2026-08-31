# Regularized upper incomplete gamma Q(a, x) by the continued fraction
#   Q(a,x) = exp(-x) x^a / Gamma(a) * 1/(x+1-a-) 1*(1-a)/(x+3-a-) ...
# Abramowitz and Stegun 6.5.31, evaluated with the modified Lentz
# recurrence. Follows the Cephes routine igamc as redistributed in
# ALGLIB (specialfunctions.cs, incompletegammac).
gcf = function(a, x)
{
  EPS    = 1e-15
  BIG    = 4503599627370496.0          # 2^52
  BIGINV = 2.22044604925031308085e-16  # 1/2^52

  if (x <= 0 | a <= 0) return(1)

  ax = a*log(x) - x - gammln(a)
  if (ax < -709.78271289338399) return(0)
  ax = exp(ax)

  y = 1 - a
  z = x + y + 1
  c = 0
  pkm2 = 1
  qkm2 = x
  pkm1 = x + 1
  qkm1 = z * x
  ans = pkm1 / qkm1

  repeat {
    c = c + 1
    y = y + 1
    z = z + 2
    yc = y * c
    pk = pkm1*z - pkm2*yc
    qk = qkm1*z - qkm2*yc
    if (qk != 0) {
      r = pk / qk
      t = abs((ans - r)/r)
      ans = r
    } else {
      t = 1
    }
    pkm2 = pkm1
    pkm1 = pk
    qkm2 = qkm1
    qkm1 = qk
    if (abs(pk) > BIG) {
      pkm2 = pkm2 * BIGINV
      pkm1 = pkm1 * BIGINV
      qkm2 = qkm2 * BIGINV
      qkm1 = qkm1 * BIGINV
    }
    if (t <= EPS) break
  }
  return(ans * ax)
}
