function [f]=f_2rru_en(x,y)
  f=[y(2,1); (3/2)*y(1,1)*y(1,1); y(4,1); 3*y(1,1)*y(3,1)];
end