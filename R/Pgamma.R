Pgamma = function(x, alph, bet=1)
{
  .Scalar1("Pgamma", x, alph, bet)

  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a gamma distribution")
    return(NULL)
  }
  if (x <= 0.) {
    warning("bad x for a gamma distribution")
    return(NULL)
  }
  return (gammp(alph, bet*x))
}
