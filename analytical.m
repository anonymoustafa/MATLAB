clear canal
mp = 1000; %grams
Length=100; %meters
ttt= 0.055555556; % hours
nnnt= floor(ttt*3600);
sss = 0.00001;
stpx = 1 ; % tanzime ba dx baray plot kardan shavad
stpt = 1 ; % tanzime ba dt baray plot kardan shavad
q = 1; %m3
b = 4; %meter
y = 0.5;%meter
a = b * y;
u = Length/(nnnt);
lcdd = fischer(b,y,0,sss,q,u);
k = 1.00E-04;
canal = zeros(nnnt/stpt,Length/stpx);
for t = 1 : stpt :nnnt;
for x = 1 :stpx: Length
canal(t,x) = (mp ./ (2.* sqrt(pi .* lcdd .* t )) ) .* exp(-1 .* (((x-(u.*t)).^2)/(4.*lcdd.*t))-(k.*t));
end
end
canal = canal';
[n,m] = size (canal);
cpa  = zeros(min(m,n),1);

for i = 1 : Length/stpx
          cpa(i,1)  = max(canal(i,:));
end 
