function [f,gradf,fvec,J] = pen1(n,m,x,evalDer)  
% Penalty I function (23)
% --------------------------------------
% Dimensions: n = variable, m = n+1
% Standard starting point: x=(s(j)) where 
%   s(j)=j 
% Minima: f=2.24997...10^(-5)  if n=4
%   f=7.08765...10^(-5)  if n=10            
%                                     
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec(n+1) = sum(x.^2) - .25;
fvec(1:n) = sqrt(1e-5)*(x - 1);

fvec = fvec';

f = fvec' * fvec;

if evalDer == 1
    
    J = [sqrt(1e-5)*eye(n,n); 2*x'];
    
    gradf = 2*J'*fvec;
end

end