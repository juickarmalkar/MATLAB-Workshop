%% Numerical Methods
% Module 5B of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar

%% Numerical Differentiation

syms z
f_z  = ((z^3)+(2*z^2)-z); 
df_z = diff(f_z,z,1); 

z = linspace(1,7); 
F = subs(df_z,z);

plot(z,F)
hold on

table = readmatrix("num_dataset1.txt");
x = table(:,1);
y = table(:,2);

h = x(2)-x(1);

df_y1 = zeros(length(y)-1,1);
pts1  = zeros(length(x)-1,1);

% forward difference
for i = 1:(length(y)-1)
    df_y1(i) = (y(i+1)-y(i))/h;
    pts1(i)  = x(i);
end
plot(pts1,df_y1)

df_y2 = zeros(length(y)-1,1);
pts2  = zeros(length(x)-1,1);

% backward difference
for j = 2:(length(y)-1)
    df_y2(j) = (y(j)-y(j-1))/h;
    pts2(j)  = x(j);
end
plot(pts2,df_y2)

df_y3 = zeros(length(y)-2,1);
pts3  = zeros(length(x)-2,1);

% central difference
for k = 2:(length(y)-2)
    df_y3(k) = (y(k+1)-y(k-1))/(2*h);
    pts3(k)  = x(k);
end
plot(pts3,df_y3)

xlim([3 7])     % since first few entries are not considered in some schemes

xlabel("Points: 'z'")
ylabel("Values: f_z")
legend("Analytic","Forward","Backward","Central")

% for non uniform grid, h(i) = x(i)-x(i-1)

%% Three point forward difference

syms z
f_z  = ((z^3)+(2*z^2)-z); 
df_z = diff(f_z,z,1); 
z = linspace(1,7); 
F = subs(df_z,z);
plot(z,F)
hold on

table = readmatrix("num_dataset1.txt");
x = table(:,1);
y = table(:,2);

h = x(2)-x(1);

df_y1 = zeros(length(y)-2,1);
pts1  = zeros(length(x)-2,1);

% forward difference
for i = 1:(length(y)-2)
    df_y1(i) = (-3*y(i)+4*y(i+1)-y(i+2))/(2*h);
    pts1(i)  = x(i);
end
plot(pts1,df_y1,'-o')

xlabel("Points: 'z'")
ylabel("Values: f_z")
legend("Analytic","3-pt Forward Difference")

%% Three point backward difference

syms z
f_z  = ((z^3)+(2*z^2)-z); 
df_z = diff(f_z,z,1); 
z = linspace(1,7); 
F = subs(df_z,z);
plot(z,F)
hold on

table = readmatrix("num_dataset1.txt");
x = table(:,1);
y = table(:,2);

h = x(2)-x(1);

df_y1 = zeros(length(y)-2,1);
pts1  = zeros(length(x)-2,1);

% backward difference
for i = 3:(length(y))
    df_y1(i) = (3*y(i)-4*y(i-1)+y(i-2))/(2*h);
    pts1(i)  = x(i);
end
plot(pts1,df_y1,'-o')

xlabel("Points: 'z'")
ylabel("Values: f_z")
legend("Analytic","3-pt Backward Difference")

%% Partial derivatives

syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

surf(X,Y,F)

% [X,Y] = meshgrid(xPts,yPts);
% Z = ((1.5-xPts+xPts.*yPts).^2 + (2.25-xPts+xPts.*yPts.^2).^2 + (2.625-xPts+xPts.*yPts.^3).^2);
% plot3(xPts,yPts,Z,'-o')

%% First derivative wrt x
syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

df_x = diff(f_xy,x,1);

DF_x = zeros(length(xPts),length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        DF_x(i,j) = subs(df_x,[x,y],[xPts(i),yPts(j)]);
    end
end

tiledlayout(2,1);

nexttile
surf(X,Y,DF_x)

% forward difference

X1 = xPts(1:end-1);
Y1 = yPts(1:end-1);

h = xPts(2)-xPts(1);

DF_x1 = zeros(length(xPts)-1,length(yPts)-1);

for i = 1:length(xPts)-1
    for j = 1:length(yPts)-1
        DF_x1(i,j) = (F(i+1,j)-F(i,j))/h;
    end
end

nexttile
surf(X1,Y1,DF_x1)

%% First derivative wrt y
syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

df_y = diff(f_xy,y,1);

DF_y = zeros(length(xPts),length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        DF_y(i,j) = subs(df_x,[x,y],[xPts(i),yPts(j)]);
    end
end

tiledlayout(2,1);

nexttile
surf(X,Y,DF_y)

% forward difference

X1 = xPts(1:end-1);
Y1 = yPts(1:end-1);

h = yPts(2)-yPts(1);

DF_y1 = zeros(length(xPts)-1,length(yPts)-1);

for i = 1:length(xPts)-1
    for j = 1:length(yPts)-1
        DF_y1(i,j) = (F(i,j+1)-F(i,j))/h;
    end
end

nexttile
surf(X1,Y1,DF_y1)

%% Second derivative wrt x 

syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

ddf_x = diff(f_xy,x,2);

DDF_x = zeros(length(xPts),length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        DDF_x(i,j) = subs(ddf_x,[x,y],[xPts(i),yPts(j)]);
    end
end

tiledlayout(2,1);

nexttile
surf(X,Y,DDF_x)

% forward difference

X1 = xPts(2:end-1);
Y1 = yPts(2:end-1);

h = xPts(2)-xPts(1);

DDF_x1 = zeros(length(xPts)-2,length(yPts)-2);

for i = 2:length(xPts)-2
    for j = 2:length(yPts)-2
        DDF_x1(i,j) = (F(i+1,j)-2*F(i,j)+F(i-1,j))/(h^2);
    end
end

nexttile
surf(X1,Y1,DDF_x1) 

%% Second derivative wrt y

syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

ddf_y = diff(f_xy,y,2);

DDF_y = zeros(length(xPts),length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        DDF_y(i,j) = subs(ddf_y,[x,y],[xPts(i),yPts(j)]);
    end
end

tiledlayout(2,1);

nexttile
surf(X,Y,DDF_y)

% forward difference

X1 = xPts(2:end-1);
Y1 = yPts(2:end-1);

h = yPts(2)-yPts(1);

DDF_y1 = zeros(length(xPts)-2,length(yPts)-2);

for i = 2:length(xPts)-2
    for j = 2:length(yPts)-2
        DDF_y1(i,j) = (F(i,j+1)-2*F(i,j)+F(i,j-1))/(h^2);
    end
end

nexttile
surf(X1,Y1,DDF_y1)

%% Mixed Derivative

syms x y

xPts = 1:0.5:10;
yPts = 1:0.5:10;

X = xPts;
Y = yPts;

f_xy = ((1.5-x+x*y)^2 + (2.25-x+x*y^2)^2 + (2.625-x+x*y^3)^2);

F = zeros(length(xPts), length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        F(i,j) = subs(f_xy,[x,y],[xPts(i),yPts(j)]);
    end
end

df_x = diff(f_xy,x,1);
df = diff(df_x,y,1);

DF = zeros(length(xPts),length(yPts));

for i = 1:length(xPts)
    for j = 1:length(yPts)
        DF(i,j) = subs(df,[x,y],[xPts(i),yPts(j)]);
    end
end

tiledlayout(2,1);

nexttile
surf(X,Y,DF)

% forward difference

X1 = xPts(2:end-1);
Y1 = yPts(2:end-1);

h = xPts(2)-xPts(1);
k = yPts(2)-yPts(1);

DF_1 = zeros(length(xPts)-2,length(yPts)-2);

for i = 2:length(xPts)-2
    for j = 2:length(yPts)-2
        DF_1(i,j) = (F(i,j-1)-F(i+1,j)-F(i,j)+F(i+1,j+1))/(2*h*k);
    end
end

nexttile
surf(X1,Y1,DF_1)

%% Differential equation

syms y(t)
Dy = diff(y);
DDy = diff(Dy);

ode = diff(y,t,2) + 3*diff(y,t) + 2*y == 0;

cond1 = y(0) == 1;
cond2 = Dy(0) == 0;
conds = [cond1 cond2];
ySol(t) = dsolve(ode,conds)

% roots of polynomial in an array, use poly command to get polynomial coeff
% vice versa, using roots
