runifLC = function(n = 1, Seed = 123457, a = 16807, m = 2147483647, k = 0, b = 10)
{
  if (abs(Seed) < 1) Seed = as.numeric(Sys.time())
  if (n < 1 | a < 1 | b < 1) stop("n, a, b should be positive integer!")
  X = vector(length=n)
  X[1] = Seed
  for (i in 1:b) X[1] = (a*X[1] + k) %% m     # numbers to discard
  for (i in 2:n) X[i] = (a*X[i - 1] + k) %% m
  return(X/(m + 1))
}
