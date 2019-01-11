clc , clear ;
length_river = 1000;
delta_X      = 1;
decay        = 0.001 ;
q            = 1 ;
b            = 2 ;
y            = 3 ;
z            = 0 ;
s            = 1/6000;
A            = b*y ;
u            = q/A ;
vol          = A*delta_X;
Alpha        = 1; 
Betha        = 1 - Alpha ;
%% LDC maker
% chossing LDC
    
    disp('you can chosse your desired LDC by the List which is shown below');
    disp('pleas insert the number which is assigned to your desiered LDC');
    disp(' (1) Fischer 1975'                );
    disp(' (2) Seo & Cheong 1998'           );
    disp(' (3) Deng 2001'                   );
    disp(' (4) Kashefipour & Falconer 2002' );
    disp(' (5) Rajeev and Dutta 2009'       );
    disp(' (6) Jhang 2015'                  );
    disp(' (7) Qiasi  2015 '                );
    
       LCD_num = input('Enter a number: ');
      filename = input('and gimme a filename to save your work ','s');

if     LCD_num == 1
        LCD0 = fischer(b,y,z,s,q) ;
elseif LCD_num == 2
        LCD0 = seo(b,y,z,s,q) ;
elseif LCD_num == 3
        LCD0 = deng(b,y,z,s,q) ;
elseif LCD_num == 4
        LCD0 = kashefipour(b,y,z,s,q) ;
elseif LCD_num == 5
        LCD0 = rajeev(b,y,z,s,q) ;
elseif LCD_num == 6
        LCD0 = jhang(b,y,z,s,q) ;
end 

epr          = LCD0*A/delta_X  ;

%end LDC maker

total_time   = floor(length_river/u)+1 ;
delta_T      = ((delta_X ^ 2) / (( u * delta_X * (Alpha - Betha) + 2 * LCD0 + decay * delta_X^2)));%delta_X/u;%
nT           = floor(total_time/delta_T)+1;
nX           = floor(length_river/delta_X)+1;
c0           = zeros(nT,nX);
Cou_Num       = u*delta_T/delta_X; 
Landa        = (LCD0*delta_T)/(delta_X^2);

%%initial Condition
c1           = c0      ;
bound        = -10:11;

    for i=1:1:length(bound)
        c0(1,i) = gaussmf(bound(1,i),[1 0]); % 0;%
        c0(2,i) = gaussmf(bound(1,i),[1 0]); % 0;%
    end
    
%%Boundary      
c0(:,1)      = 0       ;

%Load
wi           = 0.*c0   ; 

% materila for saveing the results
 
c2           = c0      ;
c3           = c0      ;
c4           = c0      ;
mp           = 1/.746 ;
etha         = decay*LCD0/(u^2);
%% inform user
if etha > 1 
   disp('Diffusion predominates')
elseif etha <=1
    disp('Advection predominates')
end
formatSpec = '  Total Time number is %8.1f \n  nT number is %8.1f \n  nX number is %8.1f \n  Courant Number is %8.1f \n  Landa is %8.5f \n  delta_T is %8.2f \n  delta_X is %8.1f \n  E is %8.3f \n  E'' is %8.3f \n  Press any key to continue';
fprintf(formatSpec,total_time,nT,nX,Cou_Num,Landa,delta_T,delta_X,LCD0,epr)
pause()
%% main solver
tic
for t = 2 : 1 : nT -1
      for x = 2 : 1 : nX -1
          
          c0(t+1,x) = wi(t,x)*delta_T/vol - delta_T*(-q*Alpha-epr)*c0(t,x-1)/vol + (1-(delta_T/vol)*(-1*q*Betha+q*Alpha+2*epr+ decay*vol))*c0(t,x) - delta_T*(q*Betha-epr)*c0(t,x+1)/vol ;%page 215 Chapra
          %c1(t+1,x) = Landa*c1(t,x-1) + (1-2*Landa)*c1(t,x) + Landa*c1(t,x+1);
          c1(t,x)   = ( mp / ( 2 * sqrt( pi * LCD0 * t))) * exp ( -1 * ((x - u * t )^2)/(4 * LCD0 * t) - (decay * t));    
          %c0(t+1,x)   = ((u*delta_T)/(delta_X))*c0(t,x-1) + (1-u*delta_T/delta_X)*c0(t,x); %montazeri
          %c00(t, x)   = (((-1 * U * delta_T) / (2 * delta_X)) - ( (LCD0 * delta_T)/(delta_X^2)))*c00(t+1,x-1) + (1+ ((2*LCD0*delta_T)/(delta_X^2)) + decay*delta_T)*c00(t+1,x) + (((U*delta_T)/(2*delta_X)) - ((LCD0 * delta_T)/(delta_X^2)))*c00(t+1,x+1);
          %c000(t+1,x) = c000(t,x) + LCD0 * ((c000(t,x+1)-2*c000(t,x)+c000(t,x-1))*delta_T)/(delta_X^2) ;
     
      end
end
fprintf('\n  solver Time %8.1f ',toc)

%% presentation
   %  *****  %
    %  ***  %
    
steper = 25 ;
  %% statistics
    c_peak_anal = zeros(floor(nT/steper),1);
    c_peak_num  = c_peak_anal;
    
  for i = 1 :steper: nT   
      
      c_peak_anal(i,1) = max(c1(i,:));   
      c_peak_num(i,1)  = max(c0(i,:));
      
  end 
  
  fprintf('\n  statistics Time %8.1f ',toc)
  %% plotter

  hold on
  for i = 1 :steper: nX 
        hold on
        subplot(4,1,1);plot((1 : nX) ,c1(i,:))
        hold on
        subplot(4,1,2);plot((1 : nX) ,c0(i,:))
  end
   hold on
  for i = 1 :steper: nT
      clc
       fprintf('\n  progress percent %5.2f ', 100 * i/(nT))   
        hold on
        subplot(4,1,3);plot((1 : nT) ,c_peak_anal(i))
        hold on
        subplot(4,1,4);plot((1 : nT) ,c_peak_num(i))
  end
  
  fprintf('\n  plotter Time %8.1f ',toc)
  
 %% file generator
         
 %xlswrite(filename,c0, 'c_numeric' )
 %xlswrite(filename,c1, 'c_anal' )
 xlswrite ( filename, c_peak_anal, 'peak_anal' )
 xlswrite ( filename, c_peak_num, 'peak_num' )
 
 fprintf('\n  file generatoin Time %8.1f ',toc)