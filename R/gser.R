# Regularized lower incomplete gamma P(a, x) by the power series
#   P(a,x) = exp(-x) x^a / Gamma(a) * sum_{n>=0} x^n / (a(a+1)...(a+n))
# Abramowitz and Stegun 6.5.29. Follows the Cephes routine igam as
# redistributed in ALGLIB (specialfunctions.cs, incompletegamma).
gser = function(a, x)
{
  .Scalar1("gser", a, x)

  EPS = 1e-15
  if (x <= 0 | a <= 0) return(0)

  ax = a*log(x) - x - gammln(a)
  if (ax < -709.78271289338399) return(0)   # exp() would underflow
  ax = exp(ax)

  r = a
  c = 1
  Sum = 1
  repeat {
    r = r + 1
    c = c * x / r
    Sum = Sum + c
    if (c/Sum <= EPS) break
  }
  return(Sum * ax / a)
}
