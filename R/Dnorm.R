Dnorm = function(x, mu=0, sig=1)
{
  if (sig <= 0.) {
    warning("bad sig for a normal distribution")
    return(NULL)
  }
  return (0.398942280401432678/sig*exp(-0.5*(x - mu)*(x - mu)/sig/sig))
}
