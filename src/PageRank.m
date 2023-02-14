function [R1 R2] = PageRank(nume, d, eps)
  % Calculeaza indicii PageRank pentru cele 3 cerinte
  % Scrie fisierul de iesire nume.out

  f = fopen(nume, 'r');
  % citim continutul fisierului
  M = dlmread(f);
  % N este dimensiunea matricei asociate grafului
  N = M(1,1);
  % copiem in 2 variabile cele 2 valori date
  % la finalul fisierului
  val1 = M(N+2, 1);
  val2 = M(N+3, 1);

  % cream fisierul de output
  outputFile = strcat(nume, ".out");
  g = fopen(outputFile, 'w');

  % afisam in fisier cei 2 vectori
  % apeland functiile iterative si algebraic
  fprintf(g, "%d\n\n", N);
  R1 = Iterative(nume, d, eps);
  for i = 1:N
    fprintf(g, "%.6f\n", R1(i));
  endfor
  fprintf(g, "\n");
  R2 = Algebraic(nume, d);
  for i = 1:N
    fprintf(g, "%.6f\n", R2(i));
  endfor
  fprintf(g, "\n");

  PR1 = R2;
  % pos este un vector care retine pozitia
  % initiala a fiecarui element din PR1
  pos = zeros(N,1);
  for i = 1:N
    pos(i) = i;
  endfor

  % algoritm de sortare - bubble sort
  for i = 1:N-1
    for j = i+1:N
      if PR1(i) < PR1(j)
        aux = PR1(i);
        PR1(i) = PR1(j);
        PR1(j) = aux;
        % modificam si pozitia elementelor
        % din vectorul de pozitii
        aux = pos(i);
        pos(i) = pos(j);
        pos(j) = aux;
      endif
    endfor
  endfor

  for i = 1:N
    % calculam rezultatul functiei u(x)
    u = Apartenenta(PR1(i), val1, val2);
    % afisam in fisier clasamentul final
    fprintf(g, "%d %d %f\n", i, pos(i), u);
  endfor
  % inchidem fisierele
  fclose(f);
  fclose(g);
endfunction
