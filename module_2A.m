% Elementary Operations
% Module 2A of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Relational Operations

%% Example 1
A = 20:-2:2;
B = 24:-1:15;

a = A>4;        % A and B are arrays of same size
% positions where A>4, ones appear, rest are zero
% positions where A==B, ones appear, rest are zero

b = (A==B);
% output of a and b is telling us which positions in array satisfy the relation

%% Logical Operations

%% Example 2

A = 20:-2:2;
B = 24:-1:15;

c = (A>2) & (A<18)
d = ~(B==A);

%% Example 3
a = 0;
b = 2;
a == 0 || b~=1
a == 0 && b==1
