function [f,gradf,fvec,J] = rosex(n,m,x,evalDer)  
% Extended Rosenbrock function (21)
% --------------------------------------
% Dimensions: n = variable but even, m = n
% Standard starting point: x=(s(j)) where
%   s(2*j-1)=-1.2,
%	s(2*j)=1 
% Minima: f = 0 at (1,.....,1)              
%                                     
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

evenInds = 2:2:m;

fvec(2:2:n) = 1 - x(1:2:n-1);
fvec(1:2:n-1) = 10*(x(evenInds) - x(evenInds-1).^2);

fvec = fvec';
    
f = fvec' * fvec;

if evalDer == 1
        
    J = zeros(m,n);

    ind = sub2ind([m n], evenInds-1, evenInds-1);
    J(ind) = -20*x(evenInds-1);

    ind = sub2ind([m n], evenInds-1, evenInds);
    J(ind) = 10;

    ind = sub2ind([m n], evenInds, evenInds-1);
    J(ind) = -1;
    
    gradf = 2*J'*fvec;
end

end