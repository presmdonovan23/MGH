function [f,gradf,fvec,J] = meyer(n,m,x,evalDer)
% Meyer function (10)
% --------------------------------------
% Dimensions: n = 3, m = 16
% Standard starting point: x = (0.02,4000,250)
% Minima: f = 87.9458...
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

y = [ 34780 28610 23650 19630 16370 13720 11540 9744 ...
       8261  7030  6005  5147  4427  3820  3307 2872 ]' ;

t = 45 + 5*(1:m)';
d = t + x(3);
q = 1./d;
e = exp(x(2)*q);
       
fvec = x(1)*e - y;

f = fvec' * fvec;

if evalDer == 1
   
    s = x(1)*q.*e;
    J = [e s -x(2).*q.*s];
    
    gradf = 2*J'*fvec;
end

end