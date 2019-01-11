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
disp ('Vatari');
format long;
n=1;
x0= input('x0? ');
x1= input('x1? '); 
eps= input('eps? ');
tic;
x = (x1 - (ff(x1)*(x1-x0))/(ff(x1)-ff(x0)));
while abs(x1-x0)>= eps
    disp( x0); disp( x1); disp( x);
    x0=x1;
    x1=x;
    x = (x1 - (ff(x1)*(x1-x0))/(ff(x1)-ff(x0)));
    n=n+1;
    disp(n);
end;
disp('Root=') ; disp (x);
disp ('n='); disp(n);
toc;

    


    else break;
    end;
end;
