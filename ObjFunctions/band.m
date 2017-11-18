function [f,gradf,fvec,J] = band(n,m,x,evalDer)
% Broyden banded function (31)
% --------------------------------------
% Dimensions: n variable, m = n
% Standard starting point: (-1,...,-1)
% Minima: f = 0 at (-1,...,-1)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

cols = repmat(-4:2,m,1) + repmat((0:m-1)',1,7);
goodInds = and(cols > 0, cols <= n);
goodInds(:,end-1) = 0; % inds where row = col 
    
fvec = x.*(2 + 5*x.^2) + 1;
cols(~goodInds) = 1;

xx = x(cols);
xx(~goodInds) = 0;

fvec = fvec - sum(xx.*(1+xx),2);

f = fvec' * fvec;

if evalDer == 1
    diagInds = 1:(m+1):m^2;

    J = zeros(m,n);

    term2 = -1 - 2*x;

    cols = cols(goodInds);

    rows = repmat((1:m)',1,7);
    rows = rows(goodInds);
    %rows(cols == 0) = 0;
    %rows = rows(rows > 0);

    inds = sub2ind([m, n], rows, cols);

    J(inds) = term2(cols);

    J(diagInds) = 2 + 15*x.^2;

    gradf = 2*J'*fvec;
end

end