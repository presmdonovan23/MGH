function [f,gradf,fvec,J] = trig(n,m,x,evalDer)  
% Trigonometric function (26)
% --------------------------------------
% Dimensions: n = variable, m = n
% Standard starting point: x = (1/n,..,1/n)
% Minima: f = 0 
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

i = (1:n)';
cosx = cos(x);
sinx = sin(x);
    
fvec = n - sum(cosx) + i.*(1 - cosx) - sinx;

f = fvec' * fvec;


if evalDer == 1

    diagInds = 1:(m+1):m^2;

    J = repmat(sinx',m,1);
    J(diagInds) = (i+1)'.*J(diagInds) - cosx';

    gradf = 2*J'*fvec;
end

end