% Rectangles and Squares
% Carlos Esteban Murillo S. - 1526857

% Parameters
int: width;
int: height;
array[int] of int: sq;

% Constants
int: n_sq = length(sq);
int: max = if width > height then width else height endif;

% Array of variables
array[1..n_sq] of var 0..max: x;
array[1..n_sq] of var 0..max: y;

%Constraints
constraint sum(i in 1..n_sq)( sq[i]^2 ) == width * height;

constraint forall(i in 1..n_sq)(x[i] + sq[i] <= width /\ y[i] + sq[i] <= height);

constraint forall(i, j in 1..n_sq where i > j)(
                  x[i] + sq[i] <= x[j] \/ x[j] + sq[j] <= x[i] \/
                  y[i] + sq[i] <= y[j] \/ y[j] + sq[j] <= y[i]);

solve satisfy;

output ["width = ", show(width), " height = ", show(height), "\n"] ++
["x = ", show(x), "\n"] ++
["y = ", show(y), "\n"];