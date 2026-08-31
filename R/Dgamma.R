Dgamma = function(x, alph, bet=1)
{
  if (alph <= 0. | bet <= 0.) {
    warning("bad alph, bet for a gamma distribution")
    return(NULL)
  }
  if (x <= 0.) {
    warning("bad x for a gamma distribution")
    return(NULL)
  }
  return (exp(-bet*x + (alph - 1.)*log(x) + alph*log(bet) - gammln(alph)))
}
