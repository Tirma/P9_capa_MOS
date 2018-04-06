% ---------------------------------------------------- %
% ---------------- Code Capacit� MOS ----------------- %
% ---------------------------------------------------- %
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

% % D�duction du maillage des points inconnus
% Xinc = X(2:end-1);
% Nxinc = length(Xinc);

% Maillage en charge %
p = zeros(1,Nx) ;
n = zeros(1,Nx);
rho = zeros(1,Nx);

% Maillage en potentiel electrique :
Vx = zeros(1,Nx);

% Maillage des constantes dielectrique
Eps = Eps_mesh(EpsSi,EpsOx,tox,X,Nx);

% Initialisation de l'�nergie potentiel
%Ep0 = En_Pot_Init(Eb,Nx,tox,X) ;

% % Maillage des masses effective (a faire pour partie 6)
% [m2fold,m4fold] = meff_mesh(mOx,ml,mt,tox,X,Nx);

%Initialisation du profil de charge (optionel ?)
rho_init = charge_initialisation(X,Nx,Wdep_max,tox,Na);
%plot(X,rho_init,'b')




% Definition des Laplacien de Poisson et de Schr�dinger %
% ----------------------------------------------------- %

% Poisson
Lp = Laplacien_Poisson(Eps,X);

%Programme précédent
b = CL_class(Vg(1), rho_init, Nx);
Vx = Lp\b';


% % Schr�dinger
% [Ls2,Ls4] = Laplacien_Schrodinger(m2fold,m4fold,X) ;




% ------------------------------------ %
% ----- Boucle de convergence -------- %
% ------------------------------------ %

%Tracé
ax1=subplot(2,2,1);
title("V(x)")
ax2=subplot(2,2,2);
title("\rho(x)")
ax3=subplot(2,2,3);
title("n(x)")
ax4=subplot(2,2,4);
title("Qinv(x)")


for iVg=1:length(Vg)
    Error = 1;
    while (Error > SetErr)

        
        % R�solution de l'�quation de Poisson  %
        % -------------------------------------%
        
        % Stockage du potentiel pr�c�dent
        Vprec = Vx ;

        % Schema Newton_Raphson
        [LpNR,RHS_NR] = Poisson_NR(Lp,n,p,rho,Vprec);
        
        % Condition aux limites : tension de grille � gauches
        RHS_NR = boundary_cond(RHS_NR, Eps, X, Vg(iVg));
        
        % Condition aux limites : tension de bulk � la masse
        %Condition aux limites pertinente ?
        
        % Resolution de Poisson
        Vx = LpNR\RHS_NR';% ;  %(((LpNR)^-1)*RHS_NR')' ;
        
        % Ajout des points connus
        %Vx = [Vg(iVg) V_sol' 0] ;        
        
        
        % Calcul des profils de charges et de la charge d'inversion %
        % --------------------------------------------------------- %
        
        % Cas classique
        if(classique)
            [n,p,rho] = charge_classique(Vx,tox,X,Nx);            
            
            % Cas quantique
        else
            [n,p,rho] = charge_quantique(Ls2,Ls4,Na,Vx,tox,X,Nx);
        end
        
        
        % Calculs de la charge d'inversion
 %       Qinv(iVg) = trapz(X,q*n);
        
        
        % Calcul de l'erreur de convegence et affichage de l'avancement
 %       clc
        Error = mean((Vx-Vprec).^2); % Affiche l'erreur
 %       disp(Vg(iVg)) % Affiche la valeur de Vg en cours
        
        
        % Affichage des r�sultats
        % ------------------------------------------- %
        
        % Creer une fonction qui affiche dans une seule fenetre :
        % V(x)
        % n(x)
        % rho(x)
        % Qinv(Vg)
        
        
        
        
        
      
    end
    hold(ax1,'on')
    plot(ax1,X,Vx)
    hold(ax1,'off')
    
    hold(ax2,'on')
    plot(ax2,X,rho)
    hold(ax2,'off')
    
    hold(ax3,'on')
    plot(ax3,X,n)
    hold(ax3,'off')
    
%     hold(ax4,'on')
%     plot(ax4,X,zeros(Nx))
%     hold(ax4,'off')
    
    pause(0.5)
    
end


% ---------------------------------------------- %
% ----- Fin de la boucle de convergence -------- %
% ---------------------------------------------- %



% % Calcul de la charge d'inversion theorique et affichage final
% %-------------------------------------------------------------
% 
% % Charge d'inversion theorique
% Qinv_theo = %%%%---A COMPLETER---%%%%;
% 
% % Affichage de l'inversion de charge en fonction de Vg
% figure(4)
% plot(Vg,Qinv,Vg,Qinv_theo)
% title('Qinv vs Vg');
% 
% 
% %fin de la simulation
toc


