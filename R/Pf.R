Pf = function(f, nu1, nu2)
{
  if (nu1 <= 0. | nu2 <= 0.) {
    warning("bad nu1, nu2 for an F distribution")
    return(NULL)
  }
  if (f <= 0.) {
    warning("bad f for an F distribution")
    return(NULL)
  }
  return (betai(0.5*nu1, 0.5*nu2, nu1*f/(nu2 + nu1*f)))
}
