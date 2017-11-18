function [f,gradf,fvec,J] = pen2(n,m,x,evalDer)  
% Penalty II function (24)
% --------------------------------------
% Dimensions: n = variable, m = 2*n
% Standard starting point: x = (1/2,......,1/2)
% Minima: f = 9.37629...10^(-6)  if n = 4
%   f=2.93660...10^(-4)  if n = 10
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

root05 = sqrt(1e-5);
expx = exp(x./10);
    
fvec(2*n) = sum((n - (1:n)' + 1).*x.^2) - 1;

inds = (n+1:2*n-1)';
fvec(inds) = root05*(expx(inds - n + 1) - exp(-.1));

inds = (2:n)';
y = exp(inds./10) + exp((inds-1)./10);
fvec(inds) = root05*(expx(inds) + expx(inds-1) - y);

fvec(1) = x(1) - .2;

fvec = fvec';

f = fvec' * fvec;

if evalDer == 1
    
    J=zeros(m,n);

    J(1,1) = 1;

    if(n >= 2)
        two2n = 2:n;

        ind = sub2ind([m,n],two2n,two2n);
        J(ind) = .1*root05*expx(two2n);

        ind = sub2ind([m,n],two2n,two2n - 1);
        J(ind) = .1*root05*expx(two2n-1);

        n2twon = n+1:(2*n-1);
        ind = sub2ind([m,n],n2twon,n2twon-n+1);
        J(ind) = .1*sqrt(1.e-5)*expx(n2twon-n+1);

    end

    J(m,:) = 2*(n:-1:1).*x';
    
    gradf = 2*J'*fvec;
end

end