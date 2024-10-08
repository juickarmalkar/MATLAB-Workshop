% Graphics
% Module 4 of MATLAB Workshop: Journey from Beginner to Intermediate Level
% Author: Jui Charudatt Karmalkar, Abhishek Sokhal

%% plot a polynomial
% inputs to plot command must have same length
x = -3:0.2:3;                   % initialize a vector x
y = x.^2+7*x-3;                 % define polynomial in terms of x
plot(x,y,'-o','LineWidth',2)    
% syntax(#var_x, #var_y, #line type & marker shape, #line width)
grid on
xlabel("X Axis")                % specify label for X Axis
ylabel("Y Axis")                % specify label for Y Axis
legend("Polynomial")            % legend, useful for multiple plots

%% plot a polynomial with more inputs
x = 0:pi/20:pi;                     % initialize vector
n = length(x);                      % store length of vec in a var
r = 1:n/7:n;                        % new vec to store specific values
y = x.^2+3;                         % define polynomial
plot(x,y,'b',x(r),y(r),'r*')        
% syntax(#var_x, #var_y, #line color, #plot points in vec r, and label them with red color * sign)
axis([-pi/3 pi+pi/3 -1 15])
% syntax(#start_x, #end_x, #start_y, #end_y)
xlabel('X Axis')
ylabel('Y Axis')
title('Plot of Polynomial','FontSize',18)   % specify font size to title
text(pi/10,0,'\alpha=\beta^2')      % add text to plot, first two entries are coord of location of text, text is specified in quotes

%% log and semilog plot
% inputs to plot command must have same length
x = 3:0.2:9;                    % initialize a vector x
y = x.^2+7*x-3;                 % define polynomial in terms of x
figure(1)
loglog(x,y,'-square')           % log-log plot
xlabel('X Axis')
ylabel('Y Axis')
title('Log scale on X-Y Axis')
figure(2)
semilogx(x,y,'-diamond')        % log plot for x-axis
xlabel('X Axis')
ylabel('Y Axis')
title('Log scale on X Axis')
figure(3)
semilogy(x,y,'-hexagram')       % log plot for y-axis
xlabel('X Axis')
ylabel('Y Axis')
title('Log scale on Y Axis')

%% contours and surfaces
x = linspace(-pi/2,pi/2,40);    % initialize a vector
y = x;                          % set vec y equal to x
[X,Y] = meshgrid(x,y);          % generate a grid of x and y
f = sin(X.^2-Y.^2);             % function in terms of x and y
figure(1)
contour(X,Y,f,20)               % plain contour plot
figure(2)
contourf(X,Y,f,20)              % filled contour plot
figure(3)
surf(X,Y,f)                     % surface plot

%% multiple plots in same figure
x = -pi:pi/20:pi;
plot(x,sin(x),'r-','LineWidth',2)
hold on
plot(x,cos(x),'b:','LineWidth',2)
plot(x,tan(x),'g-.','LineWidth',2)
hold off
axis([-4 4 -4 4])
grid on
xlabel('Values of x')
ylabel('sin(x),cos(x),tan(x)')
title('Plot of Trignometric Functions')
legend("sin(x)","cos(x)","tan(x)")

%% tiled plots
x = -pi:pi/20:pi;
tiledlayout(3,1);
nexttile
plot(x,sin(x),'r-','LineWidth',2)
nexttile
plot(x,cos(x),'b:','LineWidth',2)
nexttile
plot(x,tan(x),'g-.','LineWidth',2)
