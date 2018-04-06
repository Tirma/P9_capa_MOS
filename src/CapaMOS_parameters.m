% Param�ter de la capa MOS%
%-------------------------%

% A COMPLETER 

% Calcul du niveau de Fermi par rapport � Ei et Ec
Ef_Ei = kT*log(Na/ni) ; %[eV]
Ef_Ec = Eg/2-Ef_Ei; %[eV]
PhyF =Ef_Ei; %[eV]

% Travail de sortie du Si
PhyS = KhiSi+Ef_Ec ; %[eV]

% Tension de bande plate
Vfb = 0  ;  % Forcee a 0, mais normalement = PhyM-PhyS;

% Couche de desertion maximale
Wdep_max = sqrt(4*PhyF*EpsSi/(q*Na));

% Warning
if(Wdep_max>tsi)
    disp('attention : epaisseur de film inf�rieur � la couche de d�sertion max');
    pause
end

% Capacite de l'oxyde
Cox = EpsOx/tox ;

% Tension de seuil
Vt = Vfb+2*PhyF+sqrt(2*q*Na*EpsSi*2*PhyF)/Cox ;