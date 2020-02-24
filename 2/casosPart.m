%Casos particulares para un juego sin ponderación entre niveles. 
n=[3:5];
VPS=zeros(length(n),n(length(n)));
VPP=zeros(length(n),n(length(n)));
for i=1:length(n)
     VecVot=[1:n(i)]; 
     [VPS(i,1:n(i)), VPP(i,1:n(i)), PS(i), PP(i)]=juegos(VecVot);
end
figure(1)
plot(n,PS), ylabel('Prob')
hold on;
plot(n, PP), legend('Shapley', 'Prop');

figure(2)
plot(n,-log(PS)), ylabel('-ln(Prob)')
hold on;
plot(n, -log(PP)), legend('Shapley', 'Prop');