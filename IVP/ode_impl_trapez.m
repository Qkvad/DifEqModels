function [x,y]=ode_impl_trapez(f,a,b,y0,n)
  x(1)=a;
  y(1)=y0;
  h=1/n;
  for i=1:n;
    x(i+1)=x(i)+h;
    %w=sym('w');
    g=@(z) z-y(i)-h/2*f(x(i),y(i))-h/2*f(x(i+1),z);
    %gs=g(w);
    %dgs=diff(gs);
    %dg=@(z) double(subs(dgs,z));
    %apr=ode_newton(@f,@dg,y(i),5);
    y(i+1)=fsolve(g,y(i)+h*f(x(i),y(i)));
    %y(i+1)=apr;
  end
end