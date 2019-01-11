%
% Example 7.2-2, Crank-Nicolson method
%
Tn=[0 20 40 60 80 100];n=length(Tn);
n1=n-1;Tn1=Tn;
b=2.5*ones(1,n);
c=-0.25*ones(1,n);a=c;a(n)=2*a(n);
r=ones(1,n);
t=0;
fprintf('t = %8.1f, T = %8.2f %8.2f %8.2f %8.2f %8.2f %8.2f\n',t,Tn)
for k=1 : 10
  t=t+0.5;  
for i=2:n1;
    r(i)=0.25*Tn(i-1)+1.5*Tn(i)+0.25*Tn(i+1);
end
r(6)=0.5*Tn(n1)+1.5*Tn(n);
beta=c;gam=c;y=c;
beta(2)=b(2);gam(2)=r(2)/beta(2);
for i=3:n
    beta(i)=b(i)-a(i)*c(i-1)/beta(i-1);
    gam(i)=(r(i)-a(i)*gam(i-1))/beta(i);
end
Tn1(n)=gam(n);
for j=1:n1-1
    Tn1(n-j)=gam(n-j)-c(n-j)*Tn1(n-j+1)/beta(n-j);
end
Tn=Tn1;
  fprintf('t = %8.1f, T = %8.2f %8.2f %8.2f %8.2f %8.2f %8.2f\n',t,Tn)
end  
