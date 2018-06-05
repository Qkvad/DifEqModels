function main_trapez(n)
  a=0; b=1;
  y0=1;
  [x,y]=ode_impl_trapez(@f_trapez,a,b,y0,n);
  egz=cos(x);
  [x2,y2]=ode_rk2_trapez(@f_trapez,a,b,y0,n);
  
  figure
  plot(x,y,'g'); hold on
  plot(x2,y2,'b'); hold on
  plot(x,egz,'r'); 
  legend('trapez','rk2','egz');
  hold off;
  
  maxerr=max(abs(y-egz));
  maxerr2=max(abs(y2-egz));
  sprintf('\nGreske za trapez i rk2 respektivno: %d  %d\n',maxerr,maxerr2)
end