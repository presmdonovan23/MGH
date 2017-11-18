function [f,gradf,fvec,J] = bv(n,m,x,evalDer)  
% Discrete boundary value function (20)
% --------------------------------------
% Dimensions: n = variable, m = n
% Standard starting point: x=(s(j)) where
%   s(j)=t(j)*(t(j)-1) where
%   t(j)=j*h & h=1/(n+1)
% Minima: f = 0 
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

h = 1/(n+1);
t = (1:m)'*h;
        
fvec = 2*x - [0; x(1:n-1)] - [x(2:end); 0] + .5*h^2*(x + t + 1).^3;

f = fvec' * fvec;

if evalDer == 1

    diagInds = 1:(m+1):m^2;
    upperOffDiagInds = diagInds(2:end) - 1;
    lowerOffDiagInds = diagInds(1:end-1) + 1;

    J = zeros(m,n);
    J(diagInds) = 2 + (1.5*h^2)*(x + t + 1).^2;
    J(upperOffDiagInds) = -1;
    J(lowerOffDiagInds) = -1;

    gradf = 2*J'*fvec;
end

end