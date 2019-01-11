
%     a multi variational function for
%     problems where you want to optimize
%     a function====
function [ u ] = multivarfun( x1 ,x2  )
u = 100*(x2-(x1)^2)^2+(1-(x1))^2;
end
%==================================