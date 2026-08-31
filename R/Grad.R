Grad = function(func, x)
{
# Numerical Gradient by Kyun-Seop Bae (ksbae@amc.seoul.kr)
# Ref: Richardson Extrapolation
# This is an optimized version for languages like C/C#/C++

  n     = length(x)
  x1    = vector(length=n)
  x2    = vector(length=n)
  ga    = vector(length=4)
  gr    = vector(length=n)

  if (n > 1) for (i in 2:n) x1[i] = x2[i] = x[i]

  for (i in 1:n) {
    axi = abs(x[i])
    if (axi <= 1) hi = 1e-4
    else          hi = 1e-4 * axi

    for (k in 1:4) {
      x1[i] = x[i] - hi
      x2[i] = x[i] + hi
      ga[k] = (func(x2) - func(x1)) / (2*hi)
      hi    = hi/2
    }

    ga[1] = (ga[2]*4  - ga[1])/3
    ga[2] = (ga[3]*4  - ga[2])/3
    ga[3] = (ga[4]*4  - ga[3])/3
    ga[1] = (ga[2]*16 - ga[1])/15
    ga[2] = (ga[3]*16 - ga[2])/15
    gr[i] = (ga[2]*64 - ga[1])/63
    x1[i] = x2[i] = x[i]
  }

  return(gr)
}
