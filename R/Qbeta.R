Qbeta = function(p, alph, bet)
{
  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a beta distribution")
    return(NULL)
  }
  if (p < 0. | p > 1.) {
    warning("bad p for a beta distribution")
    return(NULL)
  }
  return (invbetai(p, alph, bet))
}
