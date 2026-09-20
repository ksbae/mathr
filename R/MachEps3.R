MachEps3 = function(MaxIter=1000)
{
  .Scalar1("MachEps3", MaxIter)

  lb = 0 # upper bound
  ub = 1 # lower bound
  NextEps = (lb + ub)/2

  i = 0  # iteration number
  while (NextEps != lb & NextEps != ub & i < MaxIter) {
    i = i + 1
    CurEps = NextEps
    if (1 + CurEps > 1) {
      ub = CurEps
    } else {
      lb = CurEps
    }
    NextEps = (lb + ub)/2
  } 

  attr(CurEps, "iteration") = i
  return(CurEps)  
}
