clc;


Z=input('Zeta? ') ;
M=input('mass ? ') ;
K=input('stiffness ? ') ;
dT=input('Delta time ? ') ;
sizeofmat=input('lenth of mat? ');

Wn=(K/M)^0.5;
Wd= Wn*((1-Z^2)^0.5);
e=2.71828;

A=e^(-Z*Wn*dT)*((Z/((1-(Z^2))^0.5))*sin(Wd*dT)+cos(Wd*dT));
B=e^(-Z*Wn*dT)*(1/(Wd)*sin(Wd*dT));
C=(1/K)*[(2*Z/(Wn*dT))+e^(-Z*Wn*dT)*[(((1-2*Z^2)/(Wd*dT))-Z/((1-Z^2)^0.5))*sin(Wd*dT)-(1+(2*Z)/(Wn*dT))*cos(Wd*dT)]];
D=(1/K)*[1-(2*Z)/(Wn*dT)+e^(-Z*Wn*dT)*(((2*Z^2-1)/(Wd*dT))*sin(Wd*dT)+((2*Z)/(Wn*dT))*cos(Wd*dT))];
A2=-e^(-Z*Wn*dT)*(Wn/((1-Z^2)^0.5)*sin(Wd*dT));
B2= e^(-Z*Wn*dT)*(cos(Wd*dT)-(Z/((1-Z^2)^0.5))*sin(Wd*dT));
C2= (1/K)*[-1/dT+e^(-Z*Wn*dT)*[((Wn/((1-Z^2)^0.5))+Z/(dT*((1-Z^2)^0.5)))*sin(Wd*dT)+(1/dT)*cos(Wd*dT)]];
D2= (1/(K*dT))*[1-e^(-Z*Wn*dT)*((Z/(1-Z^2)^0.5)*sin(dT*Wd)+cos(Wd*dT))];



pe(1,1)=0;
u1(1,1)=0;
u2(1,1)=0;
u3(1,1)=0;
t=1:sizeofmat;

k(1,(sizeofmat))=0;

for i = 1:sizeofmat
    
    
    pe(1,i+1)   = k(1,i)*M;
    
    u1(1,i+1)   = A*u1(1,i)+B*u2(1,i)+ C*pe(1,i)+D*pe(1,i+1);
    
    u2(1,1+i)   = A2*u1(1,i)+B2*u2(1,i)+ C2*pe(1,i)+D2*pe(1,i+1);
    
    u3(1,i+1)   = (u2(1,1+i)-u2(1,i))/0.0024;
    
    
end;

t=1:(sizeofmat+1);


plot(t,u2);
plot(t,u1);   
plot(t,pe);    
plot(t,u3);