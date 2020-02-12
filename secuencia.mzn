% Magic Sequence
% Carlos Esteban Murillo S. - 1526857

%Libraries
include "among.mzn";

%Parameters
int: size;

% sets
set of int: range = 0..(size - 1);

%Array of decision variables
array[range] of var range: seq;

%Constraints

% VERSION 1
% constraint forall(i in range)( among(seq[i], seq, i..i) );

% VERSION 2
constraint sum(i in range)( seq[i] * (i - 1) ) == 0;
constraint sum(seq) == size;
constraint forall(i in range)( among(seq[i], seq, i..i) );

% Output
output[show(seq)];