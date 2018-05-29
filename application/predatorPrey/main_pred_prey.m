function main_pred_prey
  y0=[5000;100];
  a=0; b=30;
  n=300;
  tol=1e-2;
  [x23,y23]=ode_rk23v(@pred_prey_f,y0,n,a,b,tol);
  [x4,y4]=ode_rk4v(@pred_prey_f,a,b,n,y0,2);
  figure(1)
  subplot(2,1,1)
  plot(x4,y4(1,:),'r--o')
  hold on
  plot(x23,y23(1,:),'b--*')
  xlabel('t')
  ylabel('p_1(t)')
  title('Solution graph for prey p_1')
  subplot(2,1,2)
  plot(x4,y4(2,:),'r--o')
  hold on
  plot(x23,y23(2,:),'b--*')
  xlabel('t')
  ylabel('p_2(t)')
  title('Solution graph for predators p_2')
end