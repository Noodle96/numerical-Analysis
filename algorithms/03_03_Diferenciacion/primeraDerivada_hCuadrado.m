%{
    AUTHOR: Russell Tito
    DESCRIPCION:
        Formulas para derivadas numericas
		Nombre: Diferencia finita centrada para f'(x_i) 
	FORMULA:
		f'(x_i) = (f(x_i+h) - f(x_i-h))/(2*h)
    INPUT:
        x_i: punto a evaluar
        h: x_{i+1} - x_{i}
    OUTPUT:
        Primera derivada de f(x) en x_i
    USO:
        primeraDericada_hCuadrado(0,0.1)
%}
function answer = primeraDerivada_hCuadrado(x_i,h)
	answer = (f(x_i+h) - f(x_i-h))/(2*h);
endfunction

function answer = f(x)
	% answer = (sin(1-x))/(1 + cos(x));
	answer = sin(x);
endfunction