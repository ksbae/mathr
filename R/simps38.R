simps38 = function(fx, a, b, n)
{
   if (n %% 3 != 0) return(NULL)
   
   xk = seq(a, b, length.out=(n+1))
   yk = fx(xk)
   Ar = 3*(b-a)/n/8 * (yk[1] + yk[n+1] + 3 * sum(yk[2:n]) - sum(yk[seq(4,n-2,3)]))
   return(Ar)     
}
