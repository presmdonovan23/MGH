function [f,gradf,fvec,J] = badscp(n,m,x,evalDer)  
% Powell badly scaled function (3)
% --------------------------------------
% Dimensions: n = 2, m = 2
% Standard starting point: x = (0,1)
% Minima: f = 0 at (1.098...10-E5,9.106...)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

ex1 = exp(-x(1));
ex2 = exp(-x(2));

fvec = [ 10^4*x(1)*x(2) - 1
     ex1 + ex2 - 1.0001  ];

f = fvec' * fvec;

if evalDer == 1
     J = [ 10^4*x(2)    10^4*x(1)
                -ex1         -ex2 ];

    gradf = 2*J'*fvec;
end

end