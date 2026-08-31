Rnorm = function(n, mu=0, sigma=1)
{
  Res = vector(length=n+1)
  i = 1
  while (i <= n) {
    x = runif(2)
    v = 2*x - 1
    w = sum(v*v)
    if (w < 1) {
      y = sqrt(-2*log(w)/w)
      Res[i:(i+1)] = mu + sigma * y * v
      i = i + 2
    }
  }
  return (Res[1:n])
}

