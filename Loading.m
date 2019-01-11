clc;
%Loading for Structures
disp('***This Program Calculus the Loading of panels ==> kg & m <==***');
panels=input('How many panels do you have? ');
for i=1:panels
panel(1,i)=i;
end;
for i= 1:1: panels
    
    disp('***panel detail***');
    w=         input('insert Width of panel ');
    l=         input('insert Length of panel ');
    t1=input('pls insert the Width of Transverse beem ');
    t2=input('pls insert the Width of Longitudinal beem ');
    details=   input('how many layers does it have? ');
    
    for j=1:details
        disp('***weight pls***');
        a(1,j)=input('kg/m^3:  ');
        b(1,j)=input('thickness? insert in centimeters: ');
        c(1,j)= a(1,j)*b(1,j)*0.01;
    end;
    
    Area=((l+t1)*(w+t2));
    ccc= ((l*w)/Area)*(l*w);
    Load=sum(c);
    AreaLoad(1,i)=(sum(c)/ccc);
    clear('c');clear('a');clear('b');
end;
    
for i= 1:panels
   
    disp(AreaLoad(1,i));
end;