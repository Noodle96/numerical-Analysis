%{
    AUTHOR: Russell Tito
    DESCRIPCION:
        Esta función ajusta un conjunto de datos a un
        polinomio mediante el método de mínimos cuadrados.
    INPUT:
        vector columna x: variables independiente
        vector columna y: variables dependientes
        gradoPolinomio
    OUTPUT:
        Retorna los coeficientes de el polinomio de la siguiente forma:
        [a0, a1, ..., an]; n = gradoPolinomio
        polinomio: a0 + a1x^1 + ... + anx^n
    USO:
        ans = myPolyFit(x,y,gradoPolinomio)
    FUNCION_OCTAVE:
        ans = polyfit(x,y,gradoPolinomio)
%}
function ans = myPolyFit(x, y, gradoPolinomio)
    % Formando la Matriz A de axb
    % a = (length(x or y))  filas
    % b = (gradoPolinomio + 1) columnas
    n = length(x);
    A = zeros(n,gradoPolinomio+1);
    for i=0:gradoPolinomio
        A(:,i+1) = x.^i;
    end
    ans = inv(A'*A)*A'*y;

    % y_prima = zeros(1,length(x));
    % % y_prima
    % for i = 1:n
    %     sum = 0;
    %     for k = 0:gradoPolinomio
    %         sum = sum + (ans(k+1)*x(i)^k);
    %     end
    %     y_prima(i) = sum;
    % end
    x_prima = 0:0.1:11;
    y_prima = zeros(1,length(x_prima));
    % y_prima
    for i = 1:length(x_prima)
        sum = 0;
        for k = 0:gradoPolinomio
            sum = sum + (ans(k+1)*x_prima(i)^k);
        end
        y_prima(i) = sum;
    end
    
    % y_prima
    %plotting
    % plot(x, ans,'linewidth',2, '-b', x_mace_spam, y_mace_spam, '--r')
    plot(x, y, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
    hold on;
    plot(x_prima, y_prima, '-r', 'linewidth', 2);
    grid on;
    titulo = sprintf('Ajuste de curva - polinomio grado %d', gradoPolinomio);
    title(titulo);
    xlabel('x:variable Independiente','Color','black','FontWeight','bold');
    ylabel('y:variable Dependiente','Color','black','FontWeight','bold');
endfunction
% x = [1 2 3 4 5 6 7 8 9 10]
% y = [3790.81 4407.51 4412.01 4711.73 4283.17 5105.71 5383.11 5807.58 6079.87 6205.98 ]'
% format shortG