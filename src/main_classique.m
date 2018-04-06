%% ---------------------------------------------------- %%
%% ----------- Code Capacite MOS classique ------------ %%
%% ---------------------------------------------------- %%
clc;close all;clear all;
tic

% Initialisation des parametres
%------------------------------------

% Aquisition des constantes physiques
physical_constants ;

% D�finition des param�tres de la simulations %
simulation_parameters ;

% Propri�t� des mat�riaux et tension de bande plate %
material_properties ;

% Param�tre de la capacite MOS %
CapaMOS_parameters ;



% D�fintion des maillage %
% ---------------------- %

% Maillage globale
[X,Nx]=maillage(tox,tsi,Ntox,NSi) ; % X est le vecteur des positions et Nx son nombre de point


% Maillage en charge %
p = zeros(1,Nx) ;
n = zeros(1,Nx);
rho = zeros(1,Nx);

% Maillage en potentiel electrique :
Vx = zeros(1,Nx);

% Maillage des constantes dielectrique
Eps = Eps_mesh(EpsSi,EpsOx,tox,X,Nx);


%Initialisation du profil de charge (optionel ?)
rho_init = charge_initialisation(X,Nx,Wdep_max,tox,Na);


% Definition des Laplacien de Poisson et de Schr�dinger %
% ----------------------------------------------------- %

% Poisson
iVg = 4;
Lp = Laplacien_Poisson(Eps,X);          %On récupère la matrice Lp tq LpV=b
b = CL_class(Vg(iVg), rho_init, Nx);     %b = rho et on ajoute les Cl à la matrice  => En 1  : Vg
                                        %                                          => En Nx : 0
                                                                                        
% Résolution
Vx = Lp\b';
figure(1)
plot(X,Vx,'b')
title("V_0(x)")

% Convergence
for i=1:1
    [n,p,rho] = charge_classique(Vx,tox,X,Nx);      %On récupère une valeure pour rho
    figure(2)
    plot(X,rho,'r')
    title("rho_{iter}(x)")
    b = CL_class(Vg(iVg), rho, Nx);                  %On génère le second membre
    Vx = Lp\b';                                     %On fait un nouveau V
    figure(3)
    plot(X,Vx,'g')
    title("V_{iter}(x)")
end


% Affichage de l'inversion de charge en fonction de Vg
% figure(4)
% plot(X,Vx)

%fin de la simulation
toc