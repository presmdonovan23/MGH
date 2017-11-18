function [f,gradf,fvec,J] = vardim(n,m,x,evalDer)  
% Variably Dimensioned function (25)
% --------------------------------------
% Dimensions: n = variable, m = n + 2
% Standard starting point: x = (s(j)) where 
%   s(j)=1-(j/n) 
% Minima: f = 0 at (1,.....1)
%                                     
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

j_xjm1 = (1:n)*(x-1);

fvec(n+2) = (j_xjm1)^2;
fvec(n+1) = j_xjm1;

fvec(1:n) = x - 1;

fvec = fvec';

f = fvec' * fvec;

if evalDer == 1
   
    J = eye(m,n);

    J(n+1,:) = 1:n;
    J(n+2,:) = 2*j_xjm1*(1:n);
    
    gradf = 2*J'*fvec;
end

end