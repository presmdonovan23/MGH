function [f,gradf,fvec,J] = lin(n,m,x,evalDer)
% Linear function - full rank (32)
% --------------------------------------
% Dimensions: n variable, m >= n
% Standard starting point: (1,...,1)
% Minima of f = m - n at (-1,...,-1)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

s =  - (2/m)*sum(x) - 1;

fvec = s*ones(m,1);
fvec(1:n) = x + s;
    
f = fvec' * fvec;

if evalDer == 1
    
    J = eye(m,n) + (-2/m)*ones(m,n);

    gradf = 2*J'*fvec;
end

end