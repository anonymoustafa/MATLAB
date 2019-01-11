x=linspace(-3,3,1000);y=x';               %'
[X,Y]=meshgrid(x,y);
z=exp(-(X.^2+Y.^2)/2);
surf(x,y,z);shading interp