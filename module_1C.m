%% Arrays
% Module 1C of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Example 1: Compute values of any polynomial for some range

% there exist infinite number of points in the said range
% hence, we divide the range into some finite number of points
% this is called sampling a function
% Let the polynomial be 3*x^2-5*x+11
% we can compute this polynomial for any x
% let us assume the range from x=2 to x=15

% step 1: create the range of x
x = 2:1:15;                         % x goes from 2 to 15 in steps of 1

% step 2: define the polynomial in terms of x
%y = 3*x^2-5*x+11        
% above code must give errors, as we are not implementing dot airthmetics, which is essential for array operations

y = 3*(x.^2)-5*x+11;
% this is correct, dot is provided only for operations on x, it is not required for operations with scalars

% vary the step in creating array

% indexing

x(1);
x(end);
x(end-1);
y(1);
y(5);

% access a portion of array
x(2:6);
y(5:end);

% ascending order with varying step
x(3:2:end);

% descending order with varying step
y(end-1:-1:2);

% index must be a real positive integer

%% Example 2: Compute values of any trignometric function

p = (0:0.1:1)*pi;
% (start_pt,step,end_pt)

%q = linspace(0,1,0.5)*pi;

q = linspace(0,pi,11);
% (start_pt,end_pt,num_of_steps)

m = logspace(0,5,50);
% (start_exp,end_exp,num_of_steps)

length(p)
size(q)

%% Example 3: Column arrays

% above two methods will construct row vectors or row arrays
a = (1:2:20)';
e = a.';

b = [2;4;6;8;10];

