function [root, iteraciones] = newtonRaphson(x, tolerancia)
    iteraciones = 0;
    while( abs(x-theta(x)) >= tolerancia)
        iteraciones = iteraciones +1;
        x = theta(x);
    end
    root = x;
end

function answer = f(x)
    answer = x - 1/(2+log(x))-1;
end
function answer= f_derivada(x)
    answer = 1 + 1/(x*(2+log(x))^2);
end
function ans = theta(x)
    ans = x - f(x)/f_derivada(x);
end
