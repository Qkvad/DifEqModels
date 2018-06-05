function main
  a=0; b=2;
  n=100;
  A=[1,0,-1;2,3,1;4,5,-2];
  B=eye(3);
  c=[3;-8;5];
  [x,y,s]=odj_gadjanje_linrp(@T,@g,a,b,A,B,c,n);
  plot(x,y(1,:),'b',x,y(2,:),'c',x,y(3,:),'g');
  legend('y1','y2','y3');
end