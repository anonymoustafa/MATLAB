clear canal
mp = 10; %grams
Length =1000; %meters

sss = .00001;
stpx = 1 ; % tanzime ba dx baray plot kardan shavad
stpt = 1 ; % tanzime ba dt baray plot kardan shavad
q = 1; %m3
b = 2; %meter
y = 1;%meter
a = b * y;

u = 0.5;
ttt= (Length/u)/3600; % hours
t = 1 : 1 :ttt*3600;
lcdd = fischer(b,y,0,sss,q,u);
k = 0;
canal = zeros(1,Length);
for t = 1 : ttt*3600
for x = 1 : Length
canal(t,x) = (mp ./ (2.* sqrt(pi .* lcdd .* t )) ) .* exp(-1 .* (((x-(u.*t)).^2)/(4.*lcdd.*t))-(k.*t));
end 
end
canal = canal';
cp2 = 0 .* canal;

for i = 1 : x
          cp2(i,1)  = max(canal(i,:));
end 
