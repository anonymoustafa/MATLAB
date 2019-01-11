clc;
clc;
i=0;
toc=1;
b=1;
disp('wait a moment please...');
while b< 10
    
    tic;
    pause(1)
    toc;
    b=floor(toc+i);
    disp(b);
    i=i+1;
    
    
end;

while 2==2
    pass = input(' password? ');
    if pass== 241136
        disp('Mostafa Ramezani!!!');
        format long;
disp('Bisection');
n=1;
a=input('a? ');
b=input('b? ');
eps=input('eps? ');
tic;
x= (a+b)/2;
while abs(f(x))>=eps
    v=f(x)* f(a);
    
    if  v> 0
        a = x;
        x= (a+b)/2;
    end;
    
    if  v< 0
        b = x;
        x= (a+b)/2;
        
    end;
    n= n+1;
end;
disp('roOT=== ');
disp(x);
disp(n);
toc;
    else break;
    end;
end;


