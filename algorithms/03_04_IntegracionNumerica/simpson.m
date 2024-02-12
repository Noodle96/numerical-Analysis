function S = simpson(a,b,n)
	S1 = 0;
	S2 = 0;
	h = (b-a)/n;
	for k=1:2:n-1
		S1 = S1 + f(a+k*h);
	endfor
	for k=2:2:n-2
		S2 = S2 + f(a+k*h);
	endfor
	S = (h/3)*((f(a)+f(b))+4*S1 + 2*S2);
endfunction

function y = f(x)
	y = exp(-x^2);
endfunction