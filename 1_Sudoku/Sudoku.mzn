% Sudoku Solver
% Carlos Esteban Murillo S. - 1526857

%Libraries
include "alldifferent.mzn";

%Constants
int: sudoDim = 9;
int: subDim = 3;

%sets
set of int: size = 1..sudoDim;
set of int: subSize = 1..subDim;

%Matrix of decision variables
array[size, size] of var 1..sudoDim: matrix;

%Matrix problem
array[size, size] of 0..sudoDim: initialMatrix;

%Constraints
constraint forall(i in size, j in size )(
  if initialMatrix[i, j] > 0 then matrix[i, j] = initialMatrix[i, j] endif
);

constraint forall(i in size)(
  alldifferent( [ matrix[i, j] | j in size ])
);

constraint forall(j in size)(
  alldifferent( [ matrix[i, j] | i in size ])
);

constraint forall(i, j in subSize)(
  alldifferent([ matrix[(i-1)*subDim + i1, (j-1)*subDim + j1] | i1, j1 in subSize ])
);

solve satisfy;

%Output
output[if j != sudoDim then "\(matrix[i,j]) " else "\(matrix[i,j])\n" endif | i,j in size];