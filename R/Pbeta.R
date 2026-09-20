Pbeta = function(x, alph, bet)
{
  .Scalar1("Pbeta", x, alph, bet)

  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a beta distribution")
    return(NULL)
  }
  if (x < 0. | x > 1.) {
    warning("bad x for a beta distribution")
    return(NULL)
  }
  return (betai(alph, bet, x))
}
