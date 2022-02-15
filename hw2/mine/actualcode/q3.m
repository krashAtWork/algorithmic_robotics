% In this section,you will need to implement the beam-based measurement model(Section 6.3 ofPR)
% of the mobile robot with state space represented by (x, y, ?).
% The initial state of the robot is given as x0 = [2,0, ? 2]T.
% Suppose there is a continuous wall at m ={(x, y)|x?[0,3], y = 3},
% and the robot has a beam-based range sensor with bearing angle equal
% to the heading of the robot and a maximum range of 5. 
% The range sensor’s noise parameters are given as: ?2 hit = 0.05,
% ?short = 0.05, [zhit,zshort,zmax,zrand] = [0.8,0.05,0.05,0.1].
% Using the velocity motion model with the motion command u1 = [v, w]T = [0.5, 0]T,
% compute the “true” distance or range z? 1 of the wall measured by the beam zt2 
% and generate a plot of the probability density function p(z1| ¯ x1, m)
% of the proximity sensor measurement (you can refer to Figure 6.4). 
% Given u2 = [0.2, 0.76]T, similarly compute the “true” range z? 2, and plot p(z2 | ¯ x2, m).

x0 = [2, 0, pi/2]'
u1 = [0.5, 0];
u2 = [0.2, 0.76];

zhit = 0.8;
zshort = 0.05;
zmax = 0.05;
zrand= 0.1;
delT = 1;
z= [zhit, zshort, zmax, zrand];
x1 = move(u1, delT , x0)


% calculate position of robot with x0, and u1 using velocity motion model
% in question 1a -> single value -> Z1*
% in question 1b -> multiple values -> Z1k with k values




function [xn] = move(u1, delT , xp)

    xn = xp + [(-u1(1)/u1(2))* sin(xp(3)) + (u1(1)/u1(2))* sin(xp(3)+ (u1(2)* delT)); 
            (u1(1)/u1(2))* cos(xp(3)) - (u1(1)/u1(2))* cos(xp(3) + (u1(2)* delT));
                u1(2)*delT ]; %checkAns
end
















