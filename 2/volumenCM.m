function [volumen] = volumenCM(Vert)
n=length(Vert(1,:));
MatrDis=zeros(n+1,n+1);

for i=1:n+1
    reng=zeros(1,n+1);
    for j=i:n
        reng(j)=((Vert(i,:)-Vert(j,:))*(Vert(i,:)-Vert(j,:))');
    end
    MatrDis(i,:)=reng;
end
MatrDis=MatrDis'+MatrDis;

MatrCM= [MatrDis, ones(n+1,1); ones(1,n+1),0];
detCM=det(MatrCM);
volumen=sqrt(detCM*((-1)^(n+1))/((2^(n))*(factorial(n)^2)));
end