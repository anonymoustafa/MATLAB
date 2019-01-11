
clc,clear
          
  %This Program Compute Oxygen Depletion Due to Effeluent of WWTP in the Rivers
  %charactristics of WWTP effluent
    qw=15000;
    Qw=qw/86400;
    BOD5w=40;
    DOw=2;
    Tempw=25;
  %charactristics of river flow
    Qr=0.5;
    BOD5r=3;
    DOr=8;
    Tempr=22;
    ur=0.2;
    Cs=8.7;
  %reaction constants in standard condition
    k1=0.23;
    k2=0.4;
  %calculation of mixture charactristics
    Qmix=Qr+Qw;
    BOD5mix=(BOD5r*Qr+BOD5w*Qw)/Qmix;
    DOmix=(DOr*Qr+DOw*Qw)/Qmix;
    Tempmix=(Tempr*Qr+Tempw*Qw)/Qmix;
    k1mix=k1*(1.047)^(Tempmix-20);
    k2mix=k2*(1.047)^(Tempmix-20);
    L0=BOD5mix/(1-exp(-k1mix*5));
    D0=Cs-DOmix;
  %calculation of oxygen depletion 
    hold on
    x=[1000 5000 10000 15000 20000 75000 100000];
    for i= 1:length(x)
        
        t=(x/ur)/86400;
        D=((k1mix*L0)/(k2mix-k1mix))*(exp(-k1mix*t)-exp(-k2mix*t))+D0*exp(-k2mix*t);
        %disp('level');
        %disp(D);
        
    end
 %% plot
steper = 1 ;
  hold on
  for i = 1 :steper: 100 
        plot(x,D)
  end   
  