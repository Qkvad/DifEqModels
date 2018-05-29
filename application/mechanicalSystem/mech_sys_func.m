function [d]=mech_sys_func(t,y)
  zeta=0.1;
  a0=9.8;
  omegan=35;
  d(1)=y(2);
  d(2)=a0-2*zeta*omegan*y(2)-(omegan^2)*y(1);
  d=d';
end