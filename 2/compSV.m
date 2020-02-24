nJug=3;
n=50;
VPS=zeros(n,nJug);
VPP=zeros(n,nJug);
VPD=zeros(n,nJug);
VecVot=randi(100,n,nJug); 
for i=1:n
    
    [VPS(i,:), VPP(i,:), PS(i), PP(i)]=juegos(VecVot(i,:)+);
end
VDP=VPS-VPP;
difP=PS-PP;
figure(1)
plot([1:n],PS,'-')
hold on;
plot ([1:n],PP,'o');
axis([1 n -5*10^-1 5*10^-1])
figure(2)
plot(difP)
axis([1 n -5*10^-5 5*10^-5])