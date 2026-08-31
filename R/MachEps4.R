MachEps4 = function(MaxIter=1000)
{
  lb = -1 # upper bound
  ub = 0 # lower bound
  NextEps = (lb + ub)/2

  i = 0  # iteration number
  while (NextEps != lb & NextEps != ub & i < MaxIter) {
    i = i + 1
    CurEps = NextEps
    if (1 + CurEps < 1) {
      lb = CurEps
    } else {
      ub = CurEps
    }
    NextEps = (lb + ub)/2
  } 

  attr(CurEps, "iteration") = i
  return(CurEps)  
}
