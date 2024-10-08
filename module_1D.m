%% Matrices
% Module 1D of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Example 4: Matrix Definitions

u = [1 2 3 4; 5 6 7 8];

v = [1 2 3 4
    5 6 7 8];

%% Example 5: Scalar-Array Math

g = [1:4
     5:8
    9:12];

h = g-2;
k = g*5;

%% Example 6: Array-Array Math

g = [1:4
     5:8
    9:12];

s = g.^2;

h = [2:2:8
    10:2:16
    18:2:24];

% g and h should be of same order

g+h;
g-h;
2*g-h;      % dot not required
g.*h;

size(g)
size(h)
size(g.*h)

repmat(g,3,4);

%% Example 7: Standard MATLAB Arrays

ones(4);
zeros(6);
eye(3);
rand(7);
rand(5,3);
randi(2,2);
diag(4,6);

%% Example 8: Calling rows and columns, changing data

g = [1:4
     5:8
    9:12];

a = g(:,1);
b = g(2,:);
c = g(2,3);

g(2,3) = 21;

% reshape
