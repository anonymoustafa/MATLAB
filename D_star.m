
function Dstr = D_star ( b, y, z, s, flow )
%% this function calculates D* parameter in open channel hydraulic
% first the D will be calculated for each delta_x part of reachs
% the D* which is a none-dimensional parameter will be calculated next, by
% this method: D* = 0.5 * ( D(k,i-1) + D(k,i+1))
a   = y .* ( b + z .* y);
xlswrite ( filename, a , 'Reach Propertise', )
xlswrite(
T   =b + 2 .* z .* y;
p   =b + 2 .* y .* sqrt(1+z .^ 2);
r   =a  ./  p;
D   =a  ./  T; %#ok
u   =flow ./  a;
g   =9.81;
w   =a  ./  y;
ustar   =sqrt(g .* r .* s);
Dstr      =y .* ustar .* (u ./  (sqrt(g .* y))) .^ -0.4117 .* (w  ./  y) .^ 0.6776 .* (u  ./  ustar) .^ 1.0132;
end

