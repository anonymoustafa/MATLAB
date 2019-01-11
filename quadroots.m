function quadroots(a, b, c)
% quadroots: roots of quadratic equation
% quadroots(a,b,c): real and complex roots
% of quadratic equation
% input:
% a = second-order coefficient
% b = first-order coefficient
% c = zero-order coefficient
% output:
% r1 = real part of first root
% i1 = imaginary part of first root
% r2 = real part of second root
% i2 = imaginary part of second root
if a == 0
%special cases
if b ~= 0
%single root
r1 = -c / b
else
%trivial solution
disp('Trivial solution. Try again')
end
else
%quadratic formula
d = b ^ 2 - 4 * a * c; %discriminant
if d >= 0
%real roots
r1 = (-b + sqrt(d)) / (2 * a)
r2 = (-b - sqrt(d)) / (2 * a)
else
%complex roots
r1 = -b / (2 * a)
i1 = sqrt(abs(d)) / (2 * a)
r2 = r1
i2 = -i1
end
end
