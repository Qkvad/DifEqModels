function [y]=ode_rk4_ABM(f,x,h,y0,n)
  y(1)=y0;
  for i=1:n
    k1=f(x(i),y(i));
    k2=f(x(i)+h/2,y(i)+h/2 *k1);
    k3=f(x(i)+h/2,y(i)+h/2 *k2);
    k4=f(x(i+1),y(i)+h*k3);
    y(i+1)=y(i)+((h/6)*(k1+(2*k2)+(2*k3)+k4));
  end
end