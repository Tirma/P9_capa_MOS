function  [n,p,rho] = charge_classique(Vx,tox,X,Nx)

physical_constants
simulation_parameters

for ix=1:Nx
    % dans le Si
    if(X(ix)>tox)      
%%%%---A COMPLETER---%%%%
        n(ix) = ni^2/Na*exp(-q*Vx(ix)/kT);
        p(ix) = Na*exp(q*Vx(ix)/kT);
        rho(ix)=p(ix)-n(ix)-Na;

    % dans l'oxyde
    else
%%%%---A COMPLETER---%%%%
        n(ix)=0;
        p(ix)=0;
        rho(ix)=0;


    end
end

end