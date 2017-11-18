function [f,gradf,fvec,J] = bd(n,m,x,evalDer)
%  Brown and Dennis function (16)
% --------------------------------------
% Dimensions: n = 4, m = 20
% Standard starting point: (25,5,-5,-1)
% Minima: f = 85822.2 if m=20
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = (1:m)'./5;

fvec = (x(1) + t*x(2) - exp(t)).^2 + (x(3) + x(4)*sin(t) - cos(t)).^2;

f = fvec' * fvec;

if evalDer == 1

    e = exp(t);
    s = sin(t);
    c = cos(t);
    f1 = 2*(x(1) + x(2)*t - e);
    f3 = 2*(x(3) + x(4)*s - c);

    J = [f1 f1.*t f3 f3.*s];

    gradf = 2*J'*fvec;
end

end