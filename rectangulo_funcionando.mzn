int: width;
int: height;
array[int] of int: sq;
set of int: types = 1..max(sq);

int: n_sq = length(sq);
int: max = if width > height then width else height endif;

array[1..n_sq] of var 0..max: x;
array[1..n_sq] of var 0..max: y;
array[1..n_sq] of var types: size_sq = sq;

constraint sum(i in 1..n_sq)( sq[i]^2 ) == width * height;

constraint forall(i in 1..n_sq)(x[i] + size_sq[i] <= width /\ y[i] + size_sq[i] <= height);

constraint forall(c1, c2 in 1..n_sq where c1 > c2)(
                  x[c1] + size_sq[c1] <= x[c2] \/ x[c2] + size_sq[c2] <= x[c1] \/
                  y[c1] + size_sq[c1] <= y[c2] \/ y[c2] + size_sq[c2] <= y[c1]);

solve satisfy;

% output ["width = ", show(width), " height = ", show(height), "\n"] ++
% ["x = ", show(x), "\n"] ++
% ["y = ", show(y), "\n"];

output[show(x) ++ ";" ++ show(y)];