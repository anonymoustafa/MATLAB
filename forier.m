clc ;
clear all ;
f(x,n)= (-2/(n*pi))*((-1)^n)*sin(n*x);

n       = input('input the lower and upper boundry of n');
x       = 0:0.1:4*pi ;
sz      = size(x);
sum1  = zeros(sz);
i         = 1 : length(x);
for i = 1 : length(x)
    sum1(1,i)=
        