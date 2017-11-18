function [f,gradf,fvec,J] = gulf(n,m,x,evalDer)
% Gulf research and development function (11)
% --------------------------------------
% Dimensions: n = 3,  n <= m <= 100
% Standard starting point: x = (5,2.5,0.15)
% Minima: f = 0 at (50,25,1.5)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = (1:m)'./100;
    
y = 25 + (-50*log(t)).^(2/3);
fvec = exp(-abs(y - x(2)).^(x(3))./x(1)) - t;

f = fvec' * fvec;

if evalDer == 1
    
    x1inv = 1/x(1);

    a = 25 + (-50*log(t)).^(2/3) - x(2);
    av = abs(a);
    c = x1inv * av.^x(3);
    e = exp(-c);

    d1 = c*x1inv;
    d2 = x(3) * x1inv * av.^(x(3) - 1);
    d2(a < 0) = -d2(a < 0);
    d3 = -log(av) .* c;

    J = [d1.*e d2.*e d3.*e];
    
    gradf = 2*J'*fvec;
end

end