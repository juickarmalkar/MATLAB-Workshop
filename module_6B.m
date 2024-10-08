%% Optimization
% Module 6B of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar

%% Bisection Method

L = input("Left limit of interval: ");
R = input("Right limit of interval: ");
N = input("Number of iterations: ");
eps = input("Convergence criterion: ");

syms x
y = (x^3+x^2-x-2);  % -4 to 4

for k = 1:N
    z = (L+R)/2;
    fz = subs(y,x,z);
    if abs(fz)<eps
        break
    end
    if fz<0
        L=z;
    end
    if fz>0
        R=z;
    end
end
minima = double(fz)
xmin = z
iter = k

%% Newton-Raphson Method

guess = input("Start point for N-R method: ");
N = input("Number of iterations: ");

syms x
y = (x^3+x^2-x-2);  % -4 to 4 
dy  = diff(y,x,1);
ddy = diff(dy,x,1);

for k = 1:N
    fy  = subs(y,x,guess);
    fy1 = subs(dy,x,guess);
    fy2 = subs(ddy,x,guess);
    xnew = (guess - fy/fy1);
    if abs((guess-xnew)/(guess))<eps
        break
    end
    guess = xnew;
end

minima = double(fy)
xmin = double(guess)
iter = k
