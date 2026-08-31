MachEps2 = function(x=1, Start=1)
{
  eps = Start
  while (x + eps > x) eps = eps/2
  return(2*eps)
}
