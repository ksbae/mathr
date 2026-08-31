# Random Gamma Deviates by Acceptance-Rejection Method
# Ref: Banks J. Handbook of simulation (1998) pp152-153

Rgamma0 = function(n, alph, bet)
{
  # The rejection condition below is vacuous for alph < 1: it accepts
  # every draw, which returns a scaled Exp(1) rather than a gamma. Use
  # Rgamma, which handles the whole range.
  stopifnot(alph >= 1, bet > 0)
  Res = vector(length=n)
  for (i in 1:n) {
    while (TRUE) {
      u = runif(2)
      v = -log(u)
      if (v[2] > (alph - 1)*(v[1] - log(v[1]) - 1)) {
        # The accepted exponential has to be scaled by alph to become a
        # Gamma(alph, 1) deviate. Without it every shape produced the
        # same Exp(1)*bet.
        Res[i] = alph*bet*v[1]
        break
      }
    }
  }
  return (Res)
}
