function R = Algebraic(nume, d)
  % Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
  % Intrari: 
  %	-> nume: numele fisierului in care se scrie;
  %	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

  % facem un vector in care retinem nr
  % de legaturi din fiecare nod
  for i = 1:N
    legaturi(i) = 0;
    for j = 1:N
      if (A(i,j) == 1 && i != j)
        legaturi(i) += 1;
      endif
    endfor
  endfor

  % transpunem matricea deoarece vom face
  % raportul dintre nr de legaturi din nodul j
  % in nodul i si nr total de legaturi
  % din nodul j in alte noduri
  A = A';
  for j = 1:N
    for i = 1:N
      A(i,j) = A(i,j)/legaturi(j);
    endfor
    % pe diagonala principala nu vom avea 1
    A(j,j) = 0;
  endfor

  I = eye(N);
  % M este matricea pe care o gasim din formula
  % R = aux + d*A*R =>
  % R (I - d*A) = aux
  % aux va fi initializat mai jos
  M = I - d*A;
  % aflam prin Gram Schmidt modificat
  % factorizarea Q R pt a calcula inversa lui M
  % vom folosi notatiile: Qf = Q si Rf = R
  % pt ca deja am rezervat numele R pt vectorul
  % returnat de functie

  % initializarea vectorului aux din formula
  aux(1:N) = ((1-d)/N);
  aux = aux';

  % aflam inversa matricei M
  INV = PR_Inv(M);
  % calculam vectorul R
  R = INV*aux;
  
endfunction
