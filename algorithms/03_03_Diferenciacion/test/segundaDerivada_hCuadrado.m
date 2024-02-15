function answer = segundaDerivada_hCuadrado(x_i,h)
	answer = (f(x_i-h) -2*f(x_i) + f(x_i+h))/(h*h);
endfunction
function answer = f(x)
	answer = (sin(1-x))/(7+cos(x));
endfunction