# LDL' Transformation (Factorization) of a Real Symmetric Matrix
# Programmed by Kyun-Seop Bae MD PhD kyunseop.bae@gmail.com

LDLT = function(SymMat) # Use only lower triangular part, Nondestructive
{
  n = dim(SymMat)[1]
  L = SymMat

  for (i in 1:n) {
    for (j in 1:i) {
      if (j > 1) for (k in 1:(j-1)) L[i,j] = L[i,j] - L[i,k] * L[j,k] * L[k,k]
      if (j < i) L[i,j] = L[i,j] / L[j,j]
    }
  }
## Now prepare return
  D = diag(L)
  for (i in 1:(n - 1)) {
    L[i,i] = 1
    for (j in (i + 1):n) L[i,j] = 0
  }
  L[n,n] = 1
  Res = list(L,D)
  names(Res) = c("L","D")
  return(Res)
}


