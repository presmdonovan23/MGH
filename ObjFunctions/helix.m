function [f,gradf,fvec,J] = helix(n,m,x,evalDer)
% Helical valley function (7)
% --------------------------------------
% Dimensions: n = 3, m = 3
% Standard starting point: x = (-1,0,0)
% Minima: f = 0 at (1,0,0)
%
% 2017-03-31 by Preston Donovan

J = [];
gradf = [];

fvec(3)  = x(3);
if x(1) > 0
    fvec(1)  =  10*(x(3)-10*((1/(2*pi))*atan(x(2)/x(1))));                                        
elseif x(1) < 0
    fvec(1)  =  10*(x(3)-10*((1/(2*pi))*atan(x(2)/x(1))+.5));                       
end
fvec(2)  = 10*((x(1)^2+x(2)^2)^.5-1);

fvec=fvec'; 
    
f = fvec' * fvec;

if evalDer == 1

    J11 = (50/pi)*(x(2)/x(1)^2)*(1/(1+(x(2)/x(1))^2));
    J12 = -(50/pi)*(1/x(1))*(1/(1+(x(2)/x(1))^2));
    val = 10/sqrt(x(1)^2+x(2)^2);

    J = [     J11,            J12, 10 ;
         x(1)*val,       x(2)*val,  0 ;
                0,              0,  1 ];

    gradf = 2*J'*fvec;
end

end