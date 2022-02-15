% (1.a) Consider the scenario where the robot starts its motion at
% state x0 = [2, 0, ? 2]T, and is given the motion commands u1 =[? 2, ? 2]T
% and u2 =[? 2, ?? 2]T.
% What would be the state of the robot at the two subsequent timesteps,
% namely x1 and x2, if the robot perfectly executes the motion commands,
% i.e., without any motion uncertainties or errors?
% ?t = 1 sec.

theta0 = pi/2; %theta
x0 = [2; 0; theta0];
 global delT ;
 delT = 1;

% u1 = [pi/2, pi/2]; %---> x1
% u2 = [pi/2, -pi/2]; %---> x2

v1 = pi/2;
w1 = pi/2;
v2 = pi/2; 
w2 = -pi/2;

u1 = [v1,w1];
u2 = [v2,w2];

x1 = move(u1, delT, x0);
x2 = move(u2, delT, x1);

scatter(x1(1),x1(2));
scatter(x2(1),x2(2));
hold on ;
draw_curve(x0, u1); 
draw_curve(x1, u2);
hold on;


% x1 = x0 + [(-v1/w1)* sin(theta0) + (v1/w1)*sin(theta0 + (w1* delT)); 
%             (v1/w1)* cos(theta0) - (v1/w1)*cos(theta0 + (w1* delT));
%                 w1*delT ] %checkAns
% theta1 = x1(3,1);

% x2 = x1 + [(-v2/w2)* sin(theta1) + (v2/w2)*sin(theta1 + (w2* delT)); 
%             (v2/w2)* cos(theta1) - (v2/w2)*cos(theta1 + (w2* delT));
%                 w2*delT ] 
            
function [xn] = move(u1, delT , xp)
    xn = xp + [(-u1(1)/u1(2))* sin(xp(3)) + (u1(1)/u1(2))*sin(xp(3)+ (u1(2)* delT)); 
            (u1(1)/u1(2))* cos(xp(3)) - (u1(1)/u1(2))*cos(xp(3) + (u1(2)* delT));
                u1(2)*delT ]; %checkAns
end
            
 function [] = draw_curve(initLoc, u1)

    global delT;
    preLoc = initLoc;
    n = 10;
    for i = 1:n
        postLoc = move(u1, 1/n * delT, preLoc);
        line([preLoc(1), postLoc(1)], [preLoc(2), postLoc(2)], 'Color','black');
        preLoc = postLoc;
    end
end           
            



            



% plot([x0(1),x1(1)],[x0(2),x1(2)]);
% hold on ;
% plot([x1(1),x2(1)],[x1(2),x2(2)]);




% To do :
%checkAns, %visual represenation
            
            



