function [f,gradf,fvec,J] = froth(n,m,x,evalDer)
% Freudenstein and Roth function (2)
% --------------------------------------
% Dimensions: n = 2, m = 2
% Standard starting point: x=(0.5,-2)
% Minima: f=0 at (5,4)
%   f=48.9842... at (11.41...,-0.8968...)  
%                                                  
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec = [  -13+x(1)+((5-x(2))*x(2)-2)*x(2)
     -29+x(1)+((x(2)+1)*x(2)-14)*x(2) ];

f = fvec' * fvec;

if evalDer == 1
    J    = [ 1       10*x(2)-3*x(2)^2-2
             1       3*x(2)^2+2*x(2)-14  ] ;
         
    gradf = 2*J'*fvec;
end

end