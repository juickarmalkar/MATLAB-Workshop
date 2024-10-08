% Interpolation 
% Module 5A of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar

%% Cubic Spline Interpolation
% fit the data with a cubic polynomial, so that we get a smooth curve
% yInterpolated = spline(xData,yData,XVal)
% xData, yData are nx1 data vectors
% to calculate data at intermediate points

tab4 = importdata("dataset4.txt");
x = tab4(:,1);
y = tab4(:,2);

% create a vector of intermediate points where we wish to get Temp
pts = [2.3, 4.8, 5.6, 6.3, 7];
y_Interpolated1 = spline(x,y,pts);

%% Piecewise Cubic Hermite Polynomial
% yInterpolated = pchip(xData,yData,XVal)

tab4 = importdata("dataset4.txt");
x = tab4(:,1);
y = tab4(:,2);

pts = [2.3, 4.8, 5.6, 6.3, 7];
y_Interpolated2 = pchip(x,y,pts);

%% Polyfit to fit nth degree polynomial through (n+1) data points

% plot of function
p = linspace(1,5);
q = log(p);
plot(p,q,'LineWidth',1.5)

hold on

% num of points = 20
table4 = readmatrix("dataset4.txt");
x4 = table4(:,1);
y4 = table4(:,2);

% using command polyfit
func = polyfit(x4,y4,2);        % output of func is only 5 values
eval = polyval(func,x4);        % evaluate function for all xData points in x4
plot(x4,eval,'-o','LineWidth',1.25)

% value at some intermediate point, say x = 2.7
val = polyval(func,2.7);

legend("function","polyfit")
xlabel("Points: 'x'")
ylabel("Values: 'y'")
title("Lagrange Polynomial Interpolation")

%% Hand code: Lagrange Polynomial Interpolation

% plot of function
p = linspace(1,5);
q = log(p);
plot(p,q,'LineWidth',1.5)

hold on

syms z

% num of points = 5
table1 = readmatrix("dataset1.txt");
x1 = table1(:,1);
y1 = table1(:,2);
f_z1 = 0;
for i = 1:length(y1)
    prod1 = y1(i);
    for j = 1:length(x1)
        if i~=j
            prod1 = prod1*(z-x1(j))/(x1(i)-x1(j));
        end
    end
    f_z1 = f_z1 + prod1;
end
poly1 = zeros(length(y1),1);
for i = 1:length(y1)
    poly1(i) = subs(f_z1,x1(i));
end
plot(x1,poly1,'-o','LineWidth',1.25)
 
% num of points = 20
table4 = readmatrix("dataset4.txt");
x4 = table4(:,1);
y4 = table4(:,2);
f_z4 = 0;
for i = 1:length(y4)
    prod4 = y4(i);
    for j = 1:length(x4)
        if i~=j
            prod4 = prod4*(z-x4(j))/(x4(i)-x4(j));
        end
    end
    f_z4 = f_z4 + prod4;
end
poly4 = zeros(length(y4),1);
for i = 1:length(y4)
    poly4(i) = subs(f_z4,x4(i));
end
plot(x4,poly4,'-square','LineWidth',1.25)

legend("function","n=5","n=20")
xlabel("Points: 'x'")
ylabel("Values: 'y'")
title("Lagrange Polynomial Interpolation")
