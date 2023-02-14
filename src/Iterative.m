function R = Iterative(nume, d, eps)
  % Functia care calculeaza matricea R folosind algoritmul iterativ.
  % Intrari:
  %	-> nume: numele fisierului din care se citeste;
  %	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
  %	-> eps: eruarea care apare in algoritm.
  % Iesiri:
  %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  f = fopen(nume, 'r');
  % citim continutul fisierului
  M = dlmread(f);
  % N este dimensiunea matricei asociate grafului
  N = M(1,1);
  % initializam cu 0 matricea asociata
  A = zeros(N, N);

  for i = 1:N
    % verificam nr de vecini
    nrVecini = M(i+1,2);
    % completam matricea asociata grafului (A)
    for j = 1:nrVecini
      vecin = M(i+1,j+2);
      A(i,vecin) = 1;
    endfor
  endfor

  for i = 1:N
    % pe diagonala principala nu vom avea 1
    A(i,i) = 0;
  endfor

  % initializam vectorul R
  for i = 1:N
    R(i) = 1/N;
  endfor
  R = R';

  while (1)
    % R0 este vectorul anterior iterarii
    R0 = R;
    for p = 1:N
      % calculam suma pt care termenii
      % sunt reprezentati de raportul dintre
      % PageRank-ul paginilor care trimit la
      % pagina actuala si nr de pagini
      % de la care se poate ajunge
      % de pe pagina actuala
      sum = 0;
      for i = 1:N
        sum += A(i,p)*R0(i)/norm(A(i,:),1);
      endfor
      % actualizam PageRank-ul
      R(p) = (1-d)/N + d*sum;
    endfor

    % verificam daca diferenta dintre R si R0
    % este mai mica decat eroarea acceptata
    % daca este mai mica, se finalizeaza procesul
    if norm(R-R0) < eps
      break;
    endif
  endwhile
endfunction
