Deriv0 = function(fx, x)
{
  if (length(x) != 1) return(NULL)
  a = matrix(nrow=4, ncol=4)
  h = max(1e-4, 1e-4*abs(x))

  for (i in 1:4) {
    a[i,1] = (fx(x+h/2^i) - fx(x-h/2^i)) / (2*h/2^i)
  }  

  for (i in 2:4) {
    for (j in 2:i) {
      a[i,j] = (4^(j-1)*a[i,j-1] - a[i-1,j-1] ) / (4^(j-1) - 1) 
    }
  }

  return(a[4,4])
}
