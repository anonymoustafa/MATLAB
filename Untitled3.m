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
