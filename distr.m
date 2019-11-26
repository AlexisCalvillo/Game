function [xrec,pCol]=distr(numJugTot,numJugCol,rec)
m=50; %Número de muestras
%Cálculo de vértices para el volumen total
vertices=[zeros(1,numJugCol);rec*eye(numJugCol)];
volTotal=volumenCM(vertices);
xrec=linspace(0,rec,m);
pCol=zeros(1,m);
for i=1:m
    verticesN=[zeros(1,numJugCol);xrec(i)*eye(numJugCol)];
    volN=volumenCM(verticesN);
    pCol(i)=volN/volTotal;
    
end
figure(1)
a=sprintf("Para %d jugadores", numJugCol);
plot(xrec,pCol), title(a);
hold on
end