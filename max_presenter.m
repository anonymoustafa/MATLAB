function   max_presenter( c_peak_anal, c_peak_num, steper )

%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 nT=length(c_peak_anal);
 hold on
  for i = 1 :steper: nT
        clc
        fprintf('\n  progress percent %5.2f ', 100 * i/(nT))   
        hold on
        subplot(4,1,3);plot((1 : nT) ,c_peak_anal(i))
        subplot(4,1,4);plot((1 : nT) ,c_peak_num(i))
  end

end

