function [f,gradf,fvec,J] = rosen(n,m,x,evalDer)
% Rosenbrock function (1)
% --------------------------------------
% Dimensions: n = 2, m = 2
% Standard starting point: x = (1,1)
% Minima: f = 0 at (1,1)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = [ 10*(x(2) - x(1)^2)
                   1 - x(1) ] ;

f = fvec' * fvec;

if evalDer == 1
    
    J = [ -20*x(1)  10
                -1   0 ];
      
    gradf = 2*J'*fvec;      
end

end