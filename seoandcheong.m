%% first paper
clearvars ;
clc;
%% River Properstise
Q=2.*ones(1,4000)              ;
Velocity=ones(1,4000)          ;
A=2.*ones(1,4000)              ;
deptofriver=ones(1,4000)       ;
widthofriver=ones(1,4000)      ;
deptofriver(1:1000)=1          ;
deptofriver(1001:2000)=.8      ;
deptofriver(2001:3000)=.66     ;
deptofriver(3001:4000)=.5      ; 
widthofriver(1:1000)=2         ;
widthofriver(1001:2000)=2.5    ;
widthofriver(2001:3000)=3      ;
widthofriver(3001:4000)=4      ;

EGSlope=16/1000;
Ustar=(9.81*(deptofriver.*EGSlope)).^.5;

D=5.195*(((Velocity.^2).*(widthofriver.^2))./(deptofriver.*Ustar)); % D is seo

xn=length(A)            ;
Dx=10                   ;       
dx=5                    ;
X=1:xn;xi=1:dx/Dx:xn    ;
A=interp1(X,A,xi)       ;
D=interp1(X,D,xi)       ;
Velocity=interp1(X,Velocity,xi)       ;
Q=interp1(X,Q,xi)       ;
T=3600                  ;

%% stability limit
Amax=max(A); Amin=min(A);  Dmax=max(D);
dt=(1/8)*(Amin/((2*Dmax*Amax/dx^2 )));     
tn=round(T/dt);
Tdisscharge=3600;                        %seconds

%%Forward concentration
M=2;                                     %Kg
C=zeros(tn+1,xn);
Cin=M/Q(1);
C(1:round(Tdisscharge/dt),1)=Cin;

for t=1:tn
    
    for x=2:xn
        Dnu=+dt*Velocity(x)^2/2;
        if x==xn
            C(t+1,x)=C(t+1,x-1);
        elseif x==2

            C(t+1,x)=((D(x-1)+Dnu)*C(t+1,x-1)/dx)/(Velocity(x-1)+(Dnu+D(x-1))/dx);
           % C(t,x+1)=C(t,x)*dx*V(x)/D(x)+C(t,x);
        else
            p=-Q(x)*dt/(2*dx)+dt*((D(x+1)+D(x))/2+Dnu)*((A(x+1)+A(x))/2)/dx^2;
            q=-((D(x+1)+D(x))/2+Dnu)*((A(x+1)+A(x))/2)*dt/dx^2-((D(x-1)+D(x))/2+Dnu)*((A(x-1)+A(x))/2)*dt/dx^2+A(x);     
            r=Q(x)*dt/(2*dx)+dt*((D(x-1)+D(x))/2+Dnu)*((A(x-1)+A(x))/2)/dx^2;
            
            C(t+1,x)= (p*C(t,x+1)+ q*C(t,x)+ r*C(t,x-1))/A(x);
        end
    end
    disp(t);
end

%x=dx.*[1:length(Q)]; %#ok
x=dx.*[1:length(C)]; %#ok
Cestimate=C(end,:);
plot(x,Cestimate);

