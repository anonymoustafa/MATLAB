function[p] = lagrange_interpolation(X,Y)
L = zeros(n);
p = zeros(1,n);


% computing L matrice, so that each row i holds the polynom L_i
% Now we compute li(x) for i=0....n  ,and we build the polynomial 

for k=1:n
    multiplier = 1;
    outputConv = ones(1,1);
    for index = 1:n
        if(index ~= k && X(index) ~= X(k))
            outputConv = conv(outputConv,[1,-X(index)]);
            multiplier = multiplier * ((X(k) - X(index))^-1);
        end
    end
    polynimialSize = length(outputConv);
    for index = 1:polynimialSize
        L(k,n - index + 1) = outputConv(polynimialSize - index + 1);
    end
    L(k,:) = multiplier .* L(k,:);
end

% continues 


end