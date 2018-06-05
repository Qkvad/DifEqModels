function [x,y]=ode_pred_cor(f,a,b,y0,n,m)
  x(1)=a;
  y(1)=y0;
  h=(b-a)/n;
  x=a:h:b;
  [yy]=ode_rk4_ABM(f,x,h,y0,4);
  y(2)=yy(2); y(3)=yy(3); y(4)=yy(4);
  f1=f(x(1),y(1));
  f2=f(x(2),y(2));
  f3=f(x(3),y(3));
  f4=f(x(4),y(4));
  for i=4:length(x)-1
    p=y(i)+(h/24)*(55*f4-59*f3+37*f2-9*f1);
    f5=f(x(i+1),p);
    for j=1:m
      y(i+1)=y(i)+(h/24)*(9*f5+19*f4-5*f3+f2);
      f5=f(x(i+1),y(i+1));
      f1=f2;
    end
    f1=f2;
    f2=f3;
    f3=f4;
    f4=f(x(i+1),y(i+1));
  end
end