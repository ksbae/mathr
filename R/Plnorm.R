Plnorm = function(x, mu=0, sig=1)
{
  .Scalar1("Plnorm", x, mu, sig)

  if (sig <= 0.) {
    warning("bad sigma for a log-normal distribution")
    return(NULL)
  }
  if (x < 0.) {
    warning("bad x for a log-normal distribution")
    return(NULL)
  }
  if (x == 0.) return (0.)
  return (0.5*erfc(-0.707106781186547524*(log(x) - mu)/sig))
}
