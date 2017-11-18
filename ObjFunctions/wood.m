function [f,gradf,fvec,J] = wood(n,m,x,evalDer)
% Wood function (14)
% --------------------------------------
% Dimensions: n = 4, m = 6
% Standard starting point: (-3,-1,-3,-1)
% Minima: f = 0 at (1,1,1,1)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

root10 = sqrt(10);
    
fvec = [       10*(x(2) - x(1)^2)
                         1 - x(1)
         3*root10*(x(4) - x(3)^2)
                         1 - x(3)
         root10*(x(2) + x(4) - 2)
         (1/root10)*(x(2) - x(4)) ];

f = fvec' * fvec;

if evalDer == 1
            
    J = [  -20*x(1)             10                 0            0
                 -1              0                 0            0
                  0              0    -6*root10*x(3)     3*root10
                  0              0                -1            0
                  0         root10                 0       root10
                  0       1/root10                 0    -1/root10  ] ;
              
    gradf = 2*J'*fvec;
    
end

end