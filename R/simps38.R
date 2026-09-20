simps38 = function(fx, a, b, n)
{
  .Scalar1("simps38", n)

   if (n %% 3 != 0) return(NULL)
   
   xk = seq(a, b, length.out=(n+1))
   yk = fx(xk)
   # 3h/8 (f0 + 3 f1 + 3 f2 + 2 f3 + 3 f4 + ... + fn). Weighting every
   # interior point 3 and then removing one unit from every third gets
   # the 3,3,2 pattern. With n = 3 there is no such point to remove.
   S3 = 0
   if (n > 3) S3 = sum(yk[seq(4, n - 2, 3)])
   Ar = 3*(b-a)/n/8 * (yk[1] + yk[n+1] + 3 * sum(yk[2:n]) - S3)
   return(Ar)     
}
