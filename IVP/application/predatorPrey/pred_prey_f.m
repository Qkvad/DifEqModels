function d=pred_prey_f(t,p)
  a1=2;
  a2=0.0002;
  d1=0.02;
  d2=0.8;
  d(1)=a1*p(1)-d1*p(1)*p(2);
  d(2)=a2*p(1)*p(2)-d2*p(2);
  d=d';
end