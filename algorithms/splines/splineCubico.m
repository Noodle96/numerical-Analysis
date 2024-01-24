function splineCubico(x,y)
	n = length(x) -1 ;
	% formando h
	h = zeros(n,1);
	h
	for i = 1:n
		h(i) = x(i+1) - x(i);
	endfor
	h
	% formando la matriz A
	A = zeros(n-1,n+1);
	A
	for i = 1:n-1
		A(i,i) = h(i);
		A(i,i+1) = 2*(h(i)+h(i+1));
		A(i,i+2) = h(i+1);
	endfor
	A
	% formando la matriz b
	b = zeros(n-1,1);
	b
	for i = 1:n-1
		b(i) = 6*( (y(i+2)-y(i+1))/h(i+1) - (y(i+1)-y(i))/h(i) );
	endfor
	b
	% eliminando la primera y la ultima columan de A
	A
	A = A(:,2:n);
	A
	% formamos g
	g = inv(A)*b;
	g
	% agregar un 0 al final y al inicio de g
	g = [0;g;0];
	g
	% formamos los coeficientes a_k b_k c_k d_k
	a = zeros(n,1);
	b = zeros(n,1);
	c = zeros(n,1);
	d = zeros(n,1);
	for i = 1:n
		a(i) = (g(i+1)-g(i))/(6*h(i));
		b(i) = g(i+1)/2;
		c(i) = (y(i+1)-y(i))/h(i) + (2*h(i)*g(i+1)+h(i)*g(i))/6;
		d(i) = y(i+1);
	endfor
	a
	b
	c
	d
	% formamos los polinomios
	% crea una celda (cell array) llamada pol con n elementos.
	% La variable pol será una celda que puede contener una variedad
	% de tipos de datos, como números, cadenas de texto, matrices,
	% funciones, entre otros.
	% pol = cell(n,1);
	% pol
	% for i = 1:n
	% 	ai = a(i);
	% 	bi = b(i);
	% 	ci = c(i);
	% 	di = d(i);
	% 	xi = x(i);
	% 	pol{i} = @(x) ((@(ai,bi,ci,di,xi) @(x) ai*(x-xi)^3 + bi*(x-xi)^2 + ci*(x-xi) + di)(ai,bi,ci,di,xi));
	% endfor
	% pol
	% Formando los polinomios
    % pol = cell(n, 1);
    % for i = 1:n
    %     pol{i} = @(x) a(i) * (x - x(i))^3 + b(i) * (x - x(i))^2 + c(i) * (x - x(i)) + d(i);
    % end
	% pol
    
    % Puedes retornar o imprimir los polinomios según tus necesidades
    disp('Coeficientes de los polinomios cúbicos:');
    disp([a, b, c, d]);

    % disp('Polinomios cúbicos:');
    % disp(pol);
	% Imprimir los polinomios cúbicos de manera más legible
	disp('Polinomios cúbicos:');
	for i = 1:n
		fprintf('P%d(x) = %.4f * (x - %.4f)^3 + %.4f * (x - %.4f)^2 + %.4f * (x - %.4f) + %.4f\n', ...
			i, a(i), x(i+1), b(i), x(i+1), c(i), x(i+1), d(i));
	end

	x_f = x(1):0.01:x(n+1);
	y_f = zeros(1, length(x_f));
	for i = 1:length(x_f)
		y_f(i) = x_f(i).^3 - x_f(i).^2 + x_f(i) + 2;
	endfor
	plot(x_f, y_f, 'b','linewidth', 2);
	hold on;

	% ploteando los puntos
	plot(x, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
	xlabel('x','Color','black','FontWeight','bold');
    ylabel('y','Color','black','FontWeight','bold');
	title('Spline Cubico','Color','black','FontWeight','bold');
	legend('Funcion original','Puntos','Location','northwest')
    hold on;



	% GRAFICANDO LOS POLINOMIOS
	for i = 1:n
		x_interval = x(i):0.1:x(i+1);
		y_values = a(i) * (x_interval - x(i+1)).^3 + b(i) * (x_interval - x(i+1)).^2 + c(i) * (x_interval - x(i+1)) + d(i);
		plot(x_interval, y_values, '-r', 'linewidth', 2);
		legend('Funcion original','Puntos','spline','Location','northwest')
		hold on;
	endfor
	hold off;
endfunction