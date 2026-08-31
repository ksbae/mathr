## Matrix must be Real Symmetric Positive Definite.

Chol = function(M)
{
  n = dim(M)[1]
  M2 = matrix(rep(0,n*n), nrow=n, ncol=n)
  
  for (i in 1:n) {
    for (j in 1:i) {
      v = M[i,j]
      for (k in 1:max(1,(j-1))) v = v - M2[i,k]*M2[j,k]
      if (j < i) {
        M2[i,j] = v / M2[j,j]
      } else {
        if (v < 0) return(NULL)
        M2[j,j] = sqrt(v)
      }
    }
  }
  return(M2)
}
