%% Optimization Examples: Unconstrained
% Day 2 of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar

%% Random Search Method

num = 1e8;
eps = 1e-8;

upper = [-1.5, 1.5];
lower = [-0.5, 2.5];

fval = 1e6;
fprev = fval;

for i = 1:num
    x1r = rand;
    x1r = upper(1) + x1r*(lower(1)-upper(1));
    x2r = rand;
    x2r = upper(2) + x2r*(lower(2)-upper(2));
    
    func = random_search(x1r,x2r);
    
    if func<fval
        fval = func;
        xmin = x1r;
        ymin = x2r;
        
        if abs(fval-fprev)<eps
            break
        else
            fprev = fval;
        end
    end
end

fmin = double(fval)
xmin = x1r
ymin = x2r

%% Multi-variate Random Search Method

num = 1e8;
eps = 1e-8;

lower = [ 0,  0, 1, 0, 1,  0];
upper = [10, 10, 5, 6, 5, 10];

fval = 1e6;
fprev = fval;

for i = 1:num
    
    x1r = rand;
    x1r = lower(1) + x1r*(upper(1)-lower(1));
    
    x2r = rand;
    x2r = lower(2) + x2r*(upper(2)-lower(2));
    
    x3r = rand;
    x3r = lower(1) + x3r*(upper(1)-lower(1));
    
    x4r = rand;
    x4r = lower(2) + x4r*(upper(2)-lower(2));
    
    x5r = rand;
    x5r = lower(1) + x5r*(upper(1)-lower(1));
    
    x6r = rand;
    x6r = lower(2) + x6r*(upper(2)-lower(2));
    
    func = random_search_1(x1r,x2r,x3r,x4r,x5r,x6r);
    
    if func<fval
        
        fval = func;
        
        x1min = x1r;
        x2min = x2r;
        x3min = x3r;
        x4min = x4r;
        x5min = x5r;
        x6min = x6r;
        
        if abs(fval-fprev)<eps
            break
        else
            fprev = fval;
        end
    end
end

fmin = double(fval)

x1Min = x1r
x2Min = x2r
x3Min = x3r
x4Min = x4r
x5Min = x5r
x6Min = x6r

%% Multi-variate Random Search Method - Positive Function Value

num = 1e8;
eps = 1e-8;

lower = [ 0,  0, 1, 0, 1,  0];
upper = [10, 10, 5, 6, 5, 10];

fval = 1e6;
fprev = fval;

for i = 1:num
    
    x1r = rand;
    x1r = lower(1) + x1r*(upper(1)-lower(1));
    
    x2r = rand;
    x2r = lower(2) + x2r*(upper(2)-lower(2));
    
    x3r = rand;
    x3r = lower(1) + x3r*(upper(1)-lower(1));
    
    x4r = rand;
    x4r = lower(2) + x4r*(upper(2)-lower(2));
    
    x5r = rand;
    x5r = lower(1) + x5r*(upper(1)-lower(1));
    
    x6r = rand;
    x6r = lower(2) + x6r*(upper(2)-lower(2));
    
    func = random_search_1(x1r,x2r,x3r,x4r,x5r,x6r);
    
    if func<fval && func>0 && x4r<upper(4)          % imposing positive function value is causing x4r to misbehave, have to put additional constraint
        
        fval = func;
        
        x1min = x1r;
        x2min = x2r;
        x3min = x3r;
        x4min = x4r;
        x5min = x5r;
        x6min = x6r;
        
        if abs(fval-fprev)<eps
            break
        else
            fprev = fval;
        end
    end
end

fmin = double(fval)

xMin = [x1r, x2r, x3r, x4r, x5r, x6r]

% more num of times code is run, its not going to keep giving better results, because this is random search
% check all entries of xmin vector with bounds
% can impose additional constraints in the for loop

%% Gradient Method

syms x1 x2 g

var = [x1; x2];

func = x1-x2+2*x1^2+2*x1*x2+x2^2;

grad_func = sym([size(var,1) 1]);

for i = 1:size(var,1)
    grad_func(i) = diff(func,var(i));
end

iter = 10;

eps = 1e-3;

sol = zeros(size(var,1),iter);

X0 = [0; 0];

sol(:,1) = X0;

S = zeros(size(var,1),iter);

for k = 1:iter
    
    func1 = subs(func,(var),(sol(:,k)));
    
    for j = 1:size(var,1)
        S(j,k) = subs(grad_func(j),(var),(sol(:,k)));
    end
    
    s   = -S(:,k);
    X1  = sol(:,k)+g*s;
    
    fx  = subs(func,(var),(X1));
    dfx = diff(fx,g,1);
    
    eqn = dfx == 0;
    g1  = solve(eqn,g);
    
    X1  = sol(:,k)+g1*s;
    
    func2 = subs(func,(var),(X1));
    
    if abs((func2-func1)/func1)<eps
        break 
    else
        sol(:,k+1) = X1;
    end  
end

optimum = double(X1)
num_iter = k
solutions = sol

% change the convergence criteria
% increase number of iterations
% convergence plot
% check solutions matrix to see progression of code

%% Conjugate Gradient Method

syms x1 x2 g b

var = [x1; x2];

func = x1-x2+2*x1^2+2*x1*x2+x2^2;

grad_func = sym([size(var,1) 1]);

for i = 1:size(var,1)
    grad_func(i) = diff(func,var(i));
end

iter = 10;

eps = 1e-3;

sol = zeros(size(var,1),iter);

X0 = [0; 0];

sol(:,1) = X0;

S = zeros(size(var,1),iter);

for j = 1:size(var,1)
    S(j,1) = subs(grad_func(j),(var),(sol(:,1)));
end

s1 = -S(:,1);
X2 = sol(:,1)+g*s1;

Fx  = subs(func,(var),(X2));
DFx = diff(Fx,g,1);

eqn = DFx == 0;
g1  = solve(eqn,g);
    
X2  = sol(:,k)+g1*s;

for k = 2:iter
    
    func1 = subs(func,(var),(sol(:,k)));
    
    for j = 1:size(var,1)
        S(j,k) = subs(grad_func(j),(var),(sol(:,k)));
    end
    
    s   = -S(:,k) + ((abs(S(:,k).^2))/((abs(S(:,k-1).^2))))*(S(:,k-1));
    X1  = sol(:,k)+g*s;
       
    fx  = subs(func,(var),(X1));
    dfx = diff(fx,g,1);
    
    eqn = dfx == 0;
    g1  = solve(eqn,g);
    
    X1  = sol(:,k)+g1*s;
    
    func2 = subs(func,(var),(X1));
    
    if abs((func2-func1)/func1)<eps
        break 
    else
        sol(:,k+1) = X1;
    end  
end

optimum = double(X1)
num_iter = k
solutions = sol

% change the convergence criteria
% increase number of iterations upto 30
% convergence plot
% check solutions matrix to see progression of code

%% Function Definitions

function f = random_search(x,y)
f = (1-x^2) + 100*(y-x^2)^2;
end

function f = random_search_1(u,v,w,x,y,z)
f = -25*(u-2)^2 - (v-2)^2 - (w-1)^2 - (x-4)^2 - (y-1)^2 + 6*z;
end