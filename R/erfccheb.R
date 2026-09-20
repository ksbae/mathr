# Retained for backward compatibility.
#
# In earlier releases this evaluated erfc for nonnegative arguments from
# a 28-term Chebyshev fit. erfc() now uses the Cephes rational
# approximation over the whole range, so this function forwards to it.
erfccheb = function(z)
{
  .Scalar1("erfccheb", z)

    if (z < 0.) {
      warning("erfccheb requires nonnegative argument")
      return(NULL)
    }
    return (erfc(z))
}
