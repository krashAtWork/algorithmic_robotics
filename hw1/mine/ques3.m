% drawing custom distribution
x = (-2 :0.001: 2);
y = zeros(length(x));
for i = 1: length(x)-1
    if  x(i) >=-1 && x(i) <=1
           y(i) = abs(x(i));
           
    else
           y(i) = 0;            
    end 
    
end
plot(x,y);
title("Prob 3 distribution");
xlabel("domain -2 < x < 2")
ylabel(" p(x) ")
hold on;

% make a uniform distribution between -2 and 2
a = unifrnd(-2, 2, 100,1);
b = rand(1,100);

scatter(a,b);


% for all (a,b) under the pd allow the points to be, reject everything else







    

