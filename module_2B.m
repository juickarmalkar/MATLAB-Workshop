%% Loops
% Module 2B of MATLAB Workshop: Journey from Beginner to Intermediate
% Author: Jui Charudatt Karmalkar

%% For Loop

%% Example 1

n = 5;
for i = 1:n
    disp([int2str(i) ' squared equals ' int2str(i^2)])
end

%% Example 2

total = 0;
for n = 1:6
    total = total + 2^n;
end
disp(total)

%% Example 3

for i = 1:3
    for j = 1:3
        a(i,j) = i+j;
    end
end
disp(a)

%% Example 4
for i = 5:-1:1
    a(i) = i+2;
end
disp(a)

%% While Loop

%% Example 5
total = 0;
i = 4;
while i<5
    total = total+i;
    i = i+1;
end
disp(total)

% i=2, then 3 then 4, and total becomes 9

%% If-Else-End

%% Example 6

x = 1;
if x >= 0 && x <= 1
    f = x;
elseif x > 1 && x <= 2
    f = 2-x;
else
    f = 0;
end
disp(f)
