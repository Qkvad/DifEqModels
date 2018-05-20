function [x,y,i]=ode_rk23(f,a,b,y0,tol)
  p = 2; %red 2 
	x(1)=a;
	y(1)=y0;

	k1 = @(x,y,h) f(x,y);
	k2 = @(x,y,h) f(x+1/4*h,y+h*1/4*k1(x,y,h));
	k3 = @(x,y,h) f(x+27/40*h,y+h*((-189/800)*k1(x,y,h)+(729/800)*k2(x,y,h)));
	k4 = @(x,y,h) f(x+h,y+h*((214/891)*k1(x,y,h)+(1/33)*k2(x,y,h)+(650/891)*k3(x,y,h)));

	fi=@(x,y,h) (214/891)*k1(x,y,h)+(1/33)*k2(x,y,h)+(650/891)*k3(x,y,h);
	fi_=@(x,y,h) (533/2106)*k1(x,y,h)+0*k2(x,y,h)+(800/1053)*k3(x,y,h)+(-1/78)*k4(x,y,h);

	i = 1; 
	while x(i)<b
		  if i==1
		      h(i)=b-a;
		  else
		      h(i)=0.9*h(i-1)*((tol/abs(y(i)-y_(i)))^(1/(p+1)));
		  end
		  if x(i)+h(i)>b
		      h(i)=b-x(i);
		  end
		  y(i+1)=y(i)+h(i)*fi(x(i),y(i),h(i));
		  y_(i+1)=y(i)+h(i)*fi_(x(i),y(i),h(i));
		  while(abs(y_(i+1)-y(i+1))>tol)
		          h(i)=0.9*h(i)*((tol/abs(y(i+1)-y_(i+1)))^(1/(p+1)));
		          if x(i)+h(i)>b
		              h(i)=b-x(i);
		          end
		          y(i+1)=y(i)+h(i)*fi(x(i),y(i),h(i));
		          y_(i+1)=y(i)+h(i)*fi_(x(i),y(i),h(i));
		  end 
		  x(i+1)=x(i)+h(i);
		  i=i+1;
	end
