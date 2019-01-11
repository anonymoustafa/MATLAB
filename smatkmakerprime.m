clc;
j=1;
matrix= input('matrix please... ');
[n,m]=size(matrix);
 for v = 1:n
 for i = 1:m
    
    k(1,j)= matrix(v,i);
    j=j+1;
end;

 end;
PGA= max(k);
jjj=1;
disp(PGA);