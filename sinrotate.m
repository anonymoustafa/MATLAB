clc
clear all
[X,Y] = meshgrid(-3.14:.01:3.14);
R = sqrt(X^2 + Y^2) + eps;
P = sqrt(R-1) + eps;
Z = P;
mesh(X,Y,Z)