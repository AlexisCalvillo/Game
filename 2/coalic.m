function coalic (VecVot, Vmin,rec)
%VecVot: Vector de votantes
%Vmin: Votantes mínimos
%rec:  Recursos totales
close all;
%Cada iteración hace una matriz A de n x m donde n es el
%número de jugadores y m el número de posibles coaliciones (sin verificar
%si son  válidas)
n=length(VecVot);
MComb=de2bi(1:2^n-1);
MCombVal=MComb*(VecVot')>=Vmin;
    for i=1:n
        
        indCombNEl=(sum(MComb')==(i));
        indMat=MCombVal.*indCombNEl';
        indMat=find(indMat);
        %Coaliciones válidas de i elementos
        MColN=MComb(indMat,:);
        %Distribucion jugador (por simetría sólo necesitamos un caso para
        %cada n
        [xRec,pCol]=distr(n,i,rec);
        %Código de pruebas
        for j=1:n
            nVeces=sum(MColN(:,j));
            pColn(j,:)=pCol.^nVeces;
            b(j,:)=sprintf('Jugador %d',j);
        end
        figure(2)
        a=sprintf('Nivel %d', i);
        plot(xRec, pColn),title(a),legend(b);
        
        pause()
    end
end