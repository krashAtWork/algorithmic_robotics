function [] = toShowGauss2()
%  Consider a Gaussian distribution X ?N(0, 1).
x = (-3:.1:3); % in steps of .1, drawing the x axis array
y = normpdf(x,0,1);
figure(4)
plot(x,y)
title(" Gaussian distribution X - N(0, 1)");
xlabel("domain -3 < x < 3")
ylabel(" p(x) ")




% Generate 3 different set of samples from this distribution for each
% of the three sample sizes N =100,N =1,000,and N =100,000,
a = normrnd(0,1,100,1); % getting 100 samples from a gaussian distribution of mean 0, variance 1
figure(1)
histogram(a, 'normalization', 'pdf');
title(" 100 samples of X - N (0, 1) - histogram - underlying pdf");
xlabel("domain -3 < x < 3")
ylabel(" no. of values")
hold on
%pdf1
y = -3:0.1:3;
mu = 0;
sigma = 1;
f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(y,f,'LineWidth',2)
% **************************

b = normrnd(0,1,1000,1); % getting 1000 samples from a gaussian distribution of mean 0, variance 1
figure(2)
histogram(b,'normalization', 'pdf')
title(" 1000 samples of X - N (0, 1) - histogram - underlying pdf");
xlabel("domain -3 < x < 3")
ylabel(" no. of values")
hold on;
%pdf2
y = -3:0.1:3;
mu = 0;
sigma = 1;
f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(y,f,'LineWidth',2)
% ******************************
c = normrnd(0,1,100000,1); % getting 100000 samples frpm a gaussian distribution of mean 0, variance 1

figure(3)
histogram(c,'normalization','pdf')
title(" 100000 samples of X - N (0, 1) - histogram - underlying pdf");
xlabel("domain -3 < x < 3")
ylabel(" no. of values")
% pdf3
hold on;
y = -3:0.1:3;
mu = 0;
sigma = 1;
f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(y,f,'LineWidth',2)

end

