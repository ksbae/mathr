# Random Gamma Deviates by Other Random Deviates
# Banks J. Handbook of Simulation. (1998) p156
Rbeta = function(n, alph, bet)
{
  X1 = Rgamma(n, 1, alph)
  X2 = Rgamma(n, 1, bet)
  return(X1/(X1 + X2))
}
