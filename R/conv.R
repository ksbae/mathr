conv = function(x, y) {
  len.x = length(x)
  len.y = length(y)
  len.max = max(len.x, len.y)

  if (len.x < len.max) {
    x = c(x, rep(0, 2 * len.max - len.x))
    y = c(y, rep(0, len.max))
  }
  else {
    x = c(x, rep(0, len.max))
    y = c(y, rep(0, 2 * len.max - len.y))
  }

  c = Re(fft(fft(x) * fft(y), TRUE)/(2*len.max))
  return(c[1:len.max])
}
