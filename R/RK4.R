RK4 = function(State, tau, Deriv)
{
  F1 = Deriv(State           )
  F2 = Deriv(State + F1*tau/2)
  F3 = Deriv(State + F2*tau/2)
  F4 = Deriv(State + F3*tau  )
  return (State + (F1 + 2*F2 + 2*F3 + F4)*tau/6)
}
