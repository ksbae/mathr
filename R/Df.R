Df = function(f, nu1, nu2)
{
  if (nu1 <= 0. | nu2 <= 0.) {
    warning("bad nu1, nu2 for an F distribution")
    return(NULL)
  }
  if (f <= 0.) {
    warning("bad f for an F distribution")
    return(NULL)
  }
  return (exp((0.5*nu1 - 1.)*log(f) - 0.5*(nu1 + nu2)*log(nu2 + nu1*f) + 0.5*(nu1*log(nu1) + nu2*log(nu2)) + gammln(0.5*(nu1 + nu2)) - gammln(0.5*nu1) - gammln(0.5*nu2)))
}
