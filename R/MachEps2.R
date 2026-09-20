MachEps2 = function(x=1, Start=1)
{
  .Scalar1("MachEps2", x, Start)

  eps = Start
  while (x + eps > x) eps = eps/2
  return(2*eps)
}
