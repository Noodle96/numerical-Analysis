%{
    AUTHOR: Russell Tito
    DESCRIPCION:
        Formulas para derivadas numericas
		Nombre: Diferencia finita centrada para f''(x_i) 
	FORMULA:
		f''(x_i) = (f(x_i-h) -2f(x_i) + f(x_i+h))/(h*h)
    INPUT:
        x_i: punto a evaluar
        h: x_{i+1} - x_{i}
    OUTPUT:
        Segunda derivada de f(x) en x_i
    USO:
        segundaDerivada_hCuadrado(0,0.1)
%}
function answer = segundaDerivada_hCuadrado(x_i,h)
	answer = (f(x_i-h) -2*f(x_i) + f(x_i+h))/(h*h);
endfunction

function answer = f(x)
	answer = sin(x);
endfunction