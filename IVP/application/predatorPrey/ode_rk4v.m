function [x,y]=ode_rk4v(f,a,b,n,y0,m)
  %[m,n]=size(x); %m=#equations;  n=#subintervals
  h=(b-a)/n;
  y=y0;
  x(1)=a;
  for i=1:n-1
    x(i+1)=x(i)+h;
    k1=f(x(i),y(:,i));
    k2=f(x(i)+h/2,y(:,i)+h/2*k1);
    k3=f(x(i)+h/2,y(:,i)+h/2*k2);
    k4=f(x(i+1),y(:,i)+h*k3);
    y(:,i+1)=y(:,i)+((h/6)*(k1+2*k2+2*k3+k4));
  end
end
