deconv = function(z, x) {
  len.z = length(z)
  len.x = length(x)

  if (len.z < len.x) {
    cat("Ouput Observation(z) should be longer than input or disposition (x)")
    return()
  } else {
    z = c(z, rep(0, len.z))
    x = c(x, rep(0, 2 * len.z - len.x))
  }

  y = Re(fft(fft(z) / fft(x), TRUE)/(2*len.z))
  return(y[1:len.z])
}
