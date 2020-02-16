% Kakuro Solver
% Carlos Esteban Murillo S. - 1526857

%Libraries
include "alldifferent.mzn";

%Parameters
int: whites;
int: size;
int: large;

%Array Parameters
array[1..size, 1..large] of int: pro;

array[1..size] of int: res;

%Array of decision variables
array[1..whites] of var 1..9: w;

%Constraints
constraint forall(i in 1..size)(

  alldifferent( [ w[pro[i, j]] | j in 1..large where pro[i, j] != 0] ) 
  /\ 
  sum( [ w[pro[i, j]] | j in 1..large where pro[i, j] != 0] ) == res[i]
  
);

solve satisfy;

%Output
output[show(w)];