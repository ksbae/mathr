Round = function(x, digits = 0)
{
# digits 0: 10^0 = 1
# digits 2: 10^(-2) = 0.01
# digits -1: 10^1 = 10
  Sign = sign(x)
  Temp = abs(x)/10^(-digits)
  Temp = trunc(Temp + 0.5)
  Temp = Temp*10^(-digits)
  return(Sign*Temp)
}
