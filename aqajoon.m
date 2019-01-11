
mp = 2400; 
x = 1900;
q = 16.2;
b = 33.5;
y = 0.5;
a = b * y;
u = 2400/(1.1*3600);
t = 1.1*3600;
lcdd = fischer(b,y,0,0.00116,q,u);

canal = (mp ./ (2.* sqrt(pi .* lcdd .* t )) ) .* exp(-1 .* (((x-(u.*t)).^2)/(4.*lcdd.*t)))