function [probCoal] = probCo(nJug, vecPag)
%nJug: N�mero de jugadores en la coalici�n
%vecPag: Vector de pagos de los jugadores

%Calcula la probabilidad de "�xito" de la coalici�n
%calculando cada una de las distribuciones marginales
pCol=zeros(1,nJug);
for i=1:nJug
    pCol(i)=calculaProb(vecPag(i),nJug);
end
    probCoal=prod(pCol);
end