# Exponential Random Deviates by Inverse Transform Method
Rexp = function(n, alpha)
{
  return(-log(runif(n))/alpha)
}


