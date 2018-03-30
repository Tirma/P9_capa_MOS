function rho_init = charge_initialisation(X,Nx,Wdep_max,tox,Na)

physical_constants

%%%%---A COMPLETER---%%%%

rho_init = 1:1:Nx;
rho_init = 0*rho_init;

% Condition de Dirichlet à gauche (masse à doite)
Vg = 0;
rho_init(1) = Vg;
rho_init(Nx) = 0;

end
