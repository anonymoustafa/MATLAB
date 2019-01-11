%% WATUM version 001
% this is environment engineering faculty of
% tehran university's first water quality model.
% developed by Mostafa Ramezani 
% master of environment Engineering grduated
% email: Ramezani.M@ut.ac.ir
tic         ;
clc         ;
clear       ;
format short;
developersite='<a href = "https://www.linkedin.com/in/mramezani">Developer address</a>';
disp(developersite); 
cd 'C:\Users\Mostafa Ramezani\Dropbox\MATLAB'     ;
   %% determining if the system is whether SS or not?   
steady_state =input('is it steady state or not? type "yes" if it is SS and type "no" in case of time variable state ' ,'s');
if  strcmp(steady_state,'yes')==1 %we use strcmp to compare strings
      %% ask for River Propertise.
   flow_Q     =  input('Flow of System is needed m3/hr ');
   length_L   =  input('Lenght of river is needed m ');
   b          =  input('bottom of river is needed m ');
   y          =  input('depth of river is needed m ');
   s          =  input('Slope of river is needed DimLess ');
   z          =  input('slope of side of river is needed DimLess ');
   reach_num  =  input('River will Devide to N parts. isert a value between 5 to 1000 ' );
     %% ask for Loading propertise.
%   loading_num=  input('How Many Point Sources Disscharge exist? DimLess ');
%   for j=1:1:loading_num
       
   decay_K    =  input('the rate of extinction of pollutant 1/hr ');
   initial_C  =  input('Initial Pollutant concentration mgr/Lit ');
%   discharge  =  input('Point Source Loading Flow ' );
     %% river and loading calculations.
   A          =  zeros(reach_num);
   flow       =  flow_Q;
   vol_reach  =  (length_L*(b+z*y)*y)/(reach_num);
   
   
    %% chossing LDC
    
    disp('you can chosse your desired LDC by the List which is shown below');
    disp('pleas insert the number which assigned to your favorite LDC');
    disp(' (1) Fischer 1975'                );
    disp(' (2) Seo & Cheong 1998'           );
    disp(' (3) Deng 2001'                   );
    disp(' (4) Kashefipour & Falconer 2002' );
    disp(' (5) Rajeev and Dutta 2009'       );
    disp(' (6) Jhang 2015'                  );
    disp(' (7) Qiasi  2015 '                );
    LCD_num = input('Enter a number: ');
if LCD_num==1
        LCD = fischer(b,y,z,s,flow          );
elseif LCD_num==2
        LCD = seo(b,y,z,s,flow              );
elseif LCD_num==3
        LCD = deng(b,y,z,s,flow             );
elseif LCD_num==4
        LCD = kashefipour(b,y,z,s,flow      );
elseif LCD_num==5
        LCD = rajeev(b,y,z,s,flow           );
elseif LCD_num==6
        LCD = jhang(b,y,z,s,flow            );
else   
        LCD = qiasi(b,y,z,s,flow            );
end 
    
LDC2=LCD;
LDC3=LDC2;
   %% making the propertise matrix of river.
       A(1,1)=  flow_Q + LDC2;
       A(1,2)=  -LDC2      ;
   for i=2:1:reach_num
   %    if i-1 == 0 || i >= reach_num
           
   %        LCD2 = 0   ;
           
   %    else
           
   %        LCD2 = LCD3;
           
   %end

       A(i,i-1)= -1*flow ;
       A(i,i  )= flow + LDC2 + decay_K * vol_reach;
       A(i,i+1)= -LDC2;
 
   end
   
else
    disp('this part is our next milestone... please wait!')
end
%% making the main sys propertise 
   B = A ;
   %matrice_A(1,:) =  []      ;
   %matrice_A(reach_num,:)=[] ;
   %matrice_A(:,1) =  []      ;
   B(:,reach_num+1)=[] ;
   %A       =    matrice_A    ;
   
fprintf('your total session takes %d seconds \n',floor(toc));
disp('press any key to continue');pause;
edit watum.m;