# A Jacobi algorithm for eigensolutions of a real symmetric matrix
# Reference: Nash JC. Compact Numerical Methods for Computers. 2e. Adam Hilger.
# 1990. pp128-130
# Translated and adjusted by Kyun-Seop Bae (kyunseop.bae@gmail.com)

evJacobi = function (A)
{
  InputOK = TRUE
  if (!is.matrix(A)) InputOK = FALSE
  else {
    n = dim(A)[1]
    if (n != dim(A)[2]) InputOK = FALSE
    for (i in 2:n) {
      for (j in 1:(i-1)) if (A[i,j] - A[j,i] > 2*.Machine$double.eps) InputOK = FALSE
    }
  }
  if (InputOK == FALSE) {
    warning("This is for real symmetric matrix only!")
    return(NULL)
  }

  V = diag(rep(1, n))          # Make a unit matrix for the return
  MAXITER = 30
  for (Iteration in 1:MAXITER) {  # Iteration variable is not used below.
    for (i in 1:(n - 1)) {
      for (j in (i + 1):n) {
        rotn = TRUE
        p = 0.5*(A[i,j] + A[j,i])
        q = A[i,i] - A[j,j]
        t = sqrt(4.0*p*p + q*q)
        if (t == 0.0) rotn = FALSE
        else {
          if (q >= 0.0) {
            oki = okj = FALSE
            if (abs(A[i,i]) == abs(A[i,i]) + 100.0*abs(p)) oki = TRUE
            if (abs(A[j,j]) == abs(A[j,j]) + 100.0*abs(p)) okj = TRUE
            if (oki == TRUE & okj == TRUE) rotn = FALSE
            else rotn = TRUE
            if (rotn == TRUE) {
              c = sqrt((t + q)/(2.0*t))
              s = p/(t*c)
            }
          } else {
            rotn = TRUE
            s = sqrt((t - q)/(2.0*t))
            if (p < 0.0) s = -s
            c = p/(t*s)
          }
          if (1.0 + abs(s) == 1.0) rotn = FALSE
        }
        if (rotn == TRUE) {
          for (k in 1:n) {
            q = A[i,k]
            A[i,k] =  c*q + s*A[j,k]
            A[j,k] = -s*q + c*A[j,k]
          }
          for (k in 1:n) {
            q = A[k,i]
            A[k,i] =  c*q + s*A[k,j]
            A[k,j] = -s*q + c*A[k,j]
            q = V[k,i]
            V[k,i] =  c*q + s*V[k,j]
            V[k,j] = -s*q + c*V[k,j]
          }
        }
      }
    }
  }
  Res = list(diag(A),V)
  names(Res) = c("values", "vectors")
  return(Res)
}
