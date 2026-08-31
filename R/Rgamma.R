# Random Gamma Deviates by Acceptance-Rejection Method
# Ref: Banks J. Handbook of simulation (1998) pp152-153

Rgamma = function(n, alph, bet)
{
  stopifnot(alph > 0, bet > 0)
  exp1 = exp(1)
  Res = vector(length=n)
  if (alph < 1) {
    bet1 = (exp1 + alph)/exp1
    for (i in 1:n) {
      while (TRUE) {
        U = runif(2)
        W = bet1*U[1]
        if (W < 1) {
          Y = W^(1/alph)
          if (U[2] <= exp(-Y)) break
        } else {
          Y = -log((bet1 - W)/alph)
          if (U[2] <= Y^(alph - 1)) break
        }   
      }
      Res[i] = bet*Y
    }    
  } else if (alph > 1) {
    alph1 = 1/sqrt(2*alph - 1)
    bet1 = alph - log(4)
    gamm1 = alph + 1/alph1
    del1 = 1 + log(4.5)
    for (i in 1:n) {
      while (TRUE) {
        U = runif(2)
        V = alph1*log(U[1]/(1 - U[1]))
        Y = alph*exp(V)
        Z = U[1]*U[1]*U[2]
        W = bet1 + gamm1*V - Y
        if (W + del1 - 4.5*Z >= 0 | W >= log(Z)) break
      }
      Res[i] = bet*Y
    }        
  } else { # alph == 0 -> exponential distribution
    Res = -log(runif(n))/bet
  }
  
  return (Res)
}
