clc
r = 0:0.1:pi;
z = sin(r);
theta = 0:pi/20:2*pi;
xx = bsxfun(@times,r',cos(theta));
yy = bsxfun(@times,r',sin(theta));
zz = repmat(z',1,length(theta));
surf(yy,zz,xx)
axis equal