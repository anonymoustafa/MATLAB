M = xlsread('mehrnaz.xlsx','c2:fxx72');
[m,n] = size(M);
% m is small 
% n is big
o = m * 30 ;
T = zeros(o,n);
for i = 0:m
    if i ==0
        T(1,:)=M(1,:);
    else
        T(i*30,:) = M(i,:);
    end
 end
for i = 1 : m-1

    
    for j = 1 : 30
        
       T(i*30+j,:) = ((30-j).*M(i,:)+(j).*M(i+1,:))./30; 
        
        
    end
    
    
    
    
end