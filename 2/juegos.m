function [vecPagSh, vecPagP, Psh, Pp] = juegos (VecVot)
%nJugTot=5;
nJugTot=length(VecVot);
votosMin=ceil(sum(VecVot)/2)+1;
nIter=1e4;
[vecPagSh,matr] = vecPagShap(VecVot,nJugTot,votosMin);
close all;
%Genera un juego aleatorio 
%VecVot=[8,8,8,8,8];
%Genera un vector de pagos aleatorio
vecPag(:,1)= zeros(1,nJugTot);
vecPag(find(max(VecVot)),1)=100;
[pMul(1), pMax(1)]=pVecAle(nJugTot, VecVot, vecPag(:,1), votosMin);
vecPag(:,2)= vecPagSh*100;
[pMul(2), pMax(2)]=pVecAle(nJugTot, VecVot, vecPag(:,2), votosMin);
for i=3:nIter
   vecPag(:,i+1)=pagoAleatorio(nJugTot); 
   [pMul(i+1), pMax(i+1)]=pVecAle(nJugTot, VecVot, vecPag(:,i+1), votosMin);
end
j=find(pMul==max(pMul));
vecPag(:,j);
Pp=max(pMax);
Psh=pMax(2);
j=find(pMax==max(pMax(3:1e4)));
vecPagP=vecPag(:,j(1))'/100;
sprintf('Shapley');
vecPagSh;
sprintf('Matriz');
matr;
end