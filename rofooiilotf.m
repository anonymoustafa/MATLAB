
A  =0.87;
A2 =0.38;
B2 =0.8;
B  =0.31;
C  =0.4;
C2 =0.0005;
D  =1.4;
D2 =0.028;
pe(1,1)=0;
u1(1,1)=0;
u2(1,1)=0;
u3(1,1)=0;
t=0:0.0024:20.532;
jerm=0.5;

for i=1:8555
    
    
    pe(1,i+1)   = k(1,i)* jerm;
    
    u1(1,i+1)   = A*u1(1,i)+B*u2(1,i)+ C*pe(1,i)+D*pe(1,i+1);
    
    u2(1,1+i)   = A2*u1(1,i)+B2*u2(1,i)+ C2*pe(1,i)+D2*pe(1,i+1);
    
    u3(1,i+1)   = (u2(1,1+i)-u2(1,i))/0.0024;
    
    
end;


plot(t,u3);

    
    