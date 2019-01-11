clc
clear all
an=0;
s1=0;
for i=1:5
    
    an= 1/factorial(i);
    s1=an+s1;
end;
disp(s1);