function y = Apartenenta(x, val1, val2)
  % Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
  % Stim ca 0 <= x <= 1
  
  % rezolvam sistemul pt ca
  % functia u(x) sa fie continua
  a = 1/(val2-val1);
  b = -a*val1;

  % calculam valoarea functiei in punctul x
  y = a*x+b;
  if x > val2
    y = 1;
  endif
  if x < val1
    y = 0;
  endif
endfunction