clc ;
clear ;
disp('You can leave two following statements blank')
filename = input('Type a file_name to  Load and save your work. ','s');
filepath = input('Where did you saved Watum files? type the folder address EXP : "C:\\Users\\Windows_User\\Documents\\Watum "','s');

if isempty(filename)  ==  1
    filename = 'watum.xlsx' ; 
end

if isempty(filepath)  ==  1
    [~,filepath,~] = xlsread(filename,'Setting','B6:B6'); % excel Address ; 
end

%% reading and making needed data
 
% RI = Reach Information (hydraulic and quality and...)

[ ~,ProjName,~]         = xlsread(filename,'Setting','b2:b2');
End_Reach    = xlsread(filename,'Reach Propertise','o:o');
[Reach_ID,~] = size (End_Reach );
RI_Length    = xlsread(filename,'Reach Propertise','J:J'); % Meters
RI_slope     = xlsread(filename,'Reach Propertise','H:H'); % dim less
RI_Flow      = xlsread(filename,'Reach Propertise','K:K'); % M3/sec
RI_width     = xlsread(filename,'Reach Propertise','D:D'); % Meters
RI_depth     = xlsread(filename,'Reach Propertise','E:E'); % Meters
RI_ZLeft     = xlsread(filename,'Reach Propertise','F:F'); % dim less
RI_ZRight    = xlsread(filename,'Reach Propertise','G:G'); % dim less
steper       = xlsread(filename,'Setting','B12:B12') ; % Decreases amount of report papers
delta_X      = xlsread(filename,'Setting','B9:B9'); % Meters or Meter
total_time   = round(max(xlsread(filename,'Reach Propertise','N:N')) .* 3600) ; % seconds
length_river = max(End_Reach) .* 1000 ; % Meters

DL_X_START   = xlsread(filename,'Loading','F:F'); % Meters
DL_X_END     = xlsread(filename,'Loading','G:G'); % 
DL_num       = xlsread(filename,'Loading','H:H'); % # 
DL_T_START   = xlsread(filename,'Loading','K:K'); % seconds
DL_T_END     = xlsread(filename,'Loading','L:L'); % seconds
DL_mass      = xlsread(filename,'Loading','I:I'); % Grams 
DL_Decay     = xlsread(filename,'Setting','B13:B13');
%DLoad        = [DL_x ; DL_D ; DL_mass ; DL_Startime ; DL_Decay]; % Forms the point load matrix

PLI_Location = xlsread(filename,'Loading','A:A'); % Meters
PLI_mass     = xlsread(filename,'Loading','B:B'); % Grams
PLI_Decay    = xlsread(filename,'Loading','C:C'); % [1/Seconds]
PL_T_START   = xlsread(filename,'Loading','D:D'); 
%PL_T_END     = xlsread(filename,'Loading','E:E'); 
PL_initial_Matrix   = [PLI_Location , PLI_mass , PL_T_START , PLI_Decay]; % Forms the point load matrix

Ini_Con = xlsread(filename,'Initial Concentration','A:A');
Ini_Sta_Loc = xlsread(filename,'Initial Concentration','B:B');
Ini_End_Loc = xlsread(filename,'Initial Concentration','C:C');

%  *****    *****   *****   *****   *****   *****   *****

RI_Area      = RI_width .* RI_depth ;
RI_u         = RI_Flow ./ RI_Area ;
RI_vol       = RI_Area .* delta_X;
Alpha        = 1 ; 
Betha        = 1 - Alpha ;
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
    disp(' (8) if you want study on a non_dispersive model ' );
    
       [ndata, LCD_num , alldata] = xlsread(filename,'Setting','B11:B11');
      

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

epr          = (LCD0 .* RI_Area) ./ delta_X  ; % assign E' value

% end LDC maker

%% time specification



delta_T   = (delta_X .^ 2) ./ (RI_u .* delta_X .* (Alpha-Betha) + 2 .* LCD0 + PLI_Decay(1) .* (delta_X .^ 2))  ;
xlswrite(filename,min(delta_T),'Setting','B10:B10');
delta_T   = xlsread(filename,'Setting','B10:B10'); % I call this the new Delta Time steps.

if isempty(total_time) == 1 
    total_time   = mean(floor(length_river./ RI_u)) +1 ;
end

nT           = floor(total_time ./ delta_T)+1;
nX           = floor(length_river./delta_X)+1;
TX_Cells     = zeros(nT,nX); % makes the main matrix
Cou_Num      = RI_u .* (delta_T ./ delta_X) ; 
Landa        = (LCD0 .* delta_T) ./ (delta_X .^ 2) ;

%% making Diffusive Load Matrix
DLoad = TX_Cells;
[ DLTST_indx , DLTEN_indx ] = timindexer( delta_T, DL_T_START, DL_T_END );
[ DLXST_indx , DLXEN_indx ] = timindexer( delta_X, DL_X_START, DL_X_END );

for i = 1 : length(DL_num)

    for t = DLTST_indx(i)   :   DLTEN_indx(i)
       
        
        for x = DLXST_indx(i)  : DLXEN_indx(i)
        
        
        DLoad(t,x) = DL_mass(i);
   
        end
    
    end

end

%************************************
%% **********************************
PLoad = TX_Cells;


for i = 1 : length(PLI_Location)
     
    nX_i = floor(PLI_Location(i) ./ delta_X)+1;
    nT_i = floor(PL_T_START(i) ./ delta_T)+1;
    PLoad(nT_i,nX_i) = PLI_mass(i);

end



%% initial Condition
[ ini_ST_indx , ini_Ed_indx ] = timindexer( delta_X, Ini_Sta_Loc, Ini_End_Loc );

for i = 1 : length(Ini_Con)

        t = 1; 
        for x = ini_ST_indx(i)  : ini_Ed_indx(i)
        TX_Cells(t,x) = Ini_Con(i);
        end
end

%% Boundary      
                            % TX_Cells(:,1) = 0  ; 

%% Loading
% Instant Point Load
% Diffusive Load



%% inform user
% etha = PLI_Decay .* LCD0 ./ ( RI_u .^ 2 );
% 
% if etha > 1 
%    disp('Diffusion dominates')
% elseif etha <=1
%     disp('Advection dominates')
% end

formatSpec = '  Total Time number is %8.1f \n   nT number is %8.1f \n  nX number is %8.1f \n  Courant Number is %8.1f \n  Landa is %8.5f \n  delta_T is %8.2f \n  delta_X is %8.1f \n  E is %8.3f \n  E'' is %8.3f \n  Press any key to continue';
fprintf(formatSpec,total_time,nT,nX,Cou_Num,Landa,delta_T,delta_X,LCD0(1),epr(1))

pause()

%% main solver

disp('press enter to start hydraulic sub-model')
pause()
tic

%% Quantity

       
            % This section is needed for my second journal paper InshaALLah
            % fprintf('\n  Hydro sub-model is finished in: %8.1f seconds',toc)

            
%% Quality

for i =  1 : Reach_ID 
   
    for  t = 1  : nT -1
        
        for     x = 2 : nX -1
          
              TX_Cells(t+1,x) = ... 
              ...
              PLoad(t,x) ./ RI_vol(i) +     ( DLoad(t,x) .*  delta_T) ./ RI_vol(i) - ...
              ...
              (delta_T ./ RI_vol(i)) .* ( -RI_Flow(i) .* Alpha - epr(i) ) .* TX_Cells(t,x-1) + ...
              ...
              (1-(delta_T ./ RI_vol(i)) .* (-RI_Flow(i) * Betha + RI_Flow(i) .* Alpha + 2 .* epr(i) + DL_Decay .* RI_vol(i) ) ) .* TX_Cells(t,x) - ...
              ...
              (delta_T ./ RI_vol(i)) .* (RI_Flow(i)*Betha-epr(i)).*TX_Cells(t,x+1);
          
        end
    end

end

fprintf('\n  solver Time %8.1f ',toc)

%% presentation
disp(ProjName)

    

  %% statistics
    c_peak_anal = zeros(floor(nT/steper),1);
    c_peak_num  = c_peak_anal;
    
  for i = 1 :steper: nT   
      
      c_peak_num(i,1)  = max(TX_Cells(i,:));
      
  end 
  
  %% timer
  fprintf('\n  statisitcs is finished in: %8.1f seconds',toc)
  
  %% plotter
  string = input('plot? insert y or just enter ','s');
  if (strcmp(string,'y')==1)
  grid on
  hold on
  subplot(1,2,1);plot(TX_Cells(:,1:steper:end))
  grid on
  hold on
  subplot(1,2,2);plot(c_peak_num(:,1:steper:end))
  end
  %% timer
  fprintf('\n  results ploted in: %8.1f seconds',toc)
 
  %% file generator
         
% xlswrite ( filename, c_peak_num, 'peak_num' )
 
 %% timer
 fprintf('\n  making report files is finished in: %8.1f seconds',toc)
 c0 = TX_Cells; c1 = c0';