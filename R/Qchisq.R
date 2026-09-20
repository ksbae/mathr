Qchisq = function(p, nu)
{
  .Scalar1("Qchisq", p, nu)

  if (nu <= 0.) {
    warning("bad nu for a Chi-square distribution")
    return(NULL)
  }
  if (p < 0. | p >= 1.){
    warning("bad p for a Chi-square distribution")
    return(NULL)
  }
  return (2.*invgammp(p,0.5*nu))
}
