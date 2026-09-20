Qf = function(p, nu1, nu2)
{
  .Scalar1("Qf", nu1, nu2)

  if (nu1 <= 0. | nu2 <= 0.) {
    warning("bad nu1,nu2 for an F distribution")
    return(NULL)
  }
  if (p <= 0. || p >= 1.) {
    warning("bad p for an F distribution")
    return(NULL)
  }
  x = invbetai(p, 0.5*nu1, 0.5*nu2);
  return (nu2*x/(nu1*(1. - x)))
}
