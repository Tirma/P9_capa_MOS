function [X,Nx]=maillage(tox,tsi,Ntox,NSi)

% Maillage impose, ne pas le changer 

Xtox = 0:(tox/(Ntox-1)):tox ;
XSi = tox:(tsi/(NSi)):(tsi+tox) ;
X = [Xtox XSi(2:end)] ;
Nx = length(X) ;

end