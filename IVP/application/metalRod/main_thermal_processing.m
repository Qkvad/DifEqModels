function main_thermal_processing
  a=0;       % start t=0 s
  b=210;     % final t=210 s
  T=273.14;  % start temperature of the rod
  tol=1e-3;  % tolerance for ode_rk23
 
  [x23,y23,k23]=ode_rk23(@term_obrada_funkcija,a,b,T,tol);
  [x4,y4]=ode_rk4(@term_obrada_funkcija,a,b,T,x23);
  
  figure(1)
  plot(x23,y23,'r--*')
  hold on
  plot(x4,y4,'b-o')
  legend('ode_ rk23','ode_ rk4')
  title('Thermic processing of the metal rod')
  xlabel('time(s)')
  ylabel('temperatue (K)')
  
  % determining which method is more accurate
  [x,y]=ode_rk4_2n(@term_obrada_funkcija,a,b,T,x23);
  figure(2)
  plot(x23,y23,'r--*')
  hold on
  plot(x,y,'b-o')
  legend('ode rk23','ode rk4 double n')
  title('Determining accuracy by doubling subdivision for rk4')
  xlabel('time(s)')
  ylabel('temperatue (K)')
end