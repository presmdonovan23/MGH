function [f,gradf,fvec,J] = gauss(n,m,x,evalDer)
% Gaussian function (9)
% --------------------------------------
% Dimensions: n = 3, m = 15
% Standard starting point: x = (0.4,1,0)
% Minima: f = 1.12793...10^(-8)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = (8-(1:m)')./2;

y = [.0009  .0044  .0175  .0540  .1295  .2420  .3521  .3989 ...         
     .3521  .2420  .1295  .0540  .0175  .0044  .0009 ]' ;

fvec = x(1)*exp((-x(2)*(t - x(3)).^2)./2) - y;

f = fvec' * fvec;

if evalDer == 1
        
    a = exp((-x(2)*((t-x(3)).^2))./2);
    J = [a, x(1)*((-((t-x(3)).^2))./2).*a, x(1)*x(2)*(t-x(3)).*a];
      
    gradf = 2*J'*fvec;  
end

end