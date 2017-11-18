function [f,gradf,fvec,J]= lin1(n,m,x,evalDer)
% Linear function - rank 1 (33)
% --------------------------------------
% Dimensions: n variable, m >= n
% Standard starting point: (1,....,1)
% Minima: f = [(m(m-1))/(2(2m+1))]
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = (1:m)'*(1:n)*x - 1;

f = fvec' * fvec;

if evalDer == 1
    J = (1:m)'*(1:n);
    
    gradf = 2*J'*fvec;
end

end