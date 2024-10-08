%% Linear Algebra
% Module 2C of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% Solving a system of linear equations

syms x y z 

eqn1 = 2*x +   y +   z ==   0;
eqn2 =  -x +   y -   z ==   0;
eqn3 =   x + 2*y + 3*z == -10;

eqns = [eqn1
        eqn2
        eqn3];
    
[A,b] = equationsToMatrix(eqns);

sol1 = linsolve(A,b);
sol2 = A\b;
sol3 = (A^-1)*b;
%sol4 = inv(A)*b;

%% Matrix Operations

r = rank(A);
t = A';
d = det(A);
e = double(eig(A));
[V, D] = (eig(A));      % V: matrix of eigenvectors
                        % D: diagonal matrix containing eigenvalues
[L, U] = lu(A);
c = charpoly(A);
[Q, R] = qr(A);         % orthonormal matrix, and upper triangular matrix
tr = trace(A);