clc
clear all
[u,v]=meshgrid(-1:.05:1,0:.02*pi:2*pi);
surf(u,(4.*u.^2-u.^4).*cos(v),(4.*u.^2-u.^4).*sin(v)), hold on
ezmesh(planefun,[-1.1,1.1,-2,2]), hold off
title('The surface and its tangent plane at P')