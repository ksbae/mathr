Run.test = function(RES)
{
  RES = RES[RES != 0] # Zeros are omitted.
  t = length(RES)
  r = RES > 0
  m = sum(r)
  if (t > 1) {
    j = 2:t
    run = sum(abs(r[j] - r[j-1])) + 1
  } else {
    run = 1
  }
  m = min(m, t-m)
  n = max(m, t-m)
  if (run > 1) {
    p = run.p(m, n, run)
    if (p > 0.5) {
      p = 1 - run.p(m, n, run-1)
    }
  } else {
    p = 0.5^(t-1)
  }
  return(p)
}
