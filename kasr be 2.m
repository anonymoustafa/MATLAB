clc
clear d;
disp( 'tabdil kasr be mabnaye 2');
a = input('sorat? ');
b = input('makhraj? ');
d = (1:100);
format long
A= a/b ;
disp('A=' ); disp (A);
if A>1
    disp('Error');
end;

if A==1
    disp(' That is = 1');
end;

if A<1 
 C=A;
 B=3;
 i=1; 
while i<=100
    B=C*2;  
    Z=floor(B);
    if Z==1
        d(1,i)= 1;
        C=B-1;
    end;
    if Z==0
       d(1,i)= 0;
       C=B;
    end;
    i=i+1; 
end;
    disp(d);
end;

    

    
    


