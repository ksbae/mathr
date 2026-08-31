# Ref: numDeriv Package of R

GenD = function(func, x)
{
  n  = length(x)
  h0 = vector(length=n)
  x1 = vector(length=n)
  x2 = vector(length=n)
  ga = vector(length=4) # Gradient Approximation
  ha = vector(length=4) # Hessian Approximation
  hd = vector(length=n) # Hessian Diagonal
  gh = vector(length=(n*(n+3)/2)) # Gradient & Hessian

  f0 = func(x)

  for (i in 1:n) {
    x1[i] = x2[i] = x[i]
    axi   = abs(x[i])
    if (axi < 1) h0[i] = 1e-4
    else         h0[i] = 1e-4 * axi
  }

  for (i in 1:n) {
    hi = h0[i]
    for (k in 1:4) {
      x1[i] = x[i] - hi
      x2[i] = x[i] + hi
      f1 = func(x1)
      f2 = func(x2)
      ga[k] = (f2 - f1) / (2*hi)
      ha[k] = (f1 - 2*f0 + f2) / (hi*hi)
      hi = hi / 2
    }

    w = 4
    for (m in 1:2) {
      wm1 = w - 1
      for (k in 1:(4-m)) {
        ga[k] = (ga[k+1]*w - ga[k]) / wm1
        ha[k] = (ha[k+1]*w - ha[k]) / wm1
      }
      w = w * 4
    }
    gh[i] = (ga[2]*64 - ga[1])/63
    hd[i] = (ha[2]*64 - ha[1])/63
    x1[i] = x2[i] = x[i]
  }

  u = n
  for (i in 1:n) {
    for (j in 1:i) {
      u = u + 1
      if (i==j) gh[u] = hd[i]
      else {
        hi = h0[i]
        hj = h0[j]
        for (k in 1:4) {
          x1[i] = x[i] - hi
          x1[j] = x[j] - hj
          x2[i] = x[i] + hi
          x2[j] = x[j] + hj
          ha[k] = (func(x1) - 2*f0 + func(x2) - hd[i]*hi*hi - hd[j]*hj*hj) / (2*hi*hj)
          hi = hi / 2
          hj = hj / 2
        }
        w = 4
        for (m in 1:2) {
          for (k in 1:(4-m)) ha[k] = (ha[k+1]*w - ha[k]) / (w - 1)
          w = w * 4
        }
        gh[u] = (ha[2]*64 - ha[1]) / 63 
      }
      x1[j] = x2[j] = x[j]
    }
    x1[i] = x2[i] = x[i]
  }

  g = gh[1:n]
  H = diag(NA,n)
  u = n
  for (i in 1:n) {
    for (j in 1:i) {
      u      = u + 1
      H[i,j] = gh[u]
      H[j,i] = gh[u]
    }
  }

  return(list(gr=g, Hessian=H, D=gh, n=n, f0=f0, x=x))
}
