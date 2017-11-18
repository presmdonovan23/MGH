function [f,gradf,fvec,J] = ie(n,m,x,evalDer)
% Discrete integral equation function (29)
% --------------------------------------
% Dimensions: n = variable, m = n
% Standard starting point: x=(s(j)) where
%   s(j)=t(j)*(t(j)-1) where
%   t(j)=j*h & h=1/(n+1)
% Minima: f = 0 
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

h = 1./(n+1);
t = h*(1:n)';
    
fvec = x + .5*h*((1-t).*cumsum(t.*(x + t + 1).^3) + ...
       t.*cumsum((1-[t(2:n); 1]).*([x(2:n); 0] + [t(2:n); 1] + 1).^3,'reverse'));
       
f = fvec' * fvec;

if evalDer == 1

    J = eye(m,n);
    J = J + (3/2)*h*tril( (1-t).*t'.*repmat((x' + t' + 1).^2,m,1),0);
    J = J + (3/2)*h*triu( t.*(1-t').*repmat((x' + t' + 1).^2,m,1),1);

    gradf = 2*J'*fvec;
end

end
