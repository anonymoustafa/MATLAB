clear danal
ci = 100;
U = 0.4628;
E = 2.2e-2; %fischer(b,y,0,sss,q,u)
k = 0;
mmm=30; %meters
et = k*E/(U^2);
L = sqrt(1+4*et);
ttt= mmm / U ; % seconds
tay= 10;%seconds 
sss = .001488;
Length=30; %meters
nnnt= floor(ttt)+1;
stpx = 1 ; % tanzime ba dx baray plot kardan shavad
stpt = 0.04 ; % tanzime ba dt baray plot kardan shavad
q = 0.00833; %m3
b = 0.5; %meter
y = 0.09;%meter
a = b * y;
danal = zeros(nnnt/stpt,Length/stpx);
for t = tay : stpt :nnnt;
for x = 1 :stpx: Length
danal(t,x) = ci.*0.5.*(exp(U.*x.*(1-L)./(2.*E)).*(erfc((x-U.*t.*L)./(2.*sqrt(E.*t)))-erfc((x-U.*(t-tay).*L)/(2.*sqrt(E.*(t-tay)))))+exp(U.*x.*(1+L)./(2.*E)).*(erfc((x+U.*t.*L)./(2.*sqrt(E.*t)))-erfc((x+U.*(t-tay).*L)/(2.*sqrt(E.*(t-tay))))));
end
end
danal = danal';
[n,m] = size (danal);
cpa  = zeros(min(m,n),1);

for i = 1 : Length/stpx
          cpa(i,1)  = max(danal(i,:));
end 
cta = zeros(max(m,n),1);
for i = 1 : nnnt/stpt
          cta(i,1)  = max(danal(:,i));
end 
