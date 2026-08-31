# Linear Solution of a Real Symmetric Matrix using LDL' Transformation
# Programmed by Kyun-Seop Bae MD PhD kyunseop.bae@gmail.com

SymSol = function(H, g)
{
# H: lower triangular matrix of Hessian
# g: gradient
# p = solve(H, g) : -direction vector
  n = length(g)
  if (n == 1) return (g[1]/H[1,1])
  p = vector(length=n)

## LDL' Factorization of H
  for (i in 1:n) {
    for (j in 1:i) {
      if (j > 1) for (k in 1:(j-1)) H[i,j] = H[i,j] - H[i,k]*H[j,k]*H[k,k]
      if (j < i) H[i,j] = H[i,j] / H[j,j]
    }
  }

## Solve Linear System H(LDL' form) %*% x = -g   ->  x = - invH %*% g
#  Solve L*w = -g for w (here w is p) first
  p[1] = g[1]
  for (i in 2:n) {
    p[i] = g[i]
    for (j in 1:(i-1)) p[i] = p[i] - H[i,j] * p[j]
  }

#  Solve (D*L')*p = w for p WHERE L' = L-TRANSPOSE
  p[n] = p[n] / H[n,n]
  for (i in (n-1):1) {
    p[i] = p[i] / H[i,i]   # Caution: this is for D x L' not D + L'
    for (j in (i+1):n) p[i] = p[i] - H[j,i] * p[j]
  }

  return (p)
}
