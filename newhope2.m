clc;
% lagrange plotting by "ZAHRA MOHAMMADI"
passkey = 91441203;
password=input('please insert the password:   ');
if password~=91441203
    exit
end;
clc;
clear;
disp(' ');
disp('Programmed By: lagrange plotting by "ZAHRA MOHAMMADI"');
disp(' ');

n=input('Enter the number of data points: ');
disp(' ');

x=zeros(n,1);
y=zeros(n,1);
for i=1:n
    x(i)=input(['Enter x' mat2str(i) ': ']);
    y(i)=input(['Enter y' mat2str(i) ': ']);
    disp(' ');
end

x1=min(x);
x2=max(x);
dx=x2-x1;

x1=x1-0.2*dx;
x2=x2+0.2*dx;
syms xxx yyy
xx=x1+(x2-x1)*(0:0.001:1);
yy=zeros(size(xx));
for k=1:numel(xx)
    L=ones(1,n);
    for i=1:n
        for j=1:n
            if j~=i
                L(i)=L(i)*(xx(k)-x(j))/(x(i)-x(j));
            end
        end

        yy(k)=yy(k)+y(i)*L(i);
    end
end
