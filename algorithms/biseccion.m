function [root, iteraciones] = biseccion(left,right,tolerancia)
    iteraciones = 1;
    while(right-left >= tolerancia)
        iteraciones++;
        middle = left + (right-left)/2;
        if(f(middle)*f(right) > 0)
            right = middle;
        else
            left = middle;
        endif
    endwhile
    root = left + (right-left)/2;
endfunction

function ans = f(x)
    %ans = sqrt(x) -5*exp(-x);
    ans = x - 1/(2+log(x)) -1;
endfunction
