Pnorm = function(x, mu=0, sig=1)
{
  if (sig <= 0.) {
    warning("bad sig for a normal distribution")
    return(NULL)
  }
  return (0.5*erfc(-0.707106781186547524*(x - mu)/sig))
}
