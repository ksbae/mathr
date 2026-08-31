Qt = function(p, nu, mu=0, sig=1)
{
  if (p <= 0. | p >= 1.) {
    warning("bad p for a t distribution")
    return(NULL)
  }
  x = invbetai(2. * min(p, 1. - p), 0.5*nu, 0.5)
  x = sig * sqrt(nu*(1. - x)/x)
  if (p >= 0.5) return (mu + x)
  else return (mu - x)
}
