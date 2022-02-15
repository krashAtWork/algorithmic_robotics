% In this section, you will need to implement the landmark-based measurement model 
%  for a mobile robot with state space represented by (x, y, ?).
% The initial state of the robot is given as x0 = [2,0, ?/2]T.
% Suppose the robot is equipped with range and bearing sensors.
% A set of discrete landmarks with coordinates markedasm=[m1, m2, m3, m4]
% existintheworld.
% Thegloballocationofeachlandmarkaregivenas m1 =[1, 1]T, m2 =[2, 1]T,m3 =[3, 2]T,m4 =[2, 4]T.
% Thesizeoflandmarksaresmallenoughtobeignored.
% Thelandmarksare assumed to be uniquely identi?able, and as such,
% the correspondence between the landmarks and measurements are assumed to be known. 
% The sensor reading report feature vectors of the form zi t = (ri t, ?i t),
% where ri t and ?i t are the range and bearing of the i-th landmark at time t. 
% The standard deviations of the measurement uncertainty of the range and bearing 
% measurements (as de?ned in Equation 6.40 of PR) are given as?r =0.3 and?? =0.5. 
% The errorsinbearingandrangemeasurementsandmeasurementsfordifferentlandmarksareassumedbeconditionally 
% independent, given the state of the robot and the map.
% At x0, the sensor reports two valid readings z0 ={z1 0, z2 0}={ (1.6213,2.430), (1.1270,1.4140) }.
% What is the likelihood, p(z0 |x0, m), for this set of sensor readings? During the next time step,
% the robot moves following the velocity motion model with the motion command u1 = [v, w]T = [1.2, ?1.0]T. 
% Following this motion, at state x1, the sensor reports two valid readings z1 ={z2 1, z3 1}= {(0.5100,?2.6801), (1.0270,1.405)}.
% What is the likelihood, p(z1 | ¯ x1, m), of this new set of sensor readings, z1?


function [] = q4()
% input definition
% x0, m, z, u

m1 =[1, 1]';
m2 =[2, 1]';
m3 =[3, 2]';
m4 =[2, 4]';

% first iteration input
X0 = [2,0, pi/2]';
z01 =[1.6213,2.430];
z02 =[1.1270,1.4140];
z0 =[z01, z02]; 

% second iteration input
v1= 1.2;
w1= -1.0;
u1 = [v1, w1]';
X1 = nominalMotion(u1,X0);
z12 = [0.5100,-2.6801];
z13 = [1.0270,1.405];
z1 =[z12,z13];




% output definition
% probability(z0|x0,m)
ans1 = landmark_detection_model(z01,X0,m1)* landmark_detection_model(z02,X0,m2)
% probability(z1|x1,m)
% u1 : X0 -> X1
ans2 = landmark_detection_model(z12,X1,m2)* landmark_detection_model(z13,X1,m3)


    
end

function [reqProb] = landmark_detection_model(z,X,m)
%     input form 
%     z -> [d,a]
      d = z(1);
      a = z(2);      
%     X -> [x, y, theta]
      x = X(1);
      y = X(2);
      theta = X(3);
%     m -> [mx, my]
      mx = m(1);
      my = m(2);
      % noise parameters
      sigmaR = 0.3;
      sigmaPhi = 0.5;
  
    dCp = sqrt((mx - x)^2 + (my - y)^2);
    alphaCp =  atan2(my - y,mx - x) - theta;
    pDet = prob(dCp - d, sigmaR^2)* prob(alphaCp - a, sigmaPhi^2);
    Zdet = 1;
    reqProb = Zdet * pDet;
    
    
end

function [Xf] = nominalMotion(u,Xi)
u
Xi
% x = 2;
% y = 0;
% theta = pi/2;
% v = pi/2;
% w = pi/2;
global delta_t;
delta_t = 1;
% old_location = [x, y, theta];
% miu = [v, w];
Xf = Xi + [-u(1)/u(2) * sin(Xi(3)) + u(1)/u(2) * sin(Xi(3) + u(2) * delta_t); u(1)/u(2) * cos(Xi(3)) - u(1)/u(2) * cos(Xi(3) + u(2) * delta_t); u(2) * delta_t]


end

