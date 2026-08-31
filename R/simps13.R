simps13 = function(fx, a, b, n)
{
   if (n %% 2 != 0) return(NULL)
   
   xk = seq(a, b, length.out=(n+1))
   yk = fx(xk)
   Ar = (b-a)/n/3 * (yk[1] + yk[n+1] + 2 * sum(yk[2:n]) + 2 * sum(yk[seq(3,(n-1),2)]))
   return(Ar)     
}
