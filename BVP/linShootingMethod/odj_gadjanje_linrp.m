function [x, y, s] = odj_gadjanje_linrp(T,g,a,b,A,B,c,n)
  m=max(size(T(1)));
  Y1=zeros(m,m,n+1);
  F1=@(x,y) T(x)*y;
  F2=@(x,y) T(x)*y+g(x);
  y0=zeros(m,1);
  [x,z]=odj_rk4v(F2,a,b,y0,n);
  I=eye(m);
  % solving IVP column by column
  for i=1:m
    y0=I(:,i);
    [x,y]=odj_rk4v(F1,a,b,y0,n);
    Y1(:,i,:)=y;
  end
  DFs=A+B*Y1(:,:,n+1); 
  Fs=B*z(:,n+1)-c; 
  s=-(DFs)\Fs;
  for i=1:n+1
    y(:,i)=Y1(:,:,i)*s+z(:,i);
  end
end
