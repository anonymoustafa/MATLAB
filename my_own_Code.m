clc;clear;
%% IN THE NAME OF ALLAH
start='In The Name of Allah,\n The Most Beneficent,\n The Most Merciful';
fprintf('In The Name of Allah,\n The Most Beneficent,\n The Most Merciful \n' );
%pause(3);
%% Propertise of SYSTEM
filename        = input('\n \n \n \n whats your excel file name? ','s');
Length_River    = xlsread(filename, 'Reach Propertise','c2:c2');
delta_X         = xlsread(filename, 'Reach Propertise','G2:G100');
sec_changes     = xlsread(filename, 'Reach Propertise','A2:A100');
disscharge_mass = xlsread(filename, 'Point Load', 'B2:B1000');
segment_num     = length(delta_X);
c0              = zeros(segment_num);
vol_segment     = zeros(segment_num,1);
Area_segment    = zeros(segment_num,1);

flow_Q          = xlsread(filename, 'Reach Propertise','H2:H100');
disscharge_Time = xlsread(filename, 'Point Load', 'C2:C1000');
fprintf('you Gonna have %d segments ', segment_num );
fprintf('Are YOU Ready? there we go...! '); pause(0.9);


%%  LDC computation
   % flow_Q     =  input('Flow of System is needed m3/hr ');
   length_L   =  xlsread(filename, 'Reach Propertise','g2:g100');
   b          =  xlsread(filename, 'Reach Propertise','d2:d100');
   y          =  xlsread(filename, 'Reach Propertise','e2:e100');
   s          =  xlsread(filename, 'Reach Propertise','i2:i100');
   z          =  xlsread(filename, 'Reach Propertise','f2:f100');
   
   for i=1:1:segment_num
    
      Area_segment(i,1) =  (b(i,1) + z(i,1) * y(i,1)) * y(i,1);
      vol_segment(i,1) = delta_X(i,1) * Area_segment(i,1);
      
   end
clear i;
    xlswrite(filename,vol_segment,'Reach Propertise','Q2:Q100');
    xlswrite(filename,Area_segment,'Reach Propertise','R2:R100');
    
    % defining LDC 
    LDC1 = zeros(segment_num,1);
    LDC2 = zeros(segment_num,1);
    LDC3 = zeros(segment_num,1);
    LDC4 = zeros(segment_num,1);
    LDC5 = zeros(segment_num,1);
    LDC6 = zeros(segment_num,1);
    
    % defining LDC Prime
    LDC_Prime1 = zeros(segment_num,1);
    LDC_Prime2 = zeros(segment_num,1);
    LDC_Prime3 = zeros(segment_num,1);
    LDC_Prime4 = zeros(segment_num,1);
    LDC_Prime5 = zeros(segment_num,1);
    LDC_Prime6 = zeros(segment_num,1);
    
   % n    = floor(xlsread('c.xlsx', 'Reach Propertise','c2:c2')/delta_X)+1;
    
    for i = 1:1:segment_num
        LDC1(i,1) = fischer(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1))    ;
        LDC2(i,1) = seo(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1))        ;
        LDC3(i,1) = deng(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1))       ;
        LDC4(i,1) = kashefipour(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1));
        LDC5(i,1) = rajeev(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1))     ;
        LDC6(i,1) = jhang(b(i,1),y(i,1),z(i,1),s(i,1),flow_Q(i,1))      ;
    end
    xlswrite(filename,LDC1,'Reach Propertise','j2:j100');
    xlswrite(filename,LDC2,'Reach Propertise','k2:k100');
    xlswrite(filename,LDC3,'Reach Propertise','l2:l100');
    xlswrite(filename,LDC4,'Reach Propertise','m2:m100');
    xlswrite(filename,LDC5,'Reach Propertise','n2:n100');
    xlswrite(filename,LDC6,'Reach Propertise','o2:o100');
    clear n i;
    
   for i=1:1:segment_num 
        LDC_Prime1(i,1) = (LDC1(i,1)*Area_segment(i,1))/delta_X(i,1);
        LDC_Prime2(i,1) = (LDC2(i,1)*Area_segment(i,1))/delta_X(i,1);
        LDC_Prime3(i,1) = (LDC3(i,1)*Area_segment(i,1))/delta_X(i,1);
        LDC_Prime4(i,1) = (LDC4(i,1)*Area_segment(i,1))/delta_X(i,1);
        LDC_Prime5(i,1) = (LDC5(i,1)*Area_segment(i,1))/delta_X(i,1);
        LDC_Prime6(i,1) = (LDC6(i,1)*Area_segment(i,1))/delta_X(i,1);
   end
    clear i;
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

if     LCD_num == 1
        LCD0 = LDC_Prime1;
elseif LCD_num == 2
        LCD0 = LDC_Prime2;
elseif LCD_num == 3
        LCD0 = LDC_Prime3;
elseif LCD_num == 4
        LCD0 = LDC_Prime4;
elseif LCD_num == 5
        LCD0 = LDC_Prime5;
elseif LCD_num == 6
        LCD0 = LDC_Prime6;
end 


%% numerical Code
Alpha = 0.5 ; Betha = 1 - Alpha;
delta_T = zeros(length(delta_X),1);
for i = 1:1:segment_num
    delta_T(i,1) = 0.5 * (delta_X(i,1) ^ 2) * LCD0(i,1);
end
clear i;

%% boundry condition, Mass Discharge

boundry_condition = floor(disscharge_Time/delta_T(1,1)) + 1;

if boundry_condition >= segment_num
    boundry_condition = segment_num;
end

for i=1:1:boundry_condition
    c0(i,1) = disscharge_mass(1,1) / flow_Q(i,1);
end
clear i;
 

%% main solver



for t = 1 : 1: segment_num-1
         
     for x = 2 : 1 : segment_num-1
             
       c0(t+1,x) = ...
       ((disscharge_mass(x,1) * delta_T(x,1)) / vol_segment(x,1)) - ...
       (delta_T(x,1)/vol_segment(x,1))*(-1*flow_Q(x,1)*Alpha-LCD0(x-1,1))*c0(t,x-1) ...
      +(1-(delta_T(x,1)/vol_segment(x,1))*(-1*flow_Q(x,1)*Betha+flow_Q(x,1)*Alpha+LCD0(x-1,1)+LCD0(x,1))*c0(t,x)...
      -(delta_T(x,1)/vol_segment(x,1))*(flow_Q(x,1)*Betha-LCD0(x,1))*c0(t,x+1));
                
         
      end
end
xlswrite('c.xlsx',c0,'result');
plot((1:99),c0(end,:))