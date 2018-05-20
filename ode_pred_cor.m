function [x,y]=ode_pred_cor(f,a,b,y0,n,m)
  x(1)=a;
  y(1)=y0;
  h=(b-a)/n;
  x=a:h:b;
  [yy]=ode_rk4_ABM(f,x,h,y0,4);
  y(2)=yy(2); y(3)=yy(3); y(4)=yy(4);
  for i=4:length(x)-1
    for j=1:m
      p(j)=y(i)+(h/24)*(55*f(x(i),y(i))-59*f(x(i-1),y(i-1))+37*f(x(i-2),y(i-2))-9*f(x(i-3),y(i-3)));
      y(i+1)=y(i)+(h/24)*(9*f(x(i+1),p(j))+19*f(x(i),y(i))-5*f(x(i-1),y(i-1))+f(x(i-2),y(i-2)));
    end
  end
end