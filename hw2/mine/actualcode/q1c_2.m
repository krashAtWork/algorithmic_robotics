function [] = q1c_2()

% find the nominal point after ut
theta0 = pi/2; %theta
x0 = [2; 0; theta0];
 global delT ;
 delT = 1;

 v1 = pi/2;
w1 = pi/2;
v2 = pi/2; 
w2 = -pi/2;

u1 = [v1,w1];
u2 = [v2,w2];

x1 = move(u1, delT, x0);
% x2 = move(u2, delT, x1);

draw_curve(x0, u1); 
% draw_curve(x1, u2);
hold on;

alpha1 =   [0.0001, 0.0001, 0.01, 0.0001, 0.0001, 0.0001]; 
alpha2 =  [0.005, 0.005, 0.0001, 0.0001, 0.0001, 0.0001];        

          
            

% draw the grid around the nominal point

figure(2);
step = 0.02;
tmp_x = -1:step:2; % making the x direction steps
tmp_y = 0:step:3; % making the y direction steps
tmp_z = zeros(length(tmp_x), length(tmp_y));
th = (1:360)*(2*pi/360);
old_location = [2, 0, pi/2];
for i = 1:length(tmp_x)
    for j = 1:length(tmp_y)
        prob = 0;
        for k = 1:length(th)
            curr_loc = [tmp_x(i), tmp_y(j), th(k)];
            prob = prob + motion_model_velocity(curr_loc,u1,old_location,alpha2);
        end
        tmp_z(i, j) = prob;
    end
end



figure(3);
[Y,X] = meshgrid(tmp_y,tmp_x);
Z = tmp_z;
pcolor(X, Y, Z);
shading interp;
colormap(flipud(gray))
hold on;
draw_curve(x0, u1); 
hold off;
end


function [output] = motion_model_velocity(x_c, u, x_old, alpha)
    global delta_t;
    x = x_old(1);
    y = x_old(2);
    theta = x_old(3);
    x_prime = x_c(1);
    y_prime = x_c(2);
    theta_prime = x_c(3);
    v = u(1);
    w = u(2);
    alpha_1 = alpha(1);
    alpha_2 = alpha(2);
    alpha_3 = alpha(3);
    alpha_4 = alpha(4);
    alpha_5 = alpha(5);
    alpha_6 = alpha(6);
    
    miu = 1/2 * ((x-x_prime)*cos(theta)+(y-y_prime)*sin(theta))/((y-y_prime)*cos(theta)-(x-x_prime)*sin(theta));
    x_star = (x+x_prime)/2 + miu * (y-y_prime);
    y_star = (y+y_prime)/2 + miu * (x_prime-x);
    r_star = sqrt((x-x_star)^2+(y-y_star)^2);
    delta_theta = atan2(y_prime-y_star, x_prime-x_star) - atan2(y-y_star, x-x_star);
    v_hat = delta_theta/delta_t*r_star;
    w_hat = delta_theta/delta_t;
    gamma_hat = (theta_prime-theta)/delta_t - w_hat;  
    p1 = prob(v-v_hat, alpha_1*v^2+alpha_2*w^2);
    p2 = prob(w-w_hat, alpha_3*v^2+alpha_4*w^2);
    p3 = prob(gamma_hat, alpha_5*v^2+alpha_6*w^2);
    output = p1*p2*p3;
end

function [xn] = move(u1, delT , xp)
    xn = xp + [(-u1(1)/u1(2))* sin(xp(3)) + (u1(1)/u1(2))*sin(xp(3)+ (u1(2)* delT)); 
            (u1(1)/u1(2))* cos(xp(3)) - (u1(1)/u1(2))*cos(xp(3) + (u1(2)* delT));
                u1(2)*delT ]; %checkAns
end

            
 function [] = draw_curve(initLoc, u1)
    delT= 1;
    preLoc = initLoc;
    n = 10;
    for i = 1:n
        postLoc = move(u1, 1/n * delT, preLoc);
        line([preLoc(1), postLoc(1)], [preLoc(2), postLoc(2)], 'Color','black');
        preLoc = postLoc;
    end
 end 

