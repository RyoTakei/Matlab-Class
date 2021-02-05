% Name, ID
% Date
% Rec Time
% Homework 5 Problem 1
% Guided by Ryo Takei, OSU ID 933927846

clc;
clear;
clf;

% Variables we're given
theta = 89; % degrees
g = 9.8; % m/s/s
v_0 = 13.5; % m/s

% Equations we're given
x = @(t)v_0 * t * cosd(theta);
y = @(t)v_0 * t * sind(theta) - 1 / 2 * g * t^2;

%% STEP 1
% Uncomment line 24
% Use fzero to find the roots

% t = fzero(f, guess); 

%% Step 2
% Since we already know t,
% You can plug in t into x.
% Don't forget to print at the end