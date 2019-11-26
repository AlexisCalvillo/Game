clear all;
nJugTot=8;
votosMin=20;
close all;
%Genera un juego aleatorio 
VecVot=generaPartidas(nJugTot,3, 15);
%Genera un vector de pagos aleatorio
vecPag= pagoAleatorio(nJugTot);
%Matriz de combinaciones
MComb=de2bi(1:2^nJugTot-1);
%Matriz de combinaciones v�lidas
MCombVal=MComb*(VecVot')>=votosMin;
%Col Actual
coalAc=0;

%An�lisis de nivel
    for i=1:nJugTot
        indCombNEl=(sum(MComb')==(i));
        indMat=indCombNEl.*MCombVal';
        indMat=find(indMat);
        %Coaliciones v�lidas de n-i+1 elementos
        MColN=MComb(indMat,:);
        pCoalN(i)=0;
        [b,na]=size(MColN);
        pCol=zeros(1,b);
        for j=1: b
            coalAc=coalAc+1;
            pCol(j)= probCo(i,vecPag(find(MColN(j,:))));
            coal(coalAc,:)=[i,pCol(j),MColN(j,:)]; %Coaliciones, nivel y p coal
            pCoalN(i) = prod(pCol);
        end
        
    end
%Considerando el m�ximo
pJuegoMax = max(pCoalN)
%Considerando el producto
pJuegoProd= prod(coal(:,2))



%%Dado un juego maximizar la probabilidad de que se de el juego. 