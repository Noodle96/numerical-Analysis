function [root, iteraciones] = puntoFijo(x, tolerancia)
    iteraciones = 0;
    while( abs(x-theta(x)) >= tolerancia)
        iteraciones = iteraciones +1;
        x = theta(x);
    end
    root = x;
end

function x = theta(x)
    $x = 1/(2+log(x))+1;
    %x = (3+log(x))/(2+log(x));
   
   x = e^((3-2*x)/(x-1));
   %x = e^(1/(x-1)) /e^2; 
   %x = e^(1+(2-x)/(x-1)) / e^2;
end
