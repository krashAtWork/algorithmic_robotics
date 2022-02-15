function [] = toShowUniform2()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% (P2)Consider a Uniform distribution X ?U(0,1.5). 
% 
% pd = makedist('Uniform','lower',0,'upper',1.5);
% x = -3:.01:3;
% figure(4);
% plot(pd,x);
% figure;
% stairs(x,pdf1,'r','LineWidth',2);
% pd3 = makedist('Uniform','lower',-2,'upper',1);


% Generate 3 different set of samples from this distribution
% for each of the three sample sizesN =100,N =1,000,andN =100,000,

% Generate 100 samples
a = unifrnd(0, 1.5, 100,1);
figure(1)
histogram(a,'normalization','pdf')
title(" Uniform distribution with for 100 samples");
xlabel("domain 0 < x < 1.5")
ylabel(" p(x) =0.67 ")
hold on;
y = 0:0.1:1.5;
a = 0;
b = 1.5;
f = (1 /(b - a)).*ones(length(y),1); % for every x there should be a y
plot(y,f,'LineWidth',2);


% Generate 1000 samples
b = unifrnd(0, 1.5, 1000,1);
figure(2)
histogram(b,'normalization','pdf')
title(" Uniform distribution with for 1000 samples");
xlabel("domain 0 < x < 1.5")
ylabel(" p(x) =0.67 ")
hold on;
y = 0:0.1:1.5;
a = 0;
b = 1.5;
f = (1 /(b - a)).*ones(length(y),1) ;% for every x there should be a y
plot(y,f,'LineWidth',2)

% Generate 100000 samples
c = unifrnd(0, 1.5, 100000,1);
figure(3)
histogram(c,'normalization','pdf')
title(" Uniform distribution with for 100000 samples");
xlabel("domain 0 < x < 1.5")
ylabel(" p(x) =0.67 ")
hold on;
y = 0:0.1:1.5;
a = 0;
b = 1.5;
f = (1 /(b - a)).*ones(length(y),1);
plot(y,f,'LineWidth',2)
%     and construct the corresponding histograms.

% Plot the resulting histograms and the underlying probability density function. 


end

