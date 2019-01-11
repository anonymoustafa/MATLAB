
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

    

