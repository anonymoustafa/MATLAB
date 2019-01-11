clc
format long;
disp('Tekrar sadeh ');
N= input ('N? ');
i=1;
x= (1:i);
for i= 1:N
    
    x(1,i)= input ('x? ');
    a = sin(x(1,i))+sqrt(1/(x(1,i))^2);
    
end;

for i= 1:N
    disp (sin(x(1,i))+sqrt(1/(x(1,i))^2)) ;
end;
            

