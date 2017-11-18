function [f,gradf,fvec,J] = biggs(n,m,x,evalDer)
% Biggs EXP6 function (18)
% --------------------------------------
% Dimensions: n = 6, m = 13
% Standard starting point: (1,2,1,1,1,1)
% Minima: f = 5.65565...10^(-3) if m =13
%   f = 0 at (1,10,1,5,4,3)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = .1*(1:m)';

exptx = exp(-t.*x');

y = exp(-t) - 5*exp(-10*t) + 3*exp(-4*t);

fvec = x(3)*exptx(:,1) - x(4)*exptx(:,2) + x(6)*exptx(:,5) - y;
    
f = fvec' * fvec;

if evalDer == 1
        
    J = [-x(3)*t.*exptx(:,1)  x(4)*t.*exptx(:,2) exptx(:,1) ...
                 -exptx(:,2) -x(6)*t.*exptx(:,5) exptx(:,5) ];
      
    gradf = 2*J'*fvec;          
end

end