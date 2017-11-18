function [f,gradf,fvec,J] = sing(n,m,x,evalDer)
% Powell singular function (13)
% --------------------------------------
% Dimensions: n = 4, m = 4
% Starting point: (3,-1,0,1)
% Minima: f = 0 at the origin
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = [             x(1) + 10*x(2)
              sqrt(5)*(x(3) - x(4))
                  (x(2) - 2*x(3))^2
         sqrt(10)*((x(1) - x(4))^2) ] ;

f = fvec' * fvec;

if evalDer == 1
    J = [ 1                           10       0                            0
          0                            0       sqrt(5)               -sqrt(5)
          0              2*(x(2)-2*x(3))      -4*(x(2)-2*x(3))              0 
          2*sqrt(10)*(x(1)-x(4))       0       0      -2*sqrt(10)*(x(1)-x(4))];
      
    gradf = 2*J'*fvec;
end

end