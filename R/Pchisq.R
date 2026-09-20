Pchisq = function(x2, nu)
{
  .Scalar1("Pchisq", x2, nu)

  if (nu <= 0.) {
    warning("bad nu for a Chi-square distribution")
    return(NULL)
  }
  if (x2 <= 0.) {
    warning("bad x2 for a Chi-square distribution")
    return(NULL)
  }
  return (gammp(0.5*nu, 0.5*x2))
}
