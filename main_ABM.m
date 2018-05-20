function main_ABM(m,n)
  a=0; b=3;
  y0=1;
  [x,y]=ode_pred_cor(@f_ABM,a,b,y0,n,m);
  for i=1:length(x)
    egz(i)=exp(-x(i))*cos(5*x(i));
  end
  figure
  plot(x,y,'r--o')
  hold on
  plot(x,egz,'b')
  hold off
  title(sprintf('Maksimalna greska %f',max(abs(y-egz))));
  legend('approx','exact');
end