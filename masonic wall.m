clc;
disp ('Masonry Wall Analyzing for bending about weak axe');
disp('w = jerm makhsos divar kg/m^3 & t= zekhamat cm & sigma1 = keshesh & sigma2= khamesh mojaz & sigma3 = feshar kg/cm^2');
disp(' F=A*Bp*I*Wp');
a=input('A?');
bp=input('Bp?');
i= input('I?');
w= input('weight of wall?');
l=input(' lenght of wall?');
h=input(' Height of wall?');
t=input(' depth of wall?');
sigma1=('sigma1 keshesh?');
sigma3=('sigma3 feshar?');
disp('-------------------------------------------------');
wp     = 1*t*(0.5*h)*w;
fp     =a*bp*I*wp;
maxm   = ((fp/h)*l*l)/8;
sigma4 = (maxm*0.5*t)/((1/12)*100*t*t*t);

if sigma4 <= sigma1
    disp(' thickness of WALL is OK');
else while sigma4 >= sigma1
        t=t+1;
        wp     = 1*t*(0.5*h)*w;
        fp     =a*bp*I*wp;
        maxm   = ((fp/h)*l*l)/8;
        sigma4 = (maxm*0.5*t)/((1/12)*100*t*t*t);
        
    end;
end;
t2=floor(t);
disp( 'thickness should be=='); disp(t2);




