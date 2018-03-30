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
Lp = Laplacien_Poisson(Eps,X);
b = CL_class(Vg(21), rho_init, Nx);

% Résolution
Vx = Lp\b';
figure(1)
plot(X,Vx,'b')
title("V_0(x)")

% Convergence
for i=1:2
    [n,p,rho] = charge_classique(Vx,tox,X,Nx);
    figure(2)
    plot(X,rho,'r')
    title("rho_{iter}(x)")
    b = CL_class(Vg(21), rho, Nx);
    Vx = Lp\b';
    figure(3)
    plot(X,Vx,'g')
    title("V_{iter}(x)")
    pause
end


% Affichage de l'inversion de charge en fonction de Vg
% figure(4)
% plot(X,Vx)

%fin de la simulation
toc