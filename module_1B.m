%% Functions
% Module 1B of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% First function
y = root(4);

p = 1:10;
q = root(p);

% sqrt is not a good name for a function since it is inbuilt
% keep names short and informative
% if function is defined in the same script where we call the function, then function is defined at the end

%% Function with multiple outputs

x = 1:10;

[xpow2,xpow3] = xpowers(x);

% XPow = zeros(length(x),2);
% 
% for i = 1:10
%     [xpow2(i),xpow3(i)] = xpowers(i);
%     XPow(i,1) = xpow2(i);
%     XPow(i,2) = xpow3(i);
% end
% 
% disp(XPow)

%% Function with multiple inputs and outputs

x = 1:3;
x1 = x(1);
x2 = x(2);
x3 = x(3);

[y1,y2] = multi(x1,x2,x3)
y1, y2

%% Scalar output from vector input

x = 1:6;
y = sumsq(x)

%% Anonymous Functions

eqn = @(x) 1./(x.^3+3*x.^2-11*x+6);
% we are defining a function in terms of x, the name of function is eqn
% we can now evaluate the function by giving input to eqn, and store in it other variable
a = eqn([2 3 4])

%% Anonymous Functions (Equations)

a = 4;
fn = @(p,q,r) (p.^2).*(q./r);
val1 = fn(23,74,exp(a));
val2 = fn([6 7 8],[99 100 101],pi*a^2);
disp(val1)
disp(val2)

%% function definitions

function op = root(ip)
op = ip.^(1/2);
end

function [pow2,pow3] = xpowers(ip)
pow2 = ip.^2;
pow3 = ip.^3;
end

function [op1,op2] = multi(ip1,ip2,ip3)
op1 = ip1 + max(ip2,ip3);
op2 = (ip1 + ip2 + ip3)/3;
end

function op = sumsq(x)
op = sum(x.^2);
end
