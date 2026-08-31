# Determinant of a Real Symmetric Matrix using LDL' Transformation
# Programmed by Kyun-Seop Bae MD PhD kyunseop.bae@gmail.com

SymDet = function(SymMat) # Use only lower triangular part, Nondestructive
{
  n = dim(SymMat)[1]
  Det = SymMat[1,1]
  if (n > 1) {
    L = SymMat
    for (i in 1:n) {
      for (j in 1:i) {
        if (j > 1) for (k in 1:(j-1)) L[i,j] = L[i,j] - L[i,k] * L[j,k] * L[k,k]
        if (j < i) L[i,j] = L[i,j] / L[j,j]
      }
    }
    for (i in 2:n) Det = Det * L[i,i];
  }
  return(Det)
}
