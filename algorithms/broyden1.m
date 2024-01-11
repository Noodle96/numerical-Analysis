function [x1, k] = broyden1(x0,x1,t1,t2)
  k =0;
  n = length(x0);
  inv_B = eye(n); % matriz identidad de nxn
  while norm(F(x1))>=t1 && norm(x1-x0)>=t2 
    y = F(x1) - F(x0);
    d = x1-x0;
    inv_B = inv_B + (d-inv_B*y)*d'*inv_B/(d'*inv_B*y);
    x0 = x1;
    x1 = x1 - inv_B*F(x1);
    k = k+1;
  endwhile
endfunction



function y = F(x)
  y = [7*x(1)*x(2)+5*x(2)-(x(3)^2)*sin(x(1))-12 
       -x(1)^4+(cos(x(2)))^2+2*x(3)^3-8
        6*x(1)+2*x(2)-x(3)+34];
   
endfunction