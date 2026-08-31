sft = function(y)  # Slow Fourier Transformation function
{
  N = length(y)
  yt = matrix(nrow=N, ncol=3)
  twopiN = -2 * pi  / N
  for (k in 0:(N-1)) {
    yt[k+1, 1] = sum(y * cos(twopiN * (0:(N-1)) * k)) # Store Real number part
    yt[k+1, 2] = sum(y * sin(twopiN * (0:(N-1)) * k)) # Store Imaginary number part
    yt[k+1, 3] = yt[k+1,1]^2 + yt[k+1,2]^2            # Store Power
  }
  return(yt)
}
