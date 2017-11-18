function [f,gradf,fvec,J] = almost(n,m,x,evalDer)  
% Brown Almost Linear function (27)
% --------------------------------------
% Dimensions: n = variable and m = n
% Standard starting point: x = (.5,...,.5)
% Minima: f = 0 at (a,...,a,a^{1-n}
%   where n*a^n - (n+1)*a^{n-1} + 1 = 0
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

prodx = prod(x);

fvec(n) = prodx - 1;
fvec(1:n-1) = x(1:n-1) + sum(x) - (n+1);

fvec = fvec';

f = fvec' * fvec;

if evalDer == 1  
    
    J = eye(n) + 1;
    J(n,:) = prodx./x;
    
    gradf = 2*J'*fvec;
end

end