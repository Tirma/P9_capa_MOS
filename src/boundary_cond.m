function RHS_NR = boundary_cond(RHS_NR,Eps,X,Vg)

%Calcul du terme de la diagonnale inf�rieure Laplacien
%Bp1 = %%%%---A COMPLETER---%%%%;
Nx = size(RHS_NR,2);

% Modification du second membre (RHS)
RHS_NR(1)  = Vg;
RHS_NR(Nx) = 0;
        

end