function B = PR_Inv(A)
  % Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  % La inceput factorizam Q R prin algoritmul
  % Gram Schmidt modificat, apoi ajungem la
  % o ecuatie de forma Q*R*A^(-1) = I
  % Q ortogonala => R*A^(-1) = Q'*I
  % apoi se rezolva N SST-uri si se afla inversa

  % Gram Schmidt start
  [nrL nrC] = size(A);
  for i = 1:nrC
    R(i,i) = norm(A(:,i));
    Q(:,i) = A(:,i)./R(i,i);
    for j = i+1:nrC
      R(i,j) = Q(:,i)'*A(:,j);
      A(:,j) = A(:,j)-Q(:,i)*R(i,j);
    endfor
  endfor
  % Gram Schmidt end

  % rezolvam ecuatia Q*R*A^(-1) = I
  % B = A^(-1)
  N = nrL;
  B = zeros(N);
  % Q este o matrice ortogonala
  aux = Q'*eye(N);
  
  for k = 1:N
    % rezolvam N sisteme superior triunghiulare
    % pt aflarea inversei
    for i = N:-1:1
    s = 0;
      for j = i+1:N
        s = s + R(i,j)*B(j,k);
      endfor
      B(i,k) = (aux(i,k)-s)/R(i,i);
    endfor
  endfor
endfunction