clc ;
clear all ;


 %f(x,n)= (-2/(n*pi))*((-1)^n)*sin(n*x);

u       = input('input the lower and upper boundry of n  ');
h       =0:0.1:12.5 ;

sum1  =  zeros(1,length(h));
A        = zeros(1,length(h));


for y=0:0.1:4*pi
    for     i=1:1:(length(h))        
             for  j=1:u 
                 
                     A(j)=((-2/(j*pi))*((-1)^j)*(sin(j*y)));
                     
             end;    
             
            sum1(1,i)=sum(A);            
            %clear A;
    end;        
end;


plot(h,sum1);