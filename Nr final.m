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
    pas = input(' password? ');
    if pas== 241136
        disp('Mostafa & Ali!!!');
        clc;
disp('N-R method');
format long;
n=1;
x0  = input('x0?  ');
eps = input('eps? ');
tic;
x= x0 - (f(x0)/h(x0));
while abs(x-x0)>= eps
    disp(x);
    x0 =x  ;
    x= x0 - (f(x0)/h(x0));
    n=n+1;
end;
disp('RooooooooooT==>>');
disp(x);
disp(n);
toc;
    else break;
    end;
end;

