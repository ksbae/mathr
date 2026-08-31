Qnorm = function(p, mu=0, sig=1)
{
  if (sig <= 0.) {
    warning("bad sig for a normal distribution")
    return(NULL)
  }
  if (p <= 0. | p >= 1.) {
    warning("bad p for a normal distribution")
    return(NULL)
  }
  return (-1.41421356237309505*sig*inverfc(2. * p) + mu)
}
