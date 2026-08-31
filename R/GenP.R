GetP = function(Hv, g)
{
# H: Vector of lower triangular matrix of Hessian
# g: gradient
# p = solve(Hv, -g) : direction vector
  n = length(g)
  if (n==1) return(g[1]/Hv[1])
  p = vector(length=n)

## LDL' Factorization of H Begins
  for (i in 1:n) {
    for (j in 1:i) {
      u = i*(i-1)/2 + j
      v = Hv[u]
      if (j > 1) for (k in 1:(j-1)) v = v - Hv[i*(i-1)/2+k]*Hv[j*(j-1)/2+k]*Hv[k*(k+1)/2]
      if (j < i) Hv[u] = v / Hv[j*(j+1)/2]
      else       Hv[u] = v
    }
  }

## Solve Linear System H(LDL' form) %*% x = -g   ->  x = - invH %*% g BEGIN
#  SOLVE L*w = -g for w
  p[1] = g[1]
  for (i in 2:n) {
    p[i] = g[i]
    for (j in 1:(i-1)) p[i] = p[i] - Hv[i*(i-1)/2+j] * p[j]
  }

#  SOLVE (D*L')*p = w for x WHERE L' = L-TRANSPOSE
  p[n] = p[n] / Hv[n*(n+1)/2]
  for (i in (n-1):1) {
    p[i] = p[i] / Hv[i*(i+1)/2]   # Caution: this is for D x L' not D + L'
    for (j in (i+1):n) p[i] = p[i] - Hv[j*(j-1)/2+i] * p[j]
  }

  return(p)
}
