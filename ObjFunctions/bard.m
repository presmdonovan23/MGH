function [f,gradf,fvec,J] = bard(n,m,x,evalDer)
% Bard function (8)
% --------------------------------------
% Dimensions: n = 3, m = 15
% Standard starting point: x = (1,1,1)
% Minima: f = 8.21487...10^(-3) and f = 17.4286 at (0.8406...,-inf,-inf)
% 
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

u = (1:m)';
v = 16 - (1:m)';
w = min(u,v);
    
y = [.14  .18   .22   .25   .29  ...
     .32  .35   .39   .37   .58  ...
     .73  .96  1.34  2.10  4.39 ]' ;

fvec = y - (x(1) + u./(v*x(2) + w*x(3)));

f = fvec' * fvec;

if evalDer == 1

    a = u./((x(2)*v + x(3)*w).^2);
    J = [-ones(m,1), a.*v, a.*w];

    gradf = 2*J'*fvec;
end

end