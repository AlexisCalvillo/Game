function [volumen] = volumenCM(Vert)
n=length(Vert(1,:));
MatrDis=zeros(n,n);

for i=1:n
    reng=zeros(1,n);
    for j=i:n
        reng(j)=((Vert(i,:)-Vert(j,:))*(Vert(i,:)-Vert(j,:))');
    end
    MatrDis(i,:)=reng;
end
MatrDis=MatrDis'+MatrDis;

MatrCM= [MatrDis, ones(n,1); ones(1,n),0];
detCM=det(MatrCM);
volumen=sqrt(detCM*((-1)^(n))/((2^(n-1))*(factorial(n-1)^2)));
end