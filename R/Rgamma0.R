# Random Gamma Deviates by Acceptance-Rejection Method
# Ref: Banks J. Handbook of simulation (1998) pp152-153

Rgamma0 = function(n, alph, bet)
{
  stopifnot(alph > 0, bet > 0)
  Res = vector(length=n)
  for (i in 1:n) {
    while (TRUE) {
      u = runif(2)
      v = -log(u)
      if (v[2] > (alph - 1)*(v[1] - log(v[1]) - 1)) {
        Res[i] = bet*v[1]
        break
      }
    }
  }
  return (Res)
}
