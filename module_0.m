% Getting started with MATLAB Workspace
% Module 0 of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Getting a list of active variables

% command: 'who' gives a list of names of all active variables
% command: 'whos' gives more detailed information
% to get more info regarding type and size of variable, enter each variable name individually

% example:
a = 3;
b = 7;
c = a+b;
d = a*b+c;
e = a*(b+c)

f = 2-3j;
g = 4+5i;

% here we are storing integer 3 in a variable named 'a'
% adding a semicolon at the end of each line of code suppresses the output of that line.
% brackets are used in an expression to force MATLAB to evaluate a particular portion of the expression first.
% run this section, and try out the who command
% use clc to clear the command window. and clear all to clear the workspace history

% use F5 to save and run your script, and Ctrl+Enter to run a particular section

%% Variables in MATLAB

% variable names are case sensitive
% variable names cannot be separated by spaces, use underscores instead
% variable names cannot be a built-in MATLAB function name
% must start with a letter, and punctuations are not allowed

% some special variable names in MATLAB:
% ans: stores results of any commands executed 
% pi: irrational number Pi
% NaN: not a number, output when result of calculation is undefined
% inf: infinity
% i or j: iota for complex numbers

%% Format Types
% format long
% example: tan(30)

% format short
% example: tan(30)

% format rat
% example: tan(30)

% format short e
% format long e
% format debug

% difference between tan and tand, first is in rad, second is in deg

%% Mathematical In-built Functions

% trignometry
% sin, sind
% cos, cosd
% tan, tand
% asin, asind
% acos, acosd
% atan, atand
% sinh, cosh

% general
% sqrt
% exp
% log, log10
% abs
% fix
% floor
% ceil
% round
% mod
% rem

% coordinate transformation
% cart2sph
% cart2pol
% pol2cart
% sph2cart
