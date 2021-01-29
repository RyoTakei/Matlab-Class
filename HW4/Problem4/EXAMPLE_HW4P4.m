% Name, ID
% Date
% Rec Time
% Homework Problem 4
% Guided by Ryo Takei, OSU ID 933927846

clear;
clc;
clf;

% Setting up constants
a = 10; % contacted rate
b = 1.25; % days infectious
td = 0.05; % day. time delta
numOfLoops = 140; % 140 loops, per instruction
numDays = numOfLoops * td; % delta * loops = days 


S = 0:500:2000; % Starting S values.
R = []; % people recoveed
I = ones(1, length(S)) * 100; % people infected

% set N as N stays the same
N = I + R + S;

%% Step 1
% Make a for loop to go through each S value.
% You'll get arrays back from DiseaseSimulate.
% Plot them right away using plot(). 
% DO NOT forget subplot and hold on.


%% Step 2
% Using for loop below, make the graph pretty.
% In here, you will need to do
% - xlabel() and ylabel()
% - legend()
% - ylim()
% - Other thing you think you need
titleName = {'Susceptibles', 'Infected', 'Recovered', 'Total'};
for k = 1:4
    % … (labels, axes, legend for the subplot)
    title(strcat(titleName{k}, ' versus time') );
end




