# Retained for backward compatibility. It forwards to gammp() or
# gammq(), whose Cephes series and continued fraction converge over the
# whole range, so a large a needs no method of its own.
#
#   psig = 1 -> P(a, x),  psig = 0 -> Q(a, x)
gammpapprox = function(a, x, psig = 1)
{
  .Scalar1("gammpapprox", a, x, psig)

  if (psig == 1) return (gammp(a, x))
  return (gammq(a, x))
}
