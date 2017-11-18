function [f,gradf,fvec,J] = badscb(n,m,x,evalDer)  
% Brown badly scaled function (4)
% --------------------------------------
% Dimensions: n = 2, m = 3
% Standard starting point: x = (1,1)
% Minima: f = 0 at (1e+6,2e-6)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = [ x(1)-10^6
         x(2)-(2e-6)
         x(1)*x(2)-2  ]  ;

f = fvec' * fvec;

if evalDer == 1
    J = [     1      0
              0      1
           x(2)   x(1)  ] ;
       
    gradf = 2*J'*fvec;
end

end