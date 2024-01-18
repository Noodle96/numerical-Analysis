function myfunction(x)
  format long g;
  tolerancia = 1e-9;
  #if(sinx(x) == 0)
  if(abs(sin(x))< tolerancia)
        disp('Si es una solucion de: sin(x)=0')
        disp(x)
  else
      disp('NO es una solucion de: sin(x)=0')
      disp(x)
  endif
endfunction