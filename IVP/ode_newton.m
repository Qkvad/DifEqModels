function z=ode_newton(f,dg,z0,k)
  for i=1:k
    z=z0-f(z0)/dg(z0)
  end
end