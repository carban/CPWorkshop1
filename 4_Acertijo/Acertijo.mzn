% Logic Riddle
% Carlos Esteban Murillo S. - 1526857

%Libraries
include "alldifferent.mzn";
include "increasing.mzn";

%Decision Variables
var 1..3: Juan;
var 1..3: Oscar;
var 1..3: Dario;

var 1..3: Gonzalez;
var 1..3: Garcia;
var 1..3: Lopez;

var 1..3: clasica;
var 1..3: pop;
var 1..3: jazz;

var 1..3: vCuatro;
var 1..3: vCinco;
var 1..3: vSeis;

% Constraints
constraint all_different([Juan, Oscar, Dario]);
constraint all_different([Gonzalez, Garcia, Lopez]);
constraint all_different([clasica, pop, jazz]);
constraint all_different([vCuatro, vCinco, vSeis]);

constraint Juan != Gonzalez /\ Juan != vCuatro /\ Gonzalez != vSeis /\ Gonzalez == clasica;
constraint pop != Garcia /\ pop != vCuatro;
constraint Oscar != Lopez /\ Oscar == vCinco;
constraint Dario != jazz;

%Solving symmetries
constraint increasing([Juan, Oscar, Dario]);

solve satisfy;

%Output
output[
"Names     : ", show([Juan, Oscar, Dario]), "\n",
"Lastnames : ", show([Gonzalez, Garcia, Lopez]), "\n",
"Music     : ", show([clasica, pop, jazz]), "\n",
"Age       : ", show([vCuatro, vCinco, vSeis]), "\n"];