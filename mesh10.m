
clc
clear all
% original curve
t=0:0.1:4;
z=log(t.^(3));

% rotate for 360 grad
alpha=-pi:0.1:pi+0.1;

% calculate two other coordinates
x=cos(alpha)'*z;
y=sin(alpha)'*z;
t=kron(ones(length(alpha),1),t);

% plot
surf(x,y,t)