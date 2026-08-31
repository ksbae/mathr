Pt = function(t, nu, mu=0, sig=1)
{
  if (sig <= 0. | nu <= 0.) {
    warning("bad sig,nu for a t distribution")
    return(NULL)
  }
  p = 0.5*betai(0.5*nu, 0.5, nu/(nu + (t - mu)*(t - mu)/sig/sig))
  if (t >= mu) return (1. - p)
  else return (p)
}
