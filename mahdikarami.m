clc, clear  ;
input(' Hit Enter ');
tic;
m = 1000;
b = 1;
y = 1;
z = 0;
s = 0.00001;
q = 1;
u = .1;
dt = 1;
dx = 1;
Dx = fischer(b,y,z,s,q,u);
c = zeros(m);
c(2,:) = 100;

for n = 1:m
                for j = 2:m-1
            
                        c(n+1,j) = c(n,j) - (u*dt/dx)*(c(n,j)-c(n,j-1)) + (Dx*dt/dx)*(c(n,j+1)-2*c(n,j)+c(n,j-1));
                        
                end
end


fprintf('time is= %6.4g' , toc)