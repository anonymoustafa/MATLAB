%LAGRANGE INTERPOLATION

clear
hold off
DATA=[.25 1 1.5 2 2.4 5; 23.1 1.68 1 .84 .83 1.26];
n=length(DATA(1,:)); XDATA= DATA(1,:);
flops(0);
X=0:.1:6;
m=length(X); Z=zeros(1,m);
for i=1:n
    Y=lagrange(X,XDATA,i);
    Z=Z+DATA(2,i).*Y;
end
flops
plot(X,Z,'k',DATA(1,:),DATA(2,:),'r*')
axis([0,6,-5,30])
grid on
%Y=lagrange(X,XDATA,6);
%plot(X,Y,'b',DATA(1,:),zeros(1,n),'r*')
%axis([0,6,-2,2])
%grid on

LAGRANGE  BASIS FUNCTIONS

function Y = lagrange(X,XDATA;i)
%this function calculated the ith lagrange polynomial determined by the
%XDATA and return the y-values for the x-values in X
nn=length(XDATA); m=length(X);
Y=ones(1,m);
for k = 1:nn
    if k ~= i
        Y=Y.*(X - XDATA(k))./(XDATA(i)-XDATA(k));
    end
end