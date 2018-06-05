function [x y s step]=odj_2(f,dfy,dfdy,a,b,alpha,beta,s0,n)
  s=s0;
  y0=[alpha;s;0;1];
  [x,y]=odj_rk4v(f,a,b,y0,n);
  i=1;
  while abs(y(1,n+1)-beta)>1e-10
    i=i+1;
    s=s-((y(1,n+1)-beta)/y(3,n+1));
    y0=[alpha;s;0;1];
    [x,y]=odj_rk4v(f,a,b,y0,n);
  end
  step=i;
  y=y(1,:);
end