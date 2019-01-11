clc
clear all
[X,Y] = meshgrid(-3.14:.01:3.14);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R);
mesh(X,Y,Z)