x = (-5:.1:5); % in steps of .1, drawing the x axis array
y1 = normpdf(x,0,1); % n1
y2 = normpdf(x,2,0.5); %n2
plot(x,y1)
hold on;
plot(x,y2)
hold on;

% combo of n1 and n2
z = 0.3*y1 + 0.7*y2;
plot(x,z)

hold on;
title(" Combination of two normal distributions");
xlabel("domain -5 < x < 5")
ylabel(" p(x) ")
legend({'y1 = normpdf(x,0,1)','y2 = normpdf(x,2,0.5)', 'z =0.3*y1 + 0.7*y2 '},'Location','southwest')

hold on;

% Generate the samples from this distribution using the sample size of N = 100,000, 
n = 100000;
samples = zeros(1,n);
for i = 1:n
    r = randn();
    
    if r < 0.3
        sample03 = normrnd(0,1,1,1);
        samples(i) = sample03;
    else 
        sample07 = normrnd(2,0.5,1,1);
        samples(i) = sample07;
    end
    
    
    
end

% then construct the resulting histogram. Plot the resulting histogram and the underlying probability density function. 
histogram(samples,'normalization','pdf');
% k=10;
% y = randsample(z,length(x))

% R = random(z)
% plot(y, z)
% z1 = zeros(100000,1 );
% for i=1: length(x)
%     m = x(i);
%     z1(i) = z(m);
% end
% plot(z1(i))
