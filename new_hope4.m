clc , clear ;
disp('You can leave two following statements blank')
filename = input('Type a file_name to  Load and save your work. ','s');
filepath = input('Where did you saved Watum files? type the folder address EXP : "C:\Users\Windows_User\Documents\Watum "','s');

if isempty(filename)==1
    filename = 'watum.xlsx' ; 
end

if isempty(filepath)==1
    [~,filepath,~] = xlsread(filename,'Setting','B6:B6'); % excel Address ; 
end

%% reading and loading needed data
[ ~,ProjName,~]  = xlsread(filename,'Setting','b2:b2');
stations_Locations = xlsread(filename,'Reach Propertise','o:o');
[number_of_stations,~] = size (stations_Locations );
RI_Length    = xlsread(filename,'Reach Propertise','J:J'); % Meters
RI_slope     = xlsread(filename,'Reach Propertise','H:H'); % dim less
RI_Flow      = xlsread(filename,'Reach Propertise','G:G'); % M3/sec
RI_width     = xlsread(filename,'Reach Propertise','D:D'); % Meters
RI_depth     = xlsread(filename,'Reach Propertise','E:E'); % Meters
RI_ZLeft     = xlsread(filename,'Reach Propertise','F:F'); % dim less
RI_ZRight    = xlsread(filename,'Reach Propertise','G:G'); % dim less
steper       = xlsread(filename,'Setting','B11:B11') ;
delta_X      = xlsread(filename,'Setting','B9:B9'); % Meters or Meter
new_RI_Length = length_river ./ delta_X ;

A            = RI_width .* RI_depth ;
u            = RI_Flow ./ A ;
vol          = A .* delta_X;
Alpha        = 1 ; 
Betha        = 1 - Alpha ;

%% Dividing
for i =  1 : number_of_stations 
    
    stations_Locations(i) 
    
length_river = sum (RI_Length) .* 1000 ; % Meters
delta_T      = ((delta_X ^ 2) / (( u * delta_X * (Alpha - Betha) + 2 * LCD0 + PLI_Decay * delta_X^2))); 

TX_Cells      = zeros(delta_T, new_RI_Length); % makes the main matrix


%% LDC maker
% chossing LDC
    %disp('.* is right');
    %disp('you can chosse your desired LDC by the List which is shown below');
    disp('In sheet "SETTING" in excel file, choose what Method you want, to calculate LDC ');
    disp(' (1) Fischer 1975'                );
    disp(' (2) Seo & Cheong 1998'           );
    disp(' (3) Deng 2001'                   );
    disp(' (4) Kashefipour & Falconer 2002' );
    disp(' (5) Rajeev and Dutta 2009'       );
    disp(' (6) Jhang 2015'                  );
    disp(' (7) Qiasi  2015 '                );
    disp(' (8) if you want study on a not dispersive model ' );
    
       [ndata, LCD_num , alldata] = xlsread(filename,'Setting','b10:b10');
      

if     strcmp(LCD_num,'(1) Fischer 1975') == 1
        LCD0 = fischer(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(2) Seo & Cheong 1998') == 1
        LCD0 = seo(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(3) Deng 2001') == 1
        LCD0 = deng(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(4) Kashefipour & Falconer 2002') == 1
        LCD0 = kashefipour(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(5) Rajeev and Dutta 2009') == 1
        LCD0 = rajeev(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(6) Jhang 2015') == 1
        LCD0 = jhang(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'(7) Qiasi  2015') == 1
        LCD0 = qiasi(RI_width,RI_depth,RI_ZLeft,RI_slope,RI_Flow) ;
elseif strcmp(LCD_num,'none (if you want study on a not dispersive model)') == 1
        LCD0 = 0 ;        
end 

epr          = LCD0*A/delta_X  ; % assign E' value
% Spread sheet Filler

% end LDC maker

%% time specification
total_time   = max(xlsread(filename,'Reach Propertise','N:N')) * 3600 ; % seconds
if isempty(total_time) == 1 
    total_time   = floor(length_river/u)+1 ;
end

nT           = floor(total_time/delta_T)+1;
nX           = floor(length_river/delta_X)+1;
c0           = zeros(nT,nX);
Cou_Num       = u*delta_T/delta_X; 
Landa        = (LCD0*delta_T)/(delta_X^2);

%% initial Condition
c1 = c0      ;
wi = 0 .* c0 ;


bound = -20:20  ;
start_of_loading = 500  ;
sol = start_of_loading   ;

    for i= 1+sol : length(c0)+sol
        
        wi(i,i) = rand ; 
    end
%% Boundary      
c0(:,1) = 0       ;

%% Loading
% Point Load
PLI_Decay    = xlsread(filename,'Point Load','D:D'); % [1/Seconds]
c0 = 0 .* c0 ;
PLI_Duration = 
% Diffusive Load

% matterial for saveing the results
           
c2 = c0 ;
c3 = c0 ;
c4 = c0 ;
mp = 1/.746 ;
etha = PLI_Decay*LCD0/(u^2);
%% inform user

if etha > 1 
   disp('Diffusion dominates')
elseif etha <=1
    disp('Advection dominates')
end
formatSpec = '  Total Time number is %8.1f \n   nT number is %8.1f \n  nX number is %8.1f \n  Courant Number is %8.1f \n  Landa is %8.5f \n  delta_T is %8.2f \n  delta_X is %8.1f \n  E is %8.3f \n  E'' is %8.3f \n  Press any key to continue';
fprintf(formatSpec,total_time,nT,nX,Cou_Num,Landa,delta_T,delta_X,LCD0,epr)

pause()

%% main solver

disp('press inter to start hydraulic sub-model')
pause()
tic

%% Quantity





fprintf('\n  Hydro sub-model is finished in: %8.1f seconds',toc)
%% Quality

for t = 2 : 1 : nT -1
      for x = 2 : 1 : nX -1
          
          c0(t+1,x) = wi(t,x)*delta_T/vol - delta_T*(-RI_Flow*Alpha-epr)*c0(t,x-1)/vol + (1-(delta_T/vol)*(-1*RI_Flow*Betha+RI_Flow*Alpha+2*epr+ PLI_Decay*vol))*c0(t,x) - delta_T*(RI_Flow*Betha-epr)*c0(t,x+1)/vol ;%page 215 Chapra
          %c1(t+1,x) = Landa*c1(t,x-1) + (1-2*Landa)*c1(t,x) + Landa*c1(t,x+1);
          %c1(t,x)   = ( mp / ( 2 * sqrt( pi * LCD0 * t))) * exp ( -1 * ((x - u * t )^2)/(4 * LCD0 * t) - (decay * t));    
          %c0(t+1,x)   = ((u*delta_T)/(delta_X))*c0(t,x-1) + (1-u*delta_T/delta_X)*c0(t,x); %montazeri
          %c00(t, x)   = (((-1 * U * delta_T) / (2 * delta_X)) - ( (LCD0 * delta_T)/(delta_X^2)))*c00(t+1,x-1) + (1+ ((2*LCD0*delta_T)/(delta_X^2)) + decay*delta_T)*c00(t+1,x) + (((U*delta_T)/(2*delta_X)) - ((LCD0 * delta_T)/(delta_X^2)))*c00(t+1,x+1);
          %c000(t+1,x) = c000(t,x) + LCD0 * ((c000(t,x+1)-2*c000(t,x)+c000(t,x-1))*delta_T)/(delta_X^2) ;
     
      end
end
fprintf('\n  solver Time %8.1f ',toc)

%% presentation
disp(ProjName)
    
steper = xlsread(filename,'Setting','B11:B11') ;
  %% statistics
    c_peak_anal = zeros(floor(nT/steper),1);
    c_peak_num  = c_peak_anal;
    
  for i = 1 :steper: nT   
      
      c_peak_num(i,1)  = max(c0(i,:));
      
  end 
  
  fprintf('\n  statisitcs is finished in: %8.1f seconds',toc)
  %% plotter
  grid on
  hold on
  subplot(1,2,1);plot(c0(:,1:steper:end))
  grid on
  hold on
  subplot(1,2,2);plot(c_peak_num(:,1:steper:end))
  
  fprintf('\n  results ploted in: %8.1f seconds',toc)
 %% file generator
         
 xlswrite ( filename, c_peak_num, 'peak_num' )
 
 fprintf('\n  making report files is finished in: %8.1f seconds',toc)