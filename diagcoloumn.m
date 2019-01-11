clc;
format long;
disp('Coloum Analys');
disp(' please insert information of materials and etc...');
disp('       Important: your section is not Circular it is a h*b section');
fc  =input(' fc=? ');
fy  =input(' fy=? ');
h   =input(' h=? ');
b   =input(' b=? ');
d   =input(' d1=? '); 
d2  =input(' d2? ');
as3 =input('Diameter of As tention? ');
n3  =input('number of AS tention? ');
as4 =input('Diameter of As comprestion? ');
n4  =input('number of As copmresstion? ');
%e   =input('e? ');
%------------------------------------------------------------------
 tic;
i=1;
disp('please Wait');
while i<=3
    
         pause(1);
         
         if floor(toc)==i
             disp(i);
             
         
         end;
         i=i+1;
end;



%======================================================================
 disp('solving Balans...');
 
disp('********RESULTs*********'); 
pause(1);


as1  = (as3)^2* 0.25* 3.1416 * n3;  

as2  = (as4)^2* 0.25* 3.1416* n4;

d3   = 0.5*h - d2; 

xb   = ((6000)/(6000+fy) )*d ;

ab   = 0.85*xb;

epsilonst     = ((0.003)*(xb - d2))/xb;

fstb         =  epsilonst* 2000000;

if epsilonst>=.002
    
    fstb = fy;
    
end;

po = .85*b*h*fc + as1*fy + as2*fy;

disp ('po==='); pause(1); disp(floor(po));

pnb   = 0.85*fc*b* ab+ as2*fstb- as1*fy;

disp('pnb==='); pause(1);  disp(floor(pnb));
disp('Mnb for imported e =='); disp(floor(pnb*e));

e2    = (0.85 * fc * b* ab*(d- 0.5*ab)+ as2* fstb*(d-d2))/pnb ;

eb    = e2-d3 ; disp('eb==='); disp(floor(eb));

disp('eb===');  disp(floor(eb));

e=0;

diag1=(1:floor(8*h));
diag2=(1:floor(8*h));
q=1;

for e = 0 : 20 : floor(7*h)
    
if e> 5000
    k=15000;
end;
if e<=5000
    k=5000;
end;

if e == floor(eb)
    disp('your e is eb!!!');
end;



if  0<= e <= eb 
    
    e2=e+d3;    
    



pn = (0.85* fc* b*h*(d-(h/2))+ as2*(d-d2))/e2;

fs = pn - (0.85*fc*b*h + as2*fy) ;

if fs>=0
    
    disp('*****************************');
    disp('e =='); disp(floor(e));
    disp('Pn for imported e =='); disp(floor(pn));
    disp('Mn for imported e =='); disp(floor(pn*e));
    disp('*****************************');
end;

if fs<0
    
    
    for a= 0 : 0.001 : k
        
        pn= 0.85* fc*b*a+ as2*fy- as1*6000*((d-a/0.85)/(a/0.85));
        e4 = (0.85*fc*b*a*(d-a/2)+ as2*fy*(d-d2))/pn;
        if abs(e4-e2) <= 0.5
            break
        end;
        
    end;
    
end;

    disp('*****************************');
    disp('e =='); disp(floor(e));
    disp('Pn for imported e =='); disp(floor(pn));
    disp('Mn for imported e =='); disp(floor(pn*e));
    disp('*****************************');
    
diag1(1,q)=pn;
diag2(1,q)= e*pn;
end;


if e>=eb
    
    e5= e + 0.5*h - d2 ;
    
    
      
    for xxx = (0.5*h): 0.1 : k  
        
        a= 0.85*xxx ;
        epsilonst = ((0.003)*(xxx - d2))/xxx;
    fst3=  epsilonst* 2000000;
    
      if epsilonst >= 0.002
          fst3 = fy;
      end;
    
        pn  = (0.85*fc*b*a*(d-(a/2)))+ as2*fst3*( d - d2)/(e5);
        
        pnreal=((as2*fst3+as1*fy)*(0.5*h-d2)+0.85*fc*b*a)/e - pn;
    
         if floor(pnreal)==0;
             
           
           disp('*****************************');
           disp('e =='); disp(floor(e));
           disp('Pn for imported e =='); disp(floor(pn));
           disp('Mn for imported e =='); disp(floor(pn*e));
           disp('*****************************');
        
         end;
    end;
    
    diag1(1,q)=pn;
    diag2(1,q)= e*pn;
end;

q=q+1;

end;
pp=(as1/b*h);
Mn= 0.85*b*h*0.9*d;
disp('Mn'); disp(floor(Mn));

