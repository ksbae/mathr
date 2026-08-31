Deriv2 = function(fx, x)
{
  n  = length(x)
  x1 = vector(length=n)  # for x - hi
  x2 = vector(length=n)  # for x + hi
  ga = vector(length=4)  # gradient approximation
  gr = vector(length=n)  # gradient result

  if (n > 1) for (i in 2:n) x1[i] = x2[i] = x[i]

  for (i in 1:n) {
    axi = abs(x[i])
    if (axi <= 1) hi = 1e-4
    else          hi = 1e-4 * axi

    for (k in 1:4) {
      x1[i] = x[i] - hi
      x2[i] = x[i] + hi
      ga[k] = (fx(x2) - fx(x1))/(2*hi)
      hi = hi/2
    }

    for (j in 1:3) {
      for (k in 1:(4-j)) {
        ga[k] = (4^j*ga[k + 1] - ga[k])/(4^j - 1)
      }
    }

    gr[i] = ga[1]        # Store i-th gradient
    x1[i] = x2[i] = x[i]   # Restore x
  }

  return(gr)
}

