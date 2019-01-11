clc;
howmany =input('how many erth quake matrix do you have? ');
Z=input('Zeta? ') ;
M=input('mass ? ') ;
dT=input('Delta time ? ') ;
bbb = 0.1 : .1 : 6.6;
p=numel(bbb);

Deff1 =[ 1:p ;1:p ;1:p ];
%-----------------------------------------------------------

clc;

for bar = 1:1:3
    
    
    
matrix= input('matrix please... ');
PGA= input('PGA pls? ');
dT=input('Delta time ? ') ;

[n,m]=size(matrix);

% **************?????? ??? ?????*****************    
j=1;

 for v = 1:m
 for i = 1:n
    
    k(1,j)= matrix(i,v);
    j=j+1;
end;

 end;

jjj=1;


k=((0.25)/PGA)*k;

for Tn = 0.1 : .1 : 6.6
 
     
   
% ???? ???? ?? ?????? ?? ????.

omega =(2*pi)/(Tn);
K =(omega^2)*M;
sizeofmat =numel(matrix);


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
            u1=abs(u1);
            Deff1(bar,jjj)=max(max(u1));
              jjj=jjj+1;
  
end;
end;
          
deflection=[1:p];
for bar= 1 :1 :p
     deflection(1,bar) = 0.33*(Deff1(1,bar)+Deff1(1,bar)+Deff1(1,bar));
    
end;
iii=numel(deflection);
for nnn=1:1:numel(deflection)
    deff2(1,iii)=deflection(1,nnn);
    iii=iii-1;
end;
plot(bbb,deff2);     