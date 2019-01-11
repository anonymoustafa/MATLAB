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
 L=ones(1,n);
syms xx yy 
for i=1:n
        for j=1:n
            if j~=i
                L(i)=L(i)*(xx(k)-x(j))/(x(i)-x(j));
            end
        end
end
