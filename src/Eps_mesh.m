function Eps = Eps_mesh(EpsSi,EpsOx,tox,X,Nx)

% maillage de la constante dielectrique

for ix=1:Nx
    if(X(ix)<tox)
        Eps(ix)=EpsOx;
    else
        Eps(ix)=EpsSi;
    end
end

end