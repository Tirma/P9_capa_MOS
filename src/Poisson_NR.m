function [LpNR,RHS_NR] = Poisson_NR(Lp,n,p,rho,Vprec)

physical_constants
Nx = size(Lp,1);

%%%%---A COMPLETER---%%%%
LpNR = Lp;
for i=2:(Nx-1)
    LpNR(i,i) = LpNR(i,i) - (q/kT)*(p(i)+n(i));       %On ajoute le au Lp le terme
end

RHS_NR = -rho -q/kT.*(p+n).*Vprec' ;                   %On crée le second membre
end