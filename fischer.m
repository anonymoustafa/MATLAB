function Ex = fischer( b, y, z, s, flow, u )
%% Fischer Longitudinal dispersion coefficient 1975
% This function calculate Fischer LDC
% use meter and qubic meter as your dimentions
a   = y .* ( b + z .* y);
T   =b + 2 .* z .* y;
p   =b + 2 .* y .* sqrt(1+z .^ 2);
r   =a ./ p;
D   =a ./ T; %#ok
switch nargin
    case 5
            u   = flow ./ a;
end
g   =9.81;
u_star= sqrt (g .* r .* s);
Ex=11e-3 .* (u .^ 2 .* (a ./ y) .^ 2) ./ (y .* u_star);
end

