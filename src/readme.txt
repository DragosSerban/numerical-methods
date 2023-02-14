Tema 1 - Metode Numerice

1. Algoritmul Iterative

- dupa deschiderea fisierului, am copiat toate elementele
intr-o matrice
- am extras N (nr liniilor si coloanelor din matricea asociata
grafului / nr de pagini web)
- am completat apoi matricea asociata grafului cu ajutorul datelor
salvate in matricea initiala de date, prin variabila nrVecini
- fiecare legatura dinspre o pagina spre alta este 1 in matrice
- pe diagonala principala avem doar 0, pt ca nu conteaza daca
o pagina are o legatura catre ea insasi
- la inceput initiem vectorul R, avand toate elementele egale cu
1/N astfel incat suma lor sa fie 1
- vom folosi vectorul R0 drept copie, deoarece semnifica valoarea
elementelor inainte de iterarea actuala
- pt fiecare pozitie din R vom calcula PageRank-ul
- calculam suma pt care termenii sunt reprezentati de raportul
dintre PR-ul paginilor care trimit la pagina actuala si nr de
pagini de la care se poate ajunge de pe pagina actuala
- actualizam PageRank-ul prin formula R(p) = (1-d)/N+d*sum
- la final verificam daca diferenta dintre R si R0 este mai mica
decat eroarea acceptata eps, iar daca este mai mica se finalizeaza
procesul, altfel se continua procesul iterativ

2. Algoritmul Algebraic

- dupa deschiderea fisierului, am copiat toate elementele
intr-o matrice
- am extras N (nr liniilor si coloanelor din matricea asociata
grafului / nr de pagini web)
- am completat apoi matricea asociata grafului cu ajutorul datelor
salvate in matricea initiala de date, prin variabila nrVecini
- facem un vector "legaturi" in care retinem nr de legaturi
din fiecare nod
- transpunem matricea (A = A') deoarece vom calcula raportul 
dintre nr de legaturi din nodul j in nodul i si nr total
de legaturi din nodul j in alte noduri
- in caz ca avem 1 pe diagonala principala, vom schimba aceasta
valoare in 0, din acelasi motiv ca la algoritmul Iterative:
nu conteaza daca o pagina are o legatura catre ea insasi
- I este matricea unitate cu N linii / coloane
- vom folosi formula R = aux + d*A*R (din resursa [1] de pe
Wikipedia), de unde vom ajunge la (I - d*A) * R = aux (*),
unde aux are fiecare element egal cu ((1-d)/N)
- asadar, notam M = I - d*A si calculam inversa lui M pt
a inmultii relatia (*) cu M^(-1) la stanga
- factorizarea [Q R] o vom calcula prin algoritmul
Gram Schmidt modificat
- ne folosim de faptul ca Q este matrice ortogonala si
inmultim prin Q' la stanga (Q*Q' = Q'*Q = I)
- la final vom afla fiecare element al vectorului R prin
algoritmul de rezolvare al unui sistem superior triunghiular
(R este o matrice superior triunghiulara), aplicat de n ori
(matricea din membrul drept are N coloane)

3. Gradul de Apartenenta

- dupa deschiderea fisierului, am copiat toate elementele
intr-o matrice
- am extras N (nr liniilor si coloanelor din matricea asociata
grafului / nr de pagini web)
- copiem in 2 variabile cele 2 valori date la final de fisier
(val1 si val2)
- cream fisierul in care vom afisa outputul
- apelam functiile iterative si algebraic pt a calcula prin 2
metode vectorul de PageRank si pt a-l afisa in fisier
- vom copia in PR1 vectorul R2 (calculat prin metoda algebraic)
- ne vom folosi de vectorul auxiliar pos pt a retine pozitia
initiala a fiecarui element din vectorul de PageRank (PR1)
- mai departe vom utiliza bubble sort pt a sorta descrescator
elementele din PR1, dar nu uitam sa actualizam si pozitia
elementelor din vectorul auxiliar de pozitii pos
- cum functia u(x) trebuie sa fie continua pe [0,1], vom
rezolva sistemul cu ecuatiile:
a*val1 + b = 0
a*val2 + b = 1
- calculam valoarea functiei in fiecare termen din PR1
- la final afisam in fisierul de output clasamentul paginilor,
alaturi de rezultatul functiei u(x) si inchidem fisierele

TESTARE:

- Tema a fost scrisa in Octave pe Linux (procesor : i5 gen 5)

- Rezultate:

graf1.out

7

0.137326
0.142411
0.156197
0.176649
0.147704
0.119857
0.119857

0.137419
0.142396
0.156189
0.176532
0.147754
0.119855
0.119855

1 4 0.184965
2 3 0.163529
3 5 0.154641
4 2 0.148994
5 1 0.143750
6 7 0.125242
7 6 0.125242

graf2.out:

8

0.185595
0.218098
0.179923
0.077482
0.087307
0.031945
0.078322
0.141328

0.185572
0.218095
0.179872
0.077464
0.087308
0.031919
0.078385
0.141387

1 2 0.179344
2 1 0.137106
3 3 0.129704
4 8 0.079723
5 5 0.009490
6 7 0.000000
7 4 0.000000
8 6 0.000000
