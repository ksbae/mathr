Dt = function(t, nu, mu=0, sig=1)
{
  .Scalar1("Dt", nu, sig)

  if (sig <= 0. | nu <= 0.) {
    warning("bad sig,nu for a t distribution")
    return(NULL)
  }
  np = 0.5*(nu + 1.)
  return (exp(-np*log(1. + (t - mu)*(t - mu)/sig/sig/nu) + gammln(np) - gammln(0.5*nu))/(sqrt(3.14159265358979324*nu)*sig))
}
