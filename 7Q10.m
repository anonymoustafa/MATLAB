%  statistical method

days    = input('please paste flows data here');
n		= floor(days/7);
targets = zeros(1,n);
for i=1:(n-1)*7
targets(1,i)= mean(days(1,i:i+7));
end
min(targets)
