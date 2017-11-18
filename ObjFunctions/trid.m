function [f,gradf,fvec,J] = trid(n,m,x,evalDer)  
% Broyden tridiagonal function (30)
% --------------------------------------
% Dimensions: n = variable, m = n
% Standard starting point: x = (-1,..,-1)
% Minima: f = 0
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];
 
x_ext = [0; x; 0];
fvec = (3-2*x).*x - x_ext(1:n) - 2*x_ext(3:n+2) + 1;
    
f = fvec' * fvec;

if evalDer == 1
    
    diagInds = 1:(m+1):m^2;
    upperOffDiagInds = diagInds(2:end) - 1;
    lowerOffDiagInds = diagInds(1:end-1) + 1;

    J = zeros(m,n);
    J(diagInds) = 3 - 4*x;
    J(upperOffDiagInds) = -2;
    J(lowerOffDiagInds) = -1;
      
    gradf = 2*J'*fvec;  
end

end