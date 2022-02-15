function [ansr] = prob(a, var)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
ansr =  (1/sqrt(2*pi*var))* exp(-0.5*(a)^2/var);
end

