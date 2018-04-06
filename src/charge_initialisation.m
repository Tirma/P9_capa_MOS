function rho_init = charge_initialisation(X,Nx,Wdep_max,tox,Na)

physical_constants

%%%%---A COMPLETER---%%%%
% rho_init = 1:1:Nx; 
% rho_init = 0*rho_init;

for ix=1:Nx
    % dans le Si
    if( (X(ix)>tox)&&(X(ix)<Wdep_max)) 
%%%%---A COMPLETER---%%%%
        n(ix) = 0;
        p(ix) = 0;
        rho_init(ix)=q*(p(ix)-n(ix)-Na);

    % dans l'oxyde
    else
%%%%---A COMPLETER---%%%%
        n(ix)=0;
        p(ix)=0;
        rho_init(ix)=0;


    end
end

end
