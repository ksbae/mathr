trapez1 = function(fx, a, b, n) # Function and range are given.
{
  .Scalar1("trapez1", n)

  xk = seq(a, b, length.out=(n+1))
  fk = fx(xk)
  Mid = if (n == 1) 0 else sum(fk[2:n])  # 2:n counts down when n is 1
  Ar = (b-a)/n*(fk[1]/2 + Mid + fk[n+1]/2)
  return(Ar)        
}
