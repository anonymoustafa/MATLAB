clc;
% 7Q10 statistical method

disp('please paste your data file with *.xlsx format @ MATLAB Current folder');
disp('Current folder address is:');
disp(userpath);


disp('pay attention your spreadsheet should has a first row Like this:  ');
disp('River	station	Sal	Abi	Ec	TDS	Dama	debi	Mah-B');

prompt = 'Please type your file name, Example: myExample.xlsx ';
filename = input(prompt,'s');

columnH = xlsread(filename,'H:H');

days    = columnH';

n		= floor(length(days)/7);
targets = zeros(1,n);
for i=1:(n-1)*7
targets(1,i)= mean(days(1,i:i+7));
end
min(targets)
