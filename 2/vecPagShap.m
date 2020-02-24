function [vecPag, matr] = vecPagShap(vecVot,nJug, votMin)
vecPos=[1:nJug];
posib=factorial(nJug);
matr=zeros(posib+1,2*nJug+1);
permutaciones=perms(vecPos);
vecCant=zeros(1,nJug);
matr(1,1:nJug)=vecVot;
matr(2:posib+1,1:nJug)=permutaciones;
matr(:,nJug+1)=101;
for i=1:posib
    j=1;
    fin=false;
    while(~fin && j<=nJug)
        sumaVot=sum(vecVot(permutaciones(i,1:j)));
        if(sumaVot>=votMin)
            fin=true;   
            vecCant(permutaciones(i,j))=vecCant(permutaciones(i ,j))+1;
            matr(i+1,nJug+1+permutaciones(i,j))=1;
        else
            matr(i+1,nJug+1+j)=0;
        end
        j=j+1;
    end
end
vecPag=vecCant./posib;
end