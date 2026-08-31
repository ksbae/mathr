MachEps = function()
{
  eps = 1
  while (1 + eps > 1) eps = eps/2
  return(2*eps)
}
