function [f,gradf,fvec,J] = box(n,m,x,evalDer)
% Box three-dimensional function (12)
% --------------------------------------
% Dimensions: n = 3, m = 10
% Standard Starting Points: (0,10,20)
% Minima: f=0 at (1,10,1), (10,1,-1) and wherever x1 = x2 and x3 = 0

% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

t = .1*(1:m)';

exptx = exp(-t.*x');
         
fvec = exptx(:,1) - exptx(:,2) - x(3)*(exp(-t) - exp(-10*t));

f = fvec' * fvec;

if evalDer == 1
       
    J = [ -t.*exptx(:,1) t.*exptx(:,2) -(exp(-t) - exp(-10*t)) ];
      
    gradf = 2*J'*fvec;  
end

end