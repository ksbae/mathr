# Natural log of the gamma function for positive arguments.
# Delegates to LGAMMA, which uses the Lanczos g=7, n=9 coefficients as
# published by Lanczos (1964) and used by the GNU Scientific Library
# (gsl_sf_lngamma, lanczos_7_c).
gammln = function(xx)
{
  .Scalar1("gammln", xx)

  if (xx <= 0) {
    warning("bad arg in gammln")
    return(NaN)
  }
  return(LGAMMA(xx))
}
