function [f,gradf,fvec,J] = beale(n,m,x,evalDer)
% Beale function (5)
% --------------------------------------
% Dimensions: n = 2, m = 3              
% Standard starting point: x = (1,1) 
% Minima: f = 0 at (3,0.5)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = [  1.5-x(1)*(1-x(2))
          2.25-x(1)*(1-x(2)^2)
         2.625-x(1)*(1-x(2)^3) ]; 

f = fvec' * fvec;

if evalDer == 1
    J = [   -(1-x(2))           x(1)
          -(1-x(2)^2)    x(1)*2*x(2)
          -(1-x(2)^3)  x(1)*3*x(2)^2 ];
      
    gradf = 2*J'*fvec;
end

end