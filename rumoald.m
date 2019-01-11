clc, clear  ;
input(' Hit Enter ');
tic;
M = 1000    ;
u  = 1      ;
dt = 0.01    ;
dx = 1      ;
tet = 0.5   ;
eta = 0.9   ;

co = zeros(M);
co(1,1) = 100;

%xx = -5: 0.1 : 5 ;
%co( 1 , : ) = [normpdf(xx,0,1) .* 2.5 , zeros(1,length(co(2,:))-length(xx))];
cp = zeros(1,M);

D = fischer(1,1,0,0.00001,1,u);
ca = u * dt / dx ;
cd = (D * dt)/(dx^2);

A = zeros(M);
R = zeros(M,1);

a = tet * (-eta*ca-cd);
b = 1 + tet * ( ca * (2*eta-1)+2*cd);
c = tet*(ca*(1-eta)-cd);



A(1,1) = 1 ; 
A(1,2) = 0 ;

A(M,M-1) = 0 ;
A(M,M)   = 1 ;

peclet = ca/cd
pause()

for i = 2 : M-1
    
    A(i,i-1)=  a ;
    A(i,i) =   b ;
    A(i,i+1)=  c ;
    
end

R(1,1) = 0;
R(M,1) = 0;

for n = 1 : M -1
    
    for j = 2 : M - 1
        R(j,1) = co(n,j) - ca * (1 - tet) * (-eta * co(n,j-1) + (2*eta-1)*co(n,j) + (1-eta)*co(n,j+1)) - cd * (1-eta) * (co(n,j-1) - 2*co(n,j) + co(n,j+1));
    end
    
    co (:,n) = A \ R;
    %pause()
    %plot( co (:,n))
    %hold on
    cp(n) = max (co (:,n));
    
end



fprintf('time is= %6.4g' , toc)