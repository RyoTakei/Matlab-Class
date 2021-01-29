function [SOut, IOut, ROut] = DiseaseStep(SIn, IIn, RIn, N, a, b, h)
%% Step 1
% Those equation was given in week 1. 
% All you need to do is to calculte new S, I, R using 
% SIn, IIn, RIn. 

% All the equations given
% dS = (-a * S * I) / N
% dI = (a * S * I) /  N - I / b
% dR = I / b
% N = S + I + R

% To update the numbers:
% S_1 = S_0 + dS * td
% for all S, R, I
end

