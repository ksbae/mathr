Deriv1 = function(fx, x)
{
  if (length(x) != 1) return(NULL)
  a = vector(length=4)
  h = max(1e-4, 1e-4*abs(x))

  for (i in 1:4) {
    a[i] = (fx(x+h/2^i) - fx(x-h/2^i)) / (2*h/2^i)
  }  

  for (i in 1:3) {
    for (j in 1:(4-i)) {
      a[j] = (4^i*a[j+1] - a[j]) / (4^i - 1) 
    }
  }

  return(a[1])
}
