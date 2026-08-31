# Reference: Nash JC. Compact Numerical Methods for Computers. 2e. Adam Hilger.
# 1990. pp 36-38
# Translated and adjusted by Kyun-Seop Bae (kyunseop.bae@gmail.com)

NashSVD = function(M)
{
  nRow = dim(M)[1]
  nCol = dim(M)[2]
#  if (nCol > nRow) {
#    M = t(M)
#    nRow = dim(M)[1]
#    nCol = dim(M)[2]
#  }
  W = rbind(M, diag(rep(1, nCol)))
  Z = vector(length=nCol)

  eps = .Machine$double.eps
  e2 = 10.0*nRow*eps*eps
  tol = eps*0.1
  EstColRank = nCol
  RotCount = nCol*(nCol - 1)/2
  SWEEPLIMIT = max(floor(nCol/4), 6)
  SweepCount = 0
  while (RotCount > 0 & SweepCount <= SWEEPLIMIT) {
    RotCount = EstColRank*(EstColRank - 1)/2
    SweepCount = SweepCount + 1
    for (j in 1:(EstColRank - 1)) {
      for (k in (j + 1):EstColRank) {
        p = 0.0
        q = 0.0
        r = 0.0
        for (i in 1:nRow) {
          x0 = W[i,j]
          y0 = W[i,k]
          p  = p + x0*y0
          q  = q + x0*x0
          r  = r + y0*y0
        }
        Z[j] = q
        Z[k] = r
        if (q >= r) {
          if ((q <= e2*Z[1]) | (abs(p) <= tol*q)) RotCount = RotCount - 1
          else {
            p = p/q
            r = 1 - r/q
            vt = sqrt(4*p*p + r*r)
            c0 = sqrt(0.5*(1 + r/vt))
            s0 = p/(vt*c0)
## rotate begin
            for (i in 1:(nRow + nCol)) {
              D1 = W[i,j]
              D2 = W[i,k]
              W[i,j] =  D1*c0 + D2*s0
              W[i,k] = -D1*s0 + D2*c0
            }
## rotate end
          }
        } else {
          p = p/r
          q = q/r - 1
          vt = sqrt(4*p*p + q*q)
          s0 = sqrt(0.5*(1 - q/vt))
          if (p < 0) s0 = -s0
          c0 = p/(vt*s0)
## rotate begin
          for (i in 1:(nRow + nCol)) {
            D1 = W[i,j]
            D2 = W[i,k]
            W[i,j] =  D1*c0 + D2*s0
            W[i,k] = -D1*s0 + D2*c0
          }
## rotate end
        }
      }
    }
    while ((EstColRank >= 3) & (Z[EstColRank] <= Z[1]*tol + tol*tol)) {
      EstColRank = EstColRank - 1
    }
  }

  if (SweepCount > SWEEPLIMIT) warning("SWEEP LIMIT EXCEEDED")
  nnCol = min(nRow, nCol)
  Res = list(sqrt(Z[1:nnCol]), W[1:nRow,1:nnCol], W[(nRow + 1):(nRow + nCol),1:nnCol])
  names(Res) = c("d","uS","v")
  return(Res)
}
