simps13 = function(fx, a, b, n)
{
   if (n %% 2 != 0) return(NULL)
   
   xk = seq(a, b, length.out=(n+1))
   yk = fx(xk)
   # Simpson's 1/3: h/3 (f0 + 4 f1 + 2 f2 + 4 f3 + ... + fn). The odd
   # interior points take the weight 4 and the even ones take 2. The
   # two weights used to be the other way round, which left the rule
   # converging to the wrong value.
   odd = seq(2, n, 2)                       # f1, f3, ..., f(n-1)
   Sodd = sum(yk[odd])
   Seven = 0                                # f2, f4, ..., f(n-2)
   if (n > 2) Seven = sum(yk[seq(3, n - 1, 2)])
   Ar = (b-a)/n/3 * (yk[1] + yk[n+1] + 4*Sodd + 2*Seven)
   return(Ar)     
}
