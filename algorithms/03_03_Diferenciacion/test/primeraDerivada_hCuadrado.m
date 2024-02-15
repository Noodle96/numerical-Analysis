function answer = primeraDerivada_hCuadrado(x_i,h)
	answer = (f(x_i+h) - f(x_i-h))/(2*h);
endfunction

function answer = f(x)
	answer = (sin(1-x))/(N(2)+N(6) + cos(x));
endfunction

% para calcular N7 y N8
function answer = N(x)
	answer = -0.028571*x*x*x + 0.5142*x*x -1.3786*x + 2.9284;
endfunction