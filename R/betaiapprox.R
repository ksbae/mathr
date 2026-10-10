# Retained for backward compatibility. It forwards to betai(), whose
# continued fraction converges over the whole range once the symmetry
# transform is applied, so large a and b need no method of their own.
betaiapprox = function(a, b, x)
{
  .Scalar1("betaiapprox", a, b, x)

  return (betai(a, b, x))
}
