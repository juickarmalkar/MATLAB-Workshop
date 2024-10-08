%% Integration
% Module 6A of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar

%% Analytical Integration
syms x

y = ((x-7)^2 + (2*x+5)^2);

val1 = double(int(y,x,2,8));

%% Integral Function

y = @(x) (x.^4-16*x.^2+5*x)/2;

intg = integral(y,-5,5);

%% Trapezoidal Rule
x = linspace(2,8,20);

y = (((x-7).^2 + (2.*x+5).^2));

intg1 = trapz(x,y);

%% Hand Code

syms x

y = (x^2);

n = 25;

xPts = linspace(2,5,n);

h = (xPts(end)-xPts(1))/n;

sum = 0;

for i = 2:(n-1)
    k = 2*subs(y,x,xPts(i));
    sum = sum+k;
end

y1 = subs(y,x,xPts(1));
yn = subs(y,x,xPts(end));

intg2 = double((h/2)*(y1+sum+yn));
    
%% Simpson's 1/3 Rule

syms x

y = ((x-7)^2 + (2*x+5)^2);

n = 3;          % exact match at n = 3

xPts = linspace(2,8,n);

h = (xPts(end)-xPts(1))/2;

y1 = subs(y,x,xPts(1));
yn = subs(y,x,xPts(end));

sum1 = 0;
sum2 = 0;

for i = 2:2:(n-1)
    k1 = 4*subs(y,x,xPts(i));
    sum1 = sum1+k1;
end

for j = 3:2:(n-1)
    k2 = 2*subs(y,x,xPts(j));
    sum2 = sum2+k2;
end

intg3 = double((h/3)*(y1+sum1+sum2+yn));
    
%% Simpson's 3/8 Rule % EXERCISE

syms x

y = ((x-7)^2 + (2*x+5)^2);

n = 4;          % exact match at n = 3

xPts = linspace(2,8,n);

h = (xPts(end)-xPts(1))/2;

y1 = subs(y,x,xPts(1));
yn = subs(y,x,xPts(end));

sum1 = 0;
sum2 = 0;
sum3 = 0;

for i = 2:3:(n-1)
    k1 = 3*subs(y,x,xPts(i));
    sum1 = sum1+k1;
end

for i = 3:3:(n-1)
    k2 = 3*subs(y,x,xPts(i));
    sum2 = sum2+k2;
end

for i = 4:3:(n-1)
    k3 = 2*subs(y,x,xPts(i));
    sum3 = sum3+k3;
end

intg4 = double((3*h/8)*(y1+sum1+sum2+sum3+yn)); 
