function [probCoal] = probCo(nJug, vecPag)
%nJug: Número de jugadores en la coalición
%vecPag: Vector de pagos de los jugadores

%Calcula la probabilidad de "éxito" de la coalición
%calculando cada una de las distribuciones marginales
pCol=zeros(1,nJug);
for i=1:nJug
    pCol(i)=calculaProb(vecPag(i),nJug);
end
    probCoal=prod(pCol);
end