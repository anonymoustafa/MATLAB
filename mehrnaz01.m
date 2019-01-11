% Author email: Ramezani.M@ut.ac.ir
% to use this piece of code, first put all of you need to have MATLAB installed on your system.
% then save results in an excel file sheet then save as the file in the following path:
% "C:\Users\pc_user_name\Documents\MATLAB" 
% you have to put this file ("POD_Maker.m") and your excel file both in that path. 
% then run the code. 
% Contact the Author in case of any problem.
% POD is a method to handel BIG data.


clc; clear;
filename = input ('please type excel file ','s');
M = xlsread(filename,'Main');
a = M' * M;
[n_g , n_t] = size (M);
b = a ./ n_t ;
[c , d] = eig (b);

dp = zeros(length(d));

for i = 1 : length(d)
    
        dp(i,i) = d(length(d)-i+1,length(d)-i+1);
    
end

cp = zeros(length(c));

for i = 1 : length(c)
    
        cp(:,i) = c(:,length(c)-i+1);
    
end

e = M*cp;

en = zeros(size(M));
[en_i , en_j] = size(M);

for i = 1 : en_i
    for     j = 1: en_j
        
        en (i,j ) = e(i,j) / (sqrt(n_t*dp(j,j)))   ;
        
    end
end

f = M' * en;


% enp = 0 .* en ;
% [y1,x1] = size(en);
% for i = 1 : x1
%     
%         enp(:,i) = en(:,x1-i+1);
%     
% end
% en = enp;

%f = M' * en;
ff = f';
g = en * ff;

xlswrite(filename,g,'g1');

How_Many = input('how many SnapShot are you going to calc? ');

eee = zeros(How_Many,n_t);
eeee = zeros(1,n_t);
eeeee = zeros(n_g,1);
for k = 1 : How_Many
    
    i = input('What SnapShot number you want to calculate now? ');
    
    clear g
    clear q
    clear w
    q = en(1:end,1:i);
    w = ff(1:i,1:end);
    g = q * w ;
    xlswrite(filename,g,num2str(i))
    
    for x = 1 : n_t
    for y = 1 : n_g

        eeeee(n_g,1) = (( M(y,x) - g(y,x) ).^2)./((M(y,x)).^2);
        
    end
    
    eeee(1,x)=(sum(eeeee));
    
    end
    
    eee(k,:)=sqrt(eeee);
    
end

xlswrite(filename,eee,'Error');
% 
% for i = 30 : 10 : 100
%     clear g
%     clear q
%     clear w
%     q = en(1:end,1:i);
%     w = ff(1:i,1:end);
%     g = q * w ;
%     xlswrite(filename,g,num2str(i))
% end
% 
% for i = 110 : 100 : n_t
%     clear g
%     clear q
%     clear w
%     q = en(1:end,1:i);
%     w = ff(1:i,1:end);
%     g = q * w ;
%     xlswrite(filename,g,num2str(i))
% end