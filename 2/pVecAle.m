function [pMul, pMax]=pVecAle(nJugTot, VecVot, vecPag, votosMin)
%Matriz de combinaciones
MComb=de2bi(1:2^nJugTot-1);
%Matriz de combinaciones v�idas
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
pMax = max(pCoalN);
%Considerando el producto
pMul= prod(coal(:,2));



end