function [x y s step]=odj_1(f,a,b,alpha,beta,s0,n)
  %koristi aproksimacije u Newtonovim iteracijama
  %m=max(size(s0));
  x=zeros(1,n+1);
  y=zeros(1,n+1);
  s(1)=s0;
  y0=[alpha;s0];
  i=1; 
  while abs(y(1,n+1)-beta)>1e-10
    y0=[alpha;s(i)];
    [x,y]=odj_rk4v(f,a,b,y0,n);
    ds=sqrt(eps)*s(i);
    F=y(1,n+1)-beta;
    y0(2)=s(i)+ds;
    [x,y1]=odj_rk4v(f,a,b,y0,n);
    dF=(y1(1,n+1)-y(1,n+1))/ds;
    d=F/dF;
    s(i+1)=s(i)-d;
    s0(2)=s(i+1);
    i=i+1;
  end
  s=s(i);
  step=i;
end