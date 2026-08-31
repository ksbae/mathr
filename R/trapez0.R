trapez0 = function(x, y)  # Two Sequences are given.
{
  n = length(x)
  if (length(y) != n) return(NULL)
  
  fi = vector()
  for (i in 1:(n-1)) {
    fi[i] = (x[i+1] - x[i]) * (y[i] + y[i+1]) / 2
  }
  return(sum(fi))
}
