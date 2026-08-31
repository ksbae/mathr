# Inverse of a Symmetric Matrix using LDL' Transformation
# Programmed by Kyun-Seop Bae MD PhD kyunseop.bae@gmail.com

SymInv = function(SymMat) # Use only lower triangular part, Nondestructive
{
  n = dim(SymMat)[1]
  L = SymMat
  Linv = diag(1,n)
  RetMat = matrix(0, nrow=n, ncol=n)

# LDL' Decomp First
  for (i in 1:n) {
    for (j in 1:i) {
      if (j > 1) for (k in 1:(j-1)) L[i,j] = L[i,j] - L[i,k] * L[j,k] * L[k,k]
      if (j < i) L[i,j] = L[i,j] / L[j,j]
    }
  }

# Inverse L
  for (i in 2:n) {
    for (j in (i-1):1) {
      for (k in j:(i-1)) Linv[i,j] = Linv[i,j] - L[i,k] * Linv[k,j]
    }
  }

# Multiply t(Linv) %*% Dinv %*% Linv
  for (i in 1:n) {
    for (j in 1:i) {
      for (k in i:n) RetMat[i,j] = RetMat[i,j] + Linv[k,i] / L[k,k] * Linv[k,j]
      RetMat[j,i] = RetMat[i,j]  # Inverse is also symmetric.
    }
  }
  return(RetMat)
}
