run.p = function(m, n, r)
{
  .Scalar1("run.p", m, n, r)

# INPUT
# m : count of fewer species (minimum value = 0)
# n : count of more frequent species (minimum value = 1)
# r : count of run (minimum value = 1)
# RETURNS probability of run count to be less than or equal to r with m and n
#         P(Run count <= r | m, n)

  if (m==0 & r==1) {
    return(1)
  } else if (m > n | m < 1 | n < 1 | r < 2 | (r > min(m + n, 2 * m + 1))) {
    return(0);
  }

  sumfu = 0
  for (u in 2:r) {
    if (u %% 2 == 0) {
      k = u / 2
      fu = 2 * choose(m-1, k-1) * choose(n-1, k-1)
    } else {
      k = (u + 1) / 2
      fu = choose(m-1, k-1) * choose(n-1, k-2) + choose(m-1, k-2) * choose(n-1, k-1)
    }
    sumfu = sumfu + fu
  }
  return(sumfu / choose(m+n, m))
}
