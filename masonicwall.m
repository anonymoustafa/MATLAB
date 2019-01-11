clc;
disp ('input all parameters in meter');
disp('w = jerm makhsos divar kg/m^3 & t= zekhamat cm & sigma1 = keshesh & sigma2= khamesh mojaz & sigma3 = feshar kg/cm^2');
disp(' F=A*Bp*I*Wp');
a      =input('A?');
bp     =input('Bp?');
i      =input('I?');
w      =input('weight of wall? kg/m^3 ');
L      =input(' lenght of wall? m ');
h      =input(' Height of wall? m ');
t      =input(' depth of wall? m ');
sigma1 =input('sigma1 keshesh? kg/m^2 ');
sigma3 =input('sigma3 feshar? kg/m^2 ');
disp('-------------------------------------------------');
wp     = 1*t*h*w;
fp     =a*bp*i*wp;
maxm   = ((fp/h)*L*L)/8;
sigma4 = (maxm*0.5*t)/((1/12)*1*t*t*t);

if sigma4 <= sigma1
    disp(' thickness of WALL is OK');
    disp(t);
end;
if sigma4>=sigma1
    while sigma4 >= sigma1
        t      =t+0.1;
        wp     = 1*t*h*w;
        fp     =a*bp*i*wp;
        maxm   = ((fp/h)*L*L)/8;
        sigma4 = (maxm*0.5*t)/((1/12)*1*t*t*t);
        
    end;
        t2     =floor(t)+0.1 ;
disp( 'thickness should be==    in meter'); disp(t2);
end;





