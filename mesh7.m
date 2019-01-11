clc
clear all
syms x 
syms y 
syms z 
syms t 
f = [x,(4*x^2-x^4)*cos(t),(4*x^2-x^4)*sin(t)];
fx = diff(f,x);
ft = diff(f,t);
P = subs(f,[x,t],[.8,pi/2]);
fxp = subs(fx,[x,t],[.8,pi/2]);
ftp = subs(ft,[x,t],[.8,pi/2]);
normal =cross(fxp,ftp);
planeeqn = normal *transpose([x,y,z]-P)
