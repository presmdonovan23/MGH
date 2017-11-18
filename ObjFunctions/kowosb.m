function [f,gradf,fvec,J] = kowosb(n,m,x,evalDer)
% Kowalik and Osborne function (15)
% --------------------------------------
% Dimensions: n = 4, m = 11
% Standard starting point: (0.25,0.39,0.415,0.39)
% Minima: f = 3.07505...10^-4 and
%   f= 1.02734...10^-3  at (inf,-14.07...,-inf,-inf)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

u = [4.0000  2.0000  1.0000  0.5000  0.2500  0.1670 ...
             0.1250  0.1000  0.0833  0.0714  0.0625 ]' ;
         
c1 = u.^2 + x(2)*u;
c2 = u.^2 + x(3)*u + x(4);
    
y = [.1957  .1947  .1735  .1600  .0844  .0627 ...
     .0456  .0342  .0323  .0235  .0246 ]' ;

fvec = y - x(1)*c1./c2;
    
f = fvec' * fvec;

if evalDer == 1

    u = [4.0000  2.0000  1.0000  0.5000  0.2500  0.1670 ...
         0.1250  0.1000  0.0833  0.0714  0.0625 ]' ;

    
    a = x(1) * c1 .* (c2.^-2);
    J = [-c1./c2 -x(1)*u./c2 a.*u a];
    
    gradf = 2*J'*fvec;
end

end