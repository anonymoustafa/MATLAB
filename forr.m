clc ;
clear all ;

syms f(x,n);
 f(x,n)= (-2/(n*pi))*((-1)^n)*sin(n*x);

u       = input('input the lower and upper boundry of n  ');
h       =0:0.1:12.5 ;
y       = 0:0.1:12.5 ;
sum1  =  zeros(1,length(h));
A        = zeros(1,length(h));

for y=0:0.1:4*pi
    for     i=1:(length(h))        
             for  j=1:u 
                 
                     A(1,j)=double(f(y,j));
                     
             end;    
            sum1(1,i)=double(sum(A));            
            %clear A;
    end;        
end;


plot(h,sum1);
