include "alldifferent.mzn";

array[int] of string: persons;

array[int, 1..2] of int: next;
array[int, 1..2] of int: separate;
array[int, 1..3] of int: distance;

int: nnext = floor(length(next) / 2);
int: nsep = floor(length(separate) / 2);
int: ndis = floor(length(distance) / 3);

int: l = length(persons);
int: digs = ceil(log(10.0,int2float(l)));

array[1..l] of var 1..l: per;

constraint alldifferent(per);

constraint forall(i in 1..ndis)(
  distance[i, 3] >= 1 /\ distance[i, 3] <= l-2
);

constraint forall(p in 1..nnext)(
  (per[1] == next[p, 1] /\ per[2] == next[p, 2]) \/
  (per[l] == next[p, 1] /\ per[l-1] == next[p, 2]) \/
  exists(i in 2..l-1)(
    (per[i] == next[p, 1] /\ (per[i+1] == next[p, 2] \/ per[i-1] == next[p, 2]))
  )
);

constraint forall(p in 1..nsep)(
  (per[1] == separate[p, 1] /\ per[2] != separate[p, 2]) \/
  (per[l] == separate[p, 1] /\ per[l-1] != separate[p, 2]) \/
  exists(i in 2..l-1)(
    (per[i] == separate[p, 1] /\ per[i+1] != separate[p, 2] /\ per[i-1] != separate[p, 2])
  )
);

constraint forall(p in 1..ndis)(
  exists(i,j in 1..l)(
      per[i] == distance[p, 1] /\ per[j] == distance[p, 2] /\ 
%       abs(i - j) - 1 == distance[p, 3]
      abs(i - j) - 1 <= distance[p, 3] /\ abs(i - j) - 1 >= 1
  )
);

output[ show(persons[show_int(1, per[i])]) ++ " " | i in 1..l];