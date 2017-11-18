function [f,gradf,fvec,J] = singx(n,m,x,evalDer)  
% Extended Powell Singular function (22)
% --------------------------------------
% Dimensions: n = variable but a multiple of 4, m = n             
% Standard starting point: x=(s(j)) where 
%   s(4*j-3)=3, 
%   s(4*j-2)=-1,
%   s(4*j-1)=0,
%   s(4*j)=1 
% Minima: f = 0 at the origin.            
%                                     
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

inds0 = 4:4:n;
inds1 = inds0 - 1;
inds2 = inds0 - 2;
inds3 = inds0 - 3;

fvec(inds0) = sqrt(10)*(x(inds3) - x(inds0)).^2;
fvec(inds1) = (x(inds2) - 2*x(inds1)).^2;
fvec(inds2) = sqrt(5)*(x(inds1) - x(inds0));
fvec(inds3) = x(inds3) + 10*x(inds2);

fvec = fvec';
    
f = fvec' * fvec;

if evalDer == 1
    
    J = zeros(m,n);

    ind = sub2ind([m, n], inds3, inds3);
    J(ind) = 1;

    ind = sub2ind([m, n], inds3, inds2);
    J(ind) = 10;

    ind = sub2ind([m, n], inds2, inds1);
    J(ind) = sqrt(5);

    ind = sub2ind([m, n], inds2, inds0);
    J(ind) = -sqrt(5);

    ind = sub2ind([m, n], inds1, inds2);
    J(ind) = 2*x(inds2)-4*x(inds1);

    ind = sub2ind([m, n], inds1, inds1);
    J(ind) = 8*x(inds1)-4*x(inds2);

    ind = sub2ind([m, n], inds0, inds3);
    J(ind) = 2*sqrt(10)*(x(inds3)-x(inds0));

    ind = sub2ind([m, n], inds0, inds0);
    J(ind) = 2*sqrt(10)*(x(inds0)-x(inds3));
    
    gradf = 2*J'*fvec;
end

end