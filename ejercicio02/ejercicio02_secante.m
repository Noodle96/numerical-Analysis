function [root, iteraciones] = ejercicio02_secante(x1, x0, tolerancia)
    iteraciones = 0;
    while( abs(x1 - theta(x1,x0)) >= tolerancia)
        iteraciones = iteraciones +1;
        x2 = theta(x1,x0);
        x0 = x1;
        x1 = x2;
    end
    root = x1;
end

function answer = theta(x1,x0)
    answer = x1 - (f(x1)*(x1-x0))/(f(x1)-f(x0));
end

function answer = f(x)
    answer = e^x -4*x^2;
end
