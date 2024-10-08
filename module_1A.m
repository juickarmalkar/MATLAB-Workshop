% Scripts
% Module 1A of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Creating a new script file
% command 'edit' in command window

% echo on

R = input('Radius of the circle: ');    % radius of a circle
A = pi*(R^2);                           % area of a circle
C = 2*pi*R;                             % circumference of a circle

disp(R)
disp(A)
disp(C)

% echo off
 
% an editable script can be executed any number of times, each time the variables are appended depending on the input
% outputs can be displayed as is using disp command

%% Task 1

a = input("First number ");
b = input("Second number ");
disp(['The sum of two numbers is ' num2str(a+b)])
disp(['The product of two numbers is ' num2str(a*b)])
