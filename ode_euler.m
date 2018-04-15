function [x,y]=ode_euler(a,b,y0,n)
  % function that implements the Euler method for solving
  % initial problem for ordinary differential equation
  %     y'(x)=-y(x)-5*exp(-x)*sin(5*x) , 0<=x<=3
  % a,b ... edges of segment
  % y0  ... initial condition
  % n   ... number of subintervals
  x(1)=a;
  y(1)=y0;
  h=(b-a)/n;
  for i=1:n
    x(i+1)=a+i*h;
    y(i+1)=y(i)+h*(-y(i)-5*exp(-x(i))*sin(5*x(i)));
  end
  egzy=exp(-x).*cos(5*x);   %exact solution
  figure
  fplot('exp(-x)*cos(5*x)',[0,3],'r-')
  hold on
  plot(x,y,'*-')
  legend('exact solution','approximate solution')
  axis('x','y')
	
	errE=max(abs(y-egzy)) %maximum error
end
