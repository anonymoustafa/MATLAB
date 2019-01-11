clc;
j=1;
matrix= input('matrix please... ');
[n,m]=size(matrix);
 for v = 1:m
 for i = 1:n
    
    k(1,j)= matrix(i,v);
    j=j+1;
end;

 end;
PGA= max(k);
jjj=1;
disp(PGA);