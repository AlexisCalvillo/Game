function coalic (VecVot, Vmin,rec)
%VecVot: Vector de votantes
%Vmin: Votantes m�nimos
%rec:  Recursos totales
close all;
%Cada iteraci�n hace una matriz A de n x m donde n es el
%n�mero de jugadores y m el n�mero de posibles coaliciones (sin verificar
%si son  v�lidas)
n=length(VecVot);
MComb=de2bi(1:2^n-1);
MCombVal=MComb*(VecVot')>=Vmin;
    for i=1:n
        
        indCombNEl=(sum(MComb')==(i));
        indMat=MCombVal.*indCombNEl';
        indMat=find(indMat);
        %Coaliciones v�lidas de i elementos
        MColN=MComb(indMat,:);
        %Distribucion jugador (por simetr�a s�lo necesitamos un caso para
        %cada n
        [xRec,pCol]=distr(n,i,rec);
        %C�digo de pruebas
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