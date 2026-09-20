Dchisq = function(x2, nu)
{
  .Scalar1("Dchisq", x2, nu)

  if (nu <= 0.) {
    warning("bad nu for a Chi-square distribution")
    return(NULL)
  }
  if (x2 <= 0.) {
    warning("bad x2 for a Chi-square distribution")
    return(NULL)
  }
  return (exp(-0.5*(x2 - (nu - 2.)*log(x2)) - 0.693147180559945309*(0.5*nu) - gammln(0.5*nu)))
}
