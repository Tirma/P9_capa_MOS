function  [n,p,rho] = charge_classique(Vx,tox,X,Nx)
n=zeros(1,Nx);
p=zeros(1,Nx);
rho=zeros(1,Nx);

physical_constants
simulation_parameters

for ix=2:Nx-1
    % dans le Si
    if(X(ix)>tox)      
%%%%---A COMPLETER---%%%%
        n(ix) = (ni^2/Na)*exp(Vx(ix)/kT);
        p(ix) = Na*exp(-Vx(ix)/kT);
        rho(ix)=q*(p(ix)-n(ix)-Na);

    % dans l'oxyde
    else
%%%%---A COMPLETER---%%%%
        n(ix)=0;
        p(ix)=0;
        rho(ix)=0;


    end
end


end