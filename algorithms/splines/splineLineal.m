%{
    AUTHOR: Russell Tito
    DESCRIPCION:
        Se utiliza para construir una curva lineal que pasa a través de
		un conjunto dado de puntos de control. Una spline lineal en particular
		se refiere a una curva definida por segmentos de polinomios lineales.
    INPUT:
        vector  x: variables independiente
        vector  y: variables dependientes
    OUTPUT:
        Retorna la curva
    USO:
        splineCubico(x,y)
    FUNCION_OCTAVE:
        y_interp = interp1(x, y, x_interp, 'spline');
%}
function splineLineal(x,y)
	n = length(x)-1;
	a = zeros(n,1);
	b = zeros(n,1);
	a
	b
	for i = 1:n
		a(i) = (y(i+1)-y(i))/(x(i+1)-x(i));
		b(i) = (y(i)*x(i+1) - y(i+1)*x(i))/(x(i+1)-x(i));
	endfor
	a
	b
	disp('Coeficientes de los polinomios lineal:');
    disp([a, b]);
	disp('Polinomios lineal:');
	for i = 1:n
		fprintf('P%d(x) =  %.4f * x + %.4f\n', i, a(i), b(i));
	end



	plot(x, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
	xlabel('x','Color','black','FontWeight','bold');
    ylabel('y','Color','black','FontWeight','bold');
	title('Spline Lineal','Color','black','FontWeight','bold');
	legend('Puntos','Location','northwest')
	hold on;

	% GRAFICANDO FUNCIONES
	for i = 1:n
		x_interval = x(i):0.1:x(i+1);
		y_values = a(i)*x_interval + b(i);
		plot(x_interval, y_values, '-r', 'linewidth', 2);
		legend('Puntos','Polinomios','Location','northwest');
		hold on;
	endfor
	hold off;
endfunction