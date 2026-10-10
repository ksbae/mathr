# Retained for backward compatibility. It forwards to erfc(), which
# evaluates erfc(z) = Q(1/2, z^2) through gammq(); no Chebyshev fit is
# involved despite the name.
erfccheb = function(z)
{
  .Scalar1("erfccheb", z)

    if (z < 0.) {
      warning("erfccheb requires nonnegative argument")
      return(NULL)
    }
    return (erfc(z))
}
