Dbeta = function(x, alph, bet)
{
  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a beta distribution")
    return(NULL)
  }
  if (x < 0. | x > 1.) {
    warning("bad x for a beta distribution")
    return(NULL)
  }
  return (exp((alph - 1.)*log(x) + (bet - 1.)*log(1. - x) + gammln(alph + bet) - gammln(alph) - gammln(bet)))
}
