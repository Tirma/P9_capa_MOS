%Epaisseur
tox = 5e-9 ;  %[m]
tsi = 200e-9 ;%[m]

% Dopage di Si
Na = 1e23 ; %[/m3] - type p
ni = 1e16 ; %[/m3]

% Nombre de point du maillage
Ntox = 50  ; % dans l'oxyde
NSi =  5000 ; % dans le semiconducteur

% Tension de grille %
Vg = 0.0:0.1:2;

% Classique ou quantique
classique = true ;

% Critère de convergence
SetErr =1e-11 ;