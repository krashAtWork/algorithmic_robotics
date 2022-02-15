% % )ConsideraGaussiandistributionX?N(1, 0.5)with the domainof[?3, 3
% generateitshistogramh(X)using sample size of N = 100,000. 
% For any x?X, there is a nonlinear transformation y = x2,
% what is the histogram of Y? Show your results of the histogram of X
% and the histogram of Y. Set the sample size N = 1,000,
% generate the histogram of X and the histogram of Y,
% then plot their corresponding density distribution 
% based on the samples of X and Y (you can use ”line” function to
% mark the density distribution, an example is given below).

%domain [-3,3]
x = (-3 : 0.1 : 3);
y = normpdf(x,1,0.5);

figure(1);
plot(x,y);

% generateitshistogramh(X)using sample size of N = 100,000. 

n1 = 100000;
a = normrnd(1,0.5,n1,1);
b = zeros(n1,1);
b1 = zeros(n1,1);
histogram(a);
title(" histogram of X,N =100000, with pd = N(1,0.5)");
xlabel("domain -3 < x < 3")
ylabel(" no.of values ")

% density distribution for a
figure(3)
n2 = 100;
a1 = normrnd(1,0.5,n2,1);
line([a1 a1],[0 0.5],'color','blue');

% b=a^2
for i=1: length(a)
   b(i) = a(i)^2;
end
figure(2);
histogram(b,'Normalization','probability');
title(" histogram of X,N =100000, y = x^2");
xlabel("domain -3 < x < 3")
ylabel(" no.of values ")

% density distribution for b
figure(4);
for i=1: length(a1)
   b1(i) = a1(i)^2;
end
line([b1 b1],[0 0.5],'color','blue');







