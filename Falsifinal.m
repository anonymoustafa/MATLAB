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
disp('Regula Falsi Method');
n=1;
a=  input('a? ');
b=  input('b? ');
eps=input('eps? ');
tic;
x = (a* f(b)- b*f(a))/(f(b)-f(a));
while abs(f(x))>= eps
    disp(x);
     V = (f(x)*f(a));
    if V>0
        a=x;
       
    end;
    if V<0
       
        b=x;
    end;
            n=n+1;
        x = (a* f(b)- b*f(a))/(f(b)-f(a));

end;
disp('ROOT');
disp(x);
disp(n);
toc;

    else break;
    end;
end;

