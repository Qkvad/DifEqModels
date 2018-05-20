function [x,y]=ode_rk4(f,a,b,y0,n)
  % function that implements Runge-Kutta method (RK-4)
  % for solving initial condition ordinary differential
  % equation
  h=(b-a)/n;
  x(1)=a;
  y(1)=y0;
  for i=1:n
    x(i+1)=a+i*h;
    k1=@f(x(i),y(i));
    k2=@f(x(i)+h/2,y(i)+h/2 *k1);
    k3=@f(x(i)+h/2,y(i)+h/2 *k2);
    k4=@f(x(i+1),y(i)+h*k3);
    y(i+1)=y(i)+((h/6)*(k1+(2*k2)+(2*k3)+k4));
  end
  egzy=exp(-x).*cos(5*x);   %exact solution
  figure
  fplot('exp(-x)*cos(5*x)',[0,3],'r-')
  hold on
  plot(x,y,'*-')
  legend('exact solution','approximate solution')
  axis('x','y')
  
  errRK=max(abs(y-egzy))
end