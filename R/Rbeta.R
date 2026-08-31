# Random Gamma Deviates by Other Random Deviates
# Banks J. Handbook of Simulation. (1998) p156
Rbeta = function(n, alph, bet)
{
  # X1 ~ Gamma(alph, 1) and X2 ~ Gamma(bet, 1) independent gives
  # X1/(X1 + X2) ~ Beta(alph, bet). The shape and the scale arguments
  # were the other way round, so only Beta(1, 1) came out right.
  X1 = Rgamma(n, alph, 1)
  X2 = Rgamma(n, bet, 1)
  return(X1/(X1 + X2))
}
