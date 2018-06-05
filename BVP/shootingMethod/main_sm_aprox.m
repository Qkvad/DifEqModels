function main_sm_aprox(s0)
  % shooting method with approximate Newtons iterations
  % s0 ... initial approximation
  a=0; b=1;
  alpha=4; beta=1;
  n=50;
  y(:,1)=[alpha;beta];
  [x y s step]=odj_1(@f_2rru,a,b,alpha,beta,s0,n);
  sprintf('\n 2rru :  s(%d)=%f \n',step,s)
  
  dfy=@(x,y) 3*y(1,1);
  dfdy=@(x,y) 0;
  [x2 y2 s2 step2]=odj_2(@f_2rru_en,dfy,dfdy,a,b,alpha,beta,s0,n);
  sprintf('\n 2rru en :  s(%d)=%f \n',step2,s2)
  
  figure(1);
  plot(x,y(1,:),'r*-');
  hold on
  plot(x2,y2(1,:),'bo-');
  legend('2rru','2rru en')
end