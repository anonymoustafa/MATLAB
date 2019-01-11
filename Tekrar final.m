clc;
i=0;
toc=1;
b=1;
disp('wait a moment please...');
while b< 5
    
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
format long;
n=1;
disp ('Tekrar SAdeh ');
disp ('bad as daryaft root zaman anjam kar eraee mishavad! ');

x0 = input('x0 ra vared konid? ');
eps = input( 'meghdare Eps ra vared konid? ');
x= f(x0);
tic;
while abs(x-x0)>= eps
    x0=x;
    x= f(x0);
    n=n+1;
end;
disp ('Root'), disp (x), disp ( n);
toc;
    else break;
    end;
end;

