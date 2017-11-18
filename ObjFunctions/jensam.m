function [f,gradf,fvec,J] = jensam(n,m,x,evalDer)
% Jenrich and Sampson function (6)
% --------------------------------------
% Dimensions: n = 2, m >= n
% Standard starting point: x = (0.3,0.4)
% Minima: f = 124.362 at x1 = x2 = 0.2578 for m = 10
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

one2m = (1:m)';
    
fvec = 2 + 2*one2m - exp(one2m*x(1)) - exp(one2m*x(2));

f = fvec' * fvec;

if evalDer == 1

    J = zeros(m,n);
    J(:,1:2) = -[one2m one2m].*exp(one2m*x');
    
    gradf = 2*J'*fvec;
end

end