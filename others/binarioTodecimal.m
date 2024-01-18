function ans = binarioTodecimal(binarioNumber)
  #disp(length(binarioNumber));
  e = 0;
  a = 0;
  for i=length(binarioNumber):-1:1
    #disp(e);
    #disp(i)
    #disp((binarioNumber(i)-'0'))
    a +=  ((binarioNumber(i)-'0')* power(2,e));
    e++;
  endfor
  ans = a;
endfunction

# 110
# 0*2^0   +   1*2^1  +   1*2^2