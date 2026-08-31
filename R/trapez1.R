trapez1 = function(fx, a, b, n) # Function and range are given.
{
  xk = seq(a, b, length.out=(n+1))
  fk = fx(xk)
  Ar = (b-a)/n*(fk[1]/2 + sum(fk[2:n]) + fk[n+1]/2)
  return(Ar)        
}
