function [pMul, pMax]=pVecAle(nJugTot, VecVot, vecPag, votosMin)
%Matriz de combinaciones posibles de coaliciones
MComb=de2bi(1:2^nJugTot-1);
%Matriz de coaliciones v�lidas. Una coalici�n es v�lida si
%alcanzan al menos los votos m�nimos necesarios.
MCombVal=MComb*(VecVot')>=votosMin;
%Col Actual
coalAc=0;

%An�lisis de nivel. Comenzamos por coaliciones con 1 jugador y terminamos
%con n jugadores. 
    for i=1:nJugTot
        %Obtiene las coaliciones con i elementos (es decir, aquellas donde
        %hayan i jugadores.
        indCombNEl=(sum(MComb')==(i));
        %Obtiene las coaliciones v�lidas con i elementos
        indMat=indCombNEl.*MCombVal';
        %Obtiene los �ndices de las coaliciones v�lidas
        indMat=find(indMat);
        %Coaliciones v�lidas de i elementos
        MColN=MComb(indMat,:);
        %Probabilidad por nivel: pCoalN
        pCoalN(i)=0;
        [b,na]=size(MColN);
        %Probabilidad de cada una de las coaliciones con i jugadores
        pCol=zeros(1,b);
        for j=1:b
            coalAc=coalAc+1;
            %Probabilidad de la j-�sima coalici�n con i jugadores
            pCol(j)= probCo(i,vecPag(find(MColN(j,:))));
            coal(coalAc,:)=[i,pCol(j),MColN(j,:)]; %nJug, pCol y coalici�n
            %Si alguno llega con 1 solo jugador entonces su probabilidad es
            %1.
            if(any(pCol==1))
                pCoalN(i) = 1;
            else
                %pCoalN(i) = prod(pCol);
                %Considerando la probabilidad de ganar en cada nivel como
                %(1/njug)^niv
                %pCoalN(i) = prod(pCol)*(1/nJugTot)^(nJugTot-i);
                %Considerando como (nJug-niv)/nJug
                pCoalN(i) = prod(pCol)*(1/nJugTot)*(i);
            end
        end
        
    end
%Considerando el m�ximo
pMax = max(pCoalN);
%Considerando el producto
pMul= prod(coal(:,2));



end