function [prob] = initf(nprob,n,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [prob] = initf(nprob)
% This function returns information about optimization problem 
% numbered "nprob", such as number of variables, number of 
% function, initial point, name of the function, and the name 
% of the m-file that computes the numerical value and gradient 
% of the component functions.                         
%                               
% Created on 2/14 by OG           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Modified by Preston Donovan on 2017/02/17 to include the x0s and fh field.

% ROSEN 
if nprob == 1
    if nargin == 1
            n = 2;
            m = 2;
    end
    x0 = [-1.2,1]';
    x0s = 'x_0 = (-1.2, 1.0)';
    xmin = [1,1]';
    fname = 'Rosenbrock';
    mname = 'rosen';
    fh = @(x,evalDer) rosen(n,m,x,evalDer);
    
% FROTH
elseif nprob == 2
    if nargin == 1
        n = 2;
        m = 2;
    end
    x0 = [0.5,-2]';
    x0s = 'x_0 = (0.5,-2.0)';
    xmin = [11.4128,-.8968]';
    fname = 'Freudenstein and Roth';
    mname = 'froth';
    fh = @(x,evalDer) froth(n,m,x,evalDer);
    
% BADSCP
elseif nprob == 3
    if nargin == 1
        n = 2;
        m = 2;
    end
    x0 = [0,1]';
    x0s = 'x_0 = (0,1)';
    xmin = [1.098e-5,9.106]';
    fname = 'Powell Badly Scaled'; 
    mname = 'badscp';
    fh = @(x,evalDer) badscp(n,m,x,evalDer);
    
% BADSCB
elseif nprob == 4
    if nargin == 1
        n = 2;
        m = 3;
    end
    x0 = [1,1]';
    x0s = 'x_0 = (1,1)';
    xmin = [10e6,2e-6]';
    fname = 'Brown Badly Scaled'; 
    mname = 'badscb';
    fh = @(x,evalDer) badscb(n,m,x,evalDer);
    
% BEALE
elseif nprob == 5
    if nargin == 1
        n = 2;
        m = 3;
    end
    x0 = [1,1]';
    x0s = 'x_0 = (1,1)';
    xmin = [3,.5]';
    fname = 'Beale'; 
    mname = 'beale';
    fh = @(x,evalDer) beale(n,m,x,evalDer);
    
% JENSAM
elseif nprob == 6
    if nargin == 1
        n = 2;
        m = 10;
    end
    x0 = [0.3,0.4]';
    x0s = 'x_0 = (0.3,0.4)';
    xmin = [.2578,.2578]';
    fname = 'Jennrich and Sampson'; 
    mname = 'jensam';
    fh = @(x,evalDer) jensam(n,m,x,evalDer);
       
% HELIX
elseif nprob == 7
    if nargin == 1
        n = 3;
        m = 3;
    end
    x0 = [-1,0,0]';
    x0s = 'x_0 = (-1,0,0)';
    xmin = [1,0,0]';
    fname = 'Helical Valley'; 
    mname = 'helix';
    fh = @(x,evalDer) helix(n,m,x,evalDer);
       
% BARD
elseif nprob == 8
    if nargin == 1
        n = 3;
        m = 15;
    end
    x0 = [1,1,1]';
    x0s = 'x_0 = (1,1,1)';
    xmin = [.0824,1.1330,2.3437]';
    fname = 'Bard'; 
    mname = 'bard';
    fh = @(x,evalDer) bard(n,m,x,evalDer);
       
% GAUSS
elseif nprob == 9
    if nargin == 1
        n = 3;
        m = 15;
    end
    x0 = [0.4,1,0]';
    x0s = 'x_0 = (0.4,1.0,0)';
    xmin = [.3990,1,0]';
    fname = 'Gaussian'; 
    mname = 'gauss';
    fh = @(x,evalDer) gauss(n,m,x,evalDer);
       
% MEYER
elseif nprob == 10
    if nargin == 1
        n = 3;
        m = 16;
    end
    x0 = [0.02,4000,250]';
    x0s = 'x_0 = (0.02,4000,250)';
    xmin = [.005609636965,6181.346272840786,345.223632151726]';
    fname = 'Meyer'; 
    mname = 'meyer';
    fh = @(x,evalDer) meyer(n,m,x,evalDer);
     
% GULF
elseif nprob == 11
    if nargin == 1
        n = 3;
        m = 10;
    end
    x0 = [5,2.5,0.15]';
    x0s = 'x_0 = (5,2.5,0.15)';
    xmin = [5,2.5,.15]';
    fname = 'Gulf Research and Development'; 
    mname = 'gulf';
    fh = @(x,evalDer) gulf(n,m,x,evalDer);
       
% BOX
elseif nprob == 12
    if nargin == 1
        n = 3;
        m = 10;
    end
    x0 = [0,10,20]';
    x0s = 'x_0 = (0,10,20)';
    xmin = [1,10,1]'; %other mins exist
    fname = 'Box 3-Dimensional'; 
    mname = 'box';
    fh = @(x,evalDer) box(n,m,x,evalDer);
        
% SING
elseif nprob == 13
    if nargin == 1
        n = 4;
        m = 4;
    end
    x0 = [3,-1,0,1]';
    x0s = 'x_0 = (3,-1,0,1)';
    xmin = [0,0,0,0]';
    fname = 'Powell Singular';
    mname = 'sing';
    fh = @(x,evalDer) sing(n,m,x,evalDer);
       
% WOOD
elseif nprob == 14
    if nargin == 1
        n = 4;
        m = 6;
    end
    x0 = [-3,-1,-3,-1]';
    x0s = 'x_0 = (3,-1,3,-1)';
    xmin = [1,1,1,1]';
    fname = 'Wood'; 
    mname = 'wood';
    fh = @(x,evalDer) wood(n,m,x,evalDer);
       
% KOWOSB
elseif nprob == 15
    if nargin == 1
        n = 4;
        m = 11;
    end
    x0 = [0.25,0.39,0.415,0.39]';
    x0s = 'x_0 = (0.25,0.39,0.415,0.39)';
    xmin = [.1928,.1913,.1231,.1361]';
    fname = 'Kowalik and Osborne'; 
    mname = 'kowosb';
    fh = @(x,evalDer) kowosb(n,m,x,evalDer);
      
% BD   
elseif nprob == 16
    if nargin == 1
        n = 4;
        m = 20;
    end
    x0 = [25,5,-5,-1]';
    x0s = 'x_0 = (25,5,-5,-1)';
    % approx
    xmin = [-11.5944,13.2036,-0.4034,0.2368]';
    fname = 'Brown and Dennis'; 
    mname = 'bd';
    fh = @(x,evalDer) bd(n,m,x,evalDer);
       
% OSB1
elseif nprob == 17
    if nargin == 1
        n = 5;
        m = 33;
    end
    x0 = [0.5,1.5,-1,0.01,0.02]';
    x0s = 'x_0 = (0.5,1.5,-1,0.01,0.02)';
    % approx
    xmin = [0.3754,1.9357,-1.4645,.0129,.0221]';
    fname = 'Osborne 1'; 
    mname = 'osb1';
    fh = @(x,evalDer) osb1(n,m,x,evalDer);
      
% BIGGS
elseif nprob == 18
    if nargin == 1
        n = 6;
        m = 13;
    end
    x0 = [1,2,1,1,1,1]';
    x0s = 'x_0 = (1,2,1,1,1,1)';
    xmin = [1,10,1,5,4,3]';
    fname = 'Biggs EXP6'; 
    mname = 'biggs';
    fh = @(x,evalDer) biggs(n,m,x,evalDer);
      
% OSB2
elseif nprob == 19
    if nargin == 1
        n = 11;
        m = 65;
    end
    x0 = [1.3,0.65,0.65,0.7,0.6,3,5,7,2,4.5,5.5]';
    x0s = 'x_0 = (1.3,0.65,0.65,0.7,0.6,3,5,7,2,4.5,5.5)';
    xmin = [1.3100,0.4316,0.6337,0.5994,0.7542,0.9043,1.3658,4.8237,2.3987,4.5689,5.6753]';
    fname = 'Osborne 2'; 
    mname = 'osb2';
    fh = @(x,evalDer) osb2(n,m,x,evalDer);
      
% WATSON
elseif nprob == 20
    if nargin == 1
        n = 9;
        m = 31;
    end
    x0 = zeros(n,1);
    x0s = 'x_0 = (0,...,0)';
    % approx
    xmin = [-0.0001,1.0004,-0.0113,0.4006,-0.0796,-0.2415,1.2765,-1.4139,0.6261]';
    fname = 'Watson'; 
    mname = 'watson';
    fh = @(x,evalDer) watson(n,m,x,evalDer);
    
% ROSEX
elseif nprob == 21
    if nargin == 1
        n = 10;
        m = n;
    end
    x0 = zeros(n,1);
    for j=1:n/2
        x0(2*j-1)=-1.2;
        x0(2*j)=1;
    end
    x0s = 'x_0 = (-1.2,1,...,-1.2,1)';
    xmin = ones(n,1);
    fname = 'Extended Rosenbrock';
    mname = 'rosex';
    fh = @(x,evalDer) rosex(n,m,x,evalDer);
    
% SINGX
elseif nprob == 22
    if nargin == 1
        n = 12;
        m = n;
    end
    x0 = zeros(n,1);
    for j=1:n/4
        x0(4*j-3)=3;
        x0(4*j-2)=-1;
        x0(4*j-1)=0;
        x0(4*j)=1;
    end
    x0s = 'x_0 = (3,-1,0,1,...,3,-1,0,1)';
    xmin = zeros(n,1);
    fname = 'Extended Powell Singular';  
    mname = 'singx';       
    fh = @(x,evalDer) singx(n,m,x,evalDer);
    
% PEN1
elseif nprob == 23
    if nargin == 1
        n = 4;
        m = n+1;
    end
    x0 = zeros(n,1);
    for j=1:n
        x0(j)=j;
    end
    x0s = 'x_0 = (1,2,...,n)';
    xmin = [.25,.25,.25,.25]';
    fname = 'Penalty I';
    mname = 'pen1'; 
    fh = @(x,evalDer) pen1(n,m,x,evalDer);
    
% PEN2
elseif nprob == 24
    if nargin == 1
        n = 4;
        m = 2*n;
    end
    x0 = (1/2)*(ones(n,1));
    x0s = 'x_0 = (0.5,...,0.5)';
    % approx
    xmin = [0.2000,0.1920,0.4812,0.5160]';
    fname = 'Penalty II'; 
    mname = 'pen2';
    fh = @(x,evalDer) pen2(n,m,x,evalDer);
    
% VARDIM
elseif nprob == 25
    if nargin == 1
        n = 10;
        m = n+2;
    end
    x0 = zeros(n,1);
    for j=1:n
        x0(j)=1-(j/n);
    end
    x0s = 'x_0(i) = 1-i/n';
    xmin = ones(n,1);
    fname = 'Variably Dimensioned'; 
    mname = 'vardim';
    fh = @(x,evalDer) vardim(n,m,x,evalDer);
    
% TRIG
elseif nprob == 26
    if nargin == 1
        n = 10;
        m = n;
    end
    x0 = (1/n)*(ones(n,1));
    x0s = 'x_0 = (1/n,...,1/n)';
    xmin = [0.0552,0.0568,0.0588,0.0610,0.0636,0.0668,0.2082,0.1644,0.0850,0.0914]';
    fname = 'Trigonometric'; 
    mname = 'trig';
    fh = @(x,evalDer) trig(n,m,x,evalDer);
    
% ALMOST
elseif nprob == 27
    if nargin == 1
        n = 10;
        m = n;
    end
    x0 = (1/2)*(ones(n,1));
    x0s = 'x_0 = (0.5,...,0.5)';
    
    options = optimoptions('fsolve');
    options.FunctionTolerance = 1e-10;
    options.OptimalityTolerance = 1e-10;
    options.Display = 'off';
    rootfunc = @(alfa) n*alfa.^n - (n+1)*alfa.^(n-1) + 1;
    xmin = fsolve(rootfunc,x0,options);
    
    fname = 'Brown Almost Linear'; 
    mname = 'almost';
    fh = @(x,evalDer) almost(n,m,x,evalDer);
    
% BV
elseif nprob == 28
    if nargin == 1
        n = 10;
        m = n;
    end
    h = 1/(n+1);
    x0 = zeros(n,1);
    t = zeros(n,1);
    for j=1:n
        t(j)=j*h;
        x0(j)=t(j)*(t(j)-1);
    end
    x0s = 'x_0(i) = (i/(n+1))(i/(n+1)-1)';
    xmin = [ -0.0432,-0.0816,-0.1145,-0.1410,-0.1599,-0.1699,-0.1691,-0.1552,-0.1254,-0.0754]';
    fname = 'Discrete Boundary Value'; 
    mname = 'bv';    
    fh = @(x,evalDer) bv(n,m,x,evalDer);
    
% IE
elseif nprob == 29
    if nargin == 1
        n = 10;
        m = n;
    end
    h=1/(n+1);
    x0 = zeros(n,1);
    t = zeros(n,1);
    for j=1:n
        t(j)=j*h;
        x0(j)=t(j)*(t(j)-1);
    end
    x0s = 'x_0(i) = (i/(n+1))(i/(n+1)-1)';
    xmin = [  -0.0432,-0.0816,-0.1145,-0.1410,-0.1600,-0.1700,-0.1691,-0.1552,-0.1254,-0.0754]';
    fname = 'Discrete Integral Equation'; 
    mname = 'ie';
    fh = @(x,evalDer) ie(n,m,x,evalDer);
    
% TRID
elseif nprob == 30
    if nargin == 1
        n = 10;
        m = n;
    end
    x0 = (-1)*(ones(n,1));
    x0s = 'x_0 = (-1,...,-1)';
    xmin = [-0.5707,-0.6818,-0.7022,-0.7055,-0.7049,-0.7015,-0.6919,-0.6658,-0.596,-0.4164]';
    fname = 'Broyden Tridiagonal'; 
    mname = 'trid';
    fh = @(x,evalDer) trid(n,m,x,evalDer);
    
% BAND   
elseif nprob == 31
    if nargin == 1
        n = 10;
        m = n;
    end
    x0 = (-1)*(ones(n,1));
    x0s = 'x_0 = (-1,...,-1)';
    % approx
    xmin = [-0.4283,-0.4766,-0.5197,-0.5581,-0.5925,-0.6245,-0.6232,-0.6214,-0.6205,-0.5865]';
    fname = 'Broyden Banded'; 
    mname = 'band';
    fh = @(x,evalDer) band(n,m,x,evalDer);
    
% LIN   
elseif nprob == 32
    if nargin == 1
        n = 10;
        m = 20;
    end
    x0 = ones(n,1);
    x0s = 'x_0 = (1,..,1)';
    xmin = -1*ones(n,1);
    fname = 'Linear - Full Rank'; 
    mname = 'lin';
    fh = @(x,evalDer) lin(n,m,x,evalDer);
    
% LIN1   
elseif nprob == 33
    if nargin == 1
        n = 10;
        m = 20;
    end
    x0 = ones(n,1);
    x0s = 'x_0 = (1,..,1)';
    xmin = [0.8573,0.7147,0.5720,0.4293,0.2867,0.1440,0.0013,-0.1413,-0.2840,-0.4267]';
    fname = 'Linear --- Rank 1'; 
    mname = 'lin1';
    fh = @(x,evalDer) lin1(n,m,x,evalDer);
    
% LIN0   
elseif nprob == 34
    if nargin == 1
        n = 10;
        m = 20;
    end
    x0 = ones(n,1);
    x0s = 'x_0 = (1,..,1)';
    xmin = [1.0000,0.6907,0.5361,0.3814,0.2268,0.0721,-0.0825,-0.2372,-0.3918,1.0000]'; %root available
    fname = 'Linear - Rank 1 with Zero Columns and Rows'; 
    mname = 'lin0';
    fh = @(x,evalDer) lin0(n,m,x,evalDer);
    
end

prob.n = n;
prob.m = m;
prob.x0 = x0;
prob.x0s = x0s;
prob.xmin = xmin;
prob.fname = fname;
prob.mname = mname;
prob.nprob = nprob;
prob.fh = fh;

end
%
