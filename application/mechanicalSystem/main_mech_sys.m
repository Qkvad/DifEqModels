function main_mech_sys
  a=0;
  b=1.5;
  tol=1e-5;
  y0=[0;0];
  [t,y]=ode_rk23v(@mech_sys_func,y0,a,b,tol);
  figure(1)
  subplot(2,1,1)
  plot(t,y(1,:),'r')
  xlabel('t');
  ylabel('x(t)')
  title('Solution graph for x(t)')
  subplot(2,1,2)
  plot(t,y(2,:),'r')
  xlabel('t')
  ylabel('x`(t)')
  title('Solution graph for x`(t)')
end