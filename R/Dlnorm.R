Dlnorm = function(x, mu=0, sig=1)
{
  .Scalar1("Dlnorm", x, sig)

  if (sig <= 0.) {
    warning("bad sigma for a log-normal distribution")
    return(NULL)
  }
  if (x < 0.) {
    warning("bad x for a log-normal distribution")
    return(NULL)
  }
  if (x == 0.) return (0.)
  return (0.398942280401432678/(sig*x)*exp(-0.5*(log(x) - mu)*(log(x) - mu)/sig/sig))
}
