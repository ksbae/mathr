Qgamma = function(p, alph, bet=1)
{
  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a gamma distribution")
    return(NULL)
  }
  if (p < 0. | p >= 1.) {
    warning("bad p for a gamma distribution")
    return(NULL)
  }
  return (invgammp(p, alph)/bet)
}
