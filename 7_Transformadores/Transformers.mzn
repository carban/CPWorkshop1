% Transformers
% Carlos Esteban Murillo S. - 1526857

%Parameters
int: n;
int: lFerro; 
int: lHours;
array[1..n] of int: ferro;
array[1..n] of int: hours;
array[1..n] of int: prof;

%Array of decision variables
array[1..n] of var int: transformers;

%Constraints
constraint forall(i in 1..n)( transformers[i] >= 0 );
% Ferromagneto
constraint sum(i in 1..n)( ferro[i] * transformers[i] ) <= lFerro;
% Hours of work
constraint sum(i in 1..n)( hours[i] * transformers[i] ) <= lHours;

%Objetive function
solve maximize sum(i in 1..n)( prof[i] * transformers[i] );

%Output
output [ "Transformer\(i) = \(transformers[i])\n" | i in 1..n ];
output [ "Profit = $\(sum(i in 1..n)( prof[i]*transformers[i] ))\n"];
output [ "ferro = \(sum(i in 1..n)( ferro[i]*transformers[i] ))\n"];
output [ "hours = \(sum(i in 1..n)( hours[i]*transformers[i] ))"];