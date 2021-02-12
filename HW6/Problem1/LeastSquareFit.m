% Written by Ryo at 3 am haha

clear;
clc;
clf;

% I just added random values here.
% You can add as many as you want.
% Make sure to match the format
points = [
    2, 4;
    3, 8;
    4, 10;
    8, 27;
    9, 32;
    12, 87;
    43, 20;
];

% Just getting x and y from the points
x = points(:, 1);
y = points(:, 2);

% we will plot them
plot(x, y, "*")
hold on;

% Setting up A Matrix
for i = 1:length(x)
    degree = length(x);
    A(:, i) = x.^(degree - i);
end

% B is simply y
B = y;

% Plot the function
t = min(x)-5:0.1:max(x)+5;
plot(t, f(A, B, t))


function y = f(A, B, x)
    % ew math
    coeffs = pinv(A) * B;
    degree = length(B);
    y = 0;
    fprintf("%0.0f degree polynomial Function:\n y = ", degree);
    for i = degree-1:-1:0
        y = y + coeffs(degree - i) .* x.^(i);
        fprintf("%0.6f*x^%0.0f + ", coeffs(degree - i), i);
    end
    fprintf("0\n")
end