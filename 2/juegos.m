function juegos (nJugTot, VecVot)
%nJugTot=5;
votosMin=20;
nIter=10e3;
close all;
%Genera un juego aleatorio 
%VecVot=[8,8,8,8,8];
%Genera un vector de pagos aleatorio
vecPag(:,1)= pagoAleatorio(nJugTot); 
vecDir= rand(1,3);
%vecDir= vecDir/(vecDir.*vecDir);
[pMul(1), pMax(1)]=pVecAle(nJugTot, VecVot, vecPag(:,1), votosMin);
for i=1:nIter
   vecPag(:,i+1)=pagoAleatorio(nJugTot); 
   [pMul(i+1), pMax(i+1)]=pVecAle(nJugTot, VecVot, vecPag(:,i+1), votosMin);
end
j=find(pMul==max(pMul))
vecPag(:,j)
max(pMul)
j=find(pMax==max(pMax))
vecPag(:,j)
max(pMax)

end