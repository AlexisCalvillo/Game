function [prob] = calculaProb(pago, nJug)
%pago: Parte porcentual que le toca a dicho jugador (el pago es porcentual,
%es decir, de 1 a 100
%nJug: Número de jugadores en la coalición

%Calcula la probabilidad de coalición de un jugador dado un pago y una
%cantidad de jugadores
vertices=[zeros(1,nJug);100*eye(nJug)];
volTotal=volumenCM(vertices);
verticesN=[zeros(1,nJug);pago*eye(nJug)];
volN=volumenCM(verticesN);
prob=volN/volTotal;
end