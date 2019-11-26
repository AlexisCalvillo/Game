function vecPag = pagoAleatorio(nJug)
%Genera un vector de pagos (en proporci�n) aleatorio
vecPag = randi(50000,1,nJug);
vecPag = 100*vecPag/sum(vecPag);
end