% Use this editor as a MiniZinc scratch book
float: pButano = 0.58;
float: pCatalico = 1.55;
float: pNafta = 0.85;

var 0..100: butano;
var 0..100: catalico;
var 0..100: nafta;

solve minimize pButano * butano + pCatalico * catalico + pNafta * nafta;

output[show(butano) ++ show(catalico) ++ show(nafta)];