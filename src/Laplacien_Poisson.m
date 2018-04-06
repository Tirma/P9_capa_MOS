function Lp = Laplacien_Poisson(Eps,X)

% Calcul des diagonales sup�rieurs (Ap) et inf�rieur (Bp)

% Question preliminaire : combien de point pour la matrice Laplacienne ?

%%%%---A COMPLETER---%%%% 
% CAL de Dirichlet
N = length(X);
Lp = sparse(N,N);

%Dirichlet
Lp(1, 1) = 1;
Lp(N, N) = 1;

% Points interieurs du maillage
for p=2:N-1
    G = (Eps(p-1) + Eps(p))/((X(p+1)-X(p-1))*(X(p)-X(p-1)));
    D = (Eps(p+1) + Eps(p))/((X(p+1)-X(p-1))*(X(p+1)-X(p)));
    C = - G - D;
    
    Lp(p,p-1) = G;
    Lp(p,p) = C;
    Lp(p,p+1) = D;
end
