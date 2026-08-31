Hessian = function(fx, x)
{
  n  = length(x)
  h0 = vector(length=n)
  x1 = vector(length=n)
  x2 = vector(length=n)
  ha = vector(length=4) # Hessian Approximation
  H  = matrix(NA, nrow=n, ncol=n) # Hessian Matrix

  f0 = fx(x)

  for (i in 1:n) {
    x1[i] = x2[i] = x[i]
    axi   = abs(x[i])
    if (axi < 1) h0[i] = 1e-4
    else         h0[i] = 1e-4 * axi
  }

  for (i in 1:n) {
    for (j in i:1) {
      hi = h0[i]
      if (i==j) {
        for (k in 1:4) {
          x1[i] = x[i] - hi
          x2[i] = x[i] + hi
          ha[k] = (fx(x1) - 2*f0 + fx(x2)) / (hi*hi)
          hi = hi / 2
        }
      } else {
        hj = h0[j]
        for (k in 1:4) {
          x1[i] = x[i] - hi
          x1[j] = x[j] - hj
          x2[i] = x[i] + hi
          x2[j] = x[j] + hj
          ha[k] = (fx(x1) - 2*f0 + fx(x2) - H[i,i]*hi*hi - H[j,j]*hj*hj)/(2*hi*hj)
          hi = hi / 2
          hj = hj / 2
        }
      }
      w = 4
      for (m in 1:2) {
        for (k in 1:(4-m)) ha[k] = (ha[k+1]*w - ha[k]) / (w - 1)
        w = w * 4
      }
      H[i,j] = (ha[2]*64 - ha[1]) / 63
      if (i != j) H[j,i] = H[i,j] 
      x1[j] = x2[j] = x[j]
    }
    x1[i] = x2[i] = x[i]
  }

  return(H)
}
