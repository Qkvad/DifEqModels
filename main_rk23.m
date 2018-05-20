function main_rk23
  a=0;
	b=4;
	y0=0;
	tol=1e-5;
	[x,y,k]=ode_rk23(@f23,a,b,y0,tol);
	fprintf('Broj koraka: %d',k);
	[x2,y2]=ode_rk2(@f23,a,b,y0,k-1);
	
	hold on
	plot(x,y,'r');
	plot(x2,y2,'b');
	fplot(@y23,[0 4],'g');
	legend('rk23','rk2','egz');
  hold off

	maxerr=max(abs(y23(x)-y));
	maxerr2=max(abs(y23(x2)-y2'));
	fprintf('\nMaksimalne greske za rk23 i rk2 respektivno: %d  %d\n',maxerr,maxerr2);  
end
