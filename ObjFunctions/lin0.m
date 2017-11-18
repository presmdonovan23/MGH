function [f,gradf,fvec,J] = lin0(n,m,x,evalDer)
% Linear function - rank 1 with zero columns and rows (32)
% --------------------------------------
% Dimensions: n variable, m >= n
% Standard starting point: (1,...1)
% Minima: f = (m^2 + 3m - 6)/2(2m - 3)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec(m) = -1;
fvec(1) = -1;
fvec(2:m-1) = (1:m-2)'*(2:n-1)*x(2:n-1) - 1;

fvec = fvec';

f = fvec' * fvec;

if evalDer == 1
    J = [(0:m-2)'; 0]*[0 2:n-1 0];
    
    gradf = 2*J'*fvec;
end

end