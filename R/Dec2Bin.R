Dec2Bin = function(x, Double=TRUE)
{
# Input
#   x: a real number
# return: an array of 0 or 1s with length of 32 (for float) or 64 (for double)

#  if (is.real(x) == FALSE) return(NULL)

  if (Double==TRUE) {  # Double (double precision float number) 
    Index = c(2, 12, 13, 64, 1023)
    a = rep(0, 64)
  } else {             # Float (single precision float number)
    Index = c(2, 9, 10, 32, 127)
    a = rep(0, 32)
  }

  if (x < 0) a[1] = 1

  E0 = floor(log(abs(x), base=2))
  E = E0 + Index[5]
  for (i in Index[2]:Index[1]) {
    a[i] = E%%2
    E = floor(E/2)
  }

  M = abs(x) / 2^E0
  M = M - 1
  for (i in Index[3]:Index[4]) {
    a[i] = floor(2*M)
    M = 2*M - a[i]
  }

  return(a)
}
