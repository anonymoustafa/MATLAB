clc
clear all
k = 5;
n = 2^k-1;
theta = pi*(-n:2:n)/n;
phi = ((pi/2)*(n/4:2:n)'/n);
X = sin(phi)*cos(theta);
Y = sin(phi)*sin(theta);
Z = sin(phi)*ones(size(theta));
surf(X,Y,Z)
axis square
