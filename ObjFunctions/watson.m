function [f,gradf,fvec,J] = watson(n,m,x,evalDer)
% Watson function (20)
% --------------------------------------
% Dimensions : n = 20,  m = 31
% Standard starting point: (0,....,0)
% Minima of f=2.28767...10^(-3)    if n = 6
%   f=1.39976...10^(-6)    if n = 9
%   f=4.72238...10^(-10)   if n = 12
%   f=2.48631...10^(-20)   if n=20
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = (1:(m-2))'./(m-2);
j = (1:n)';

tj = t.^(j'-1);


fvec = zeros(m,1);
fvec(m) = x(2) - x(1)^2 - 1;
fvec(m-1) = x(1);

fvec(1:(m-2)) = (t.^(j(2:n)'-2))*((j(2:n)-1).*x(2:n)) - ...
             (tj*x).^2 - 1;
             
f = fvec' * fvec;

if evalDer == 1
    
    term1 = (t.^(j'-2)).*repmat(j'-1,m-2,1);%diag(j-1); % scale columns by j - 1
    term2 = -2*repmat(tj*x,1,n).*tj;%-2*diag(A*x)*A;       % scale rows by A*x
    df1to29 = term1 + term2;

    df30 = [1 zeros(1,n-1)];
    df31 = [-2*x(1) 1 zeros(1,n-2)];

    J = [df1to29; df30; df31];
   
    gradf = 2*J'*fvec;
end

end