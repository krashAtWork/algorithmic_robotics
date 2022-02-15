

function [f1]= q1b_2(ut0, xp, alpha)



% input def

% theta = pi/2; %theta
% xp = [2; 0; theta];
% ut = [pi/2,pi/2];
% alpha = [0.0001, 0.0001, 0.01, 0.0001, 0.0001, 0.0001] 
% alpha = [0.005, 0.005, 0.0001, 0.0001, 0.0001, 0.0001]

%  output def

n = 1000;
f1 = zeros(n, 3);
f2 = zeros(n, 3);

for i = 1:1:n
    
    xn =[0,0,0];
    xo = xp(1);
    yo = xp(2);
    thetao = xp(3);
    delT = 1 ;

%     building an error array
    errorArray = sample_error(ut0,alpha);
    
    vcp  = ut0(1) + errorArray(1,1);
    wcp = ut0(2) + errorArray(2,1);
    ycp = errorArray(3,1);


    xn(1,1) = xo  + (-vcp/wcp)* sin(thetao) + (vcp/wcp)*sin(thetao + (wcp* delT)); 
    xn(1,2) = yo  + (vcp/wcp)* cos(thetao) - (vcp/wcp)*cos(thetao + (wcp* delT));
    xn(1,3) = thetao  +  wcp*delT  + ycp*delT ;
    f1(i,1) = xn(1,1);
    f1(i,2) = xn(1,2);
    f1(i,3) = xn(1,3);
end

ut1 = [pi/2, -pi/2];
for j=1:1:n
    errorArray = sample_error(ut1,alpha);
    vcp1  = ut1(1) + errorArray(1,1);
    wcp1 = ut1(2) + errorArray(2,1);
    ycp1 = errorArray(3,1);
    thetao = f1(j,3);
    f2(j,1) = f1(j,1) + (-vcp1/wcp1)* sin(thetao) + (vcp1/wcp1)*sin(thetao + (wcp1* delT));
    f2(j,2) = f1(j,2)  + (vcp1/wcp1)* cos(thetao) - (vcp1/wcp1)*cos(thetao + (wcp1* delT));
    f2(j,3) = thetao  +  wcp1*delT  + ycp1* delT ;
    
    
end


%mapping X1 and X2 and original noiseless solution



x1vals = zeros(n,1);
x2vals = zeros(n,1);
RGB = [204 204 255]/256 ;
for m = 1:1:n
     x1vals(m) = f1(m,1);
     x2vals(m) = f2(m,1);     
end

y1vals = zeros(n,1);
y2vals = zeros(n,1);

for m = 1:1:n
   y1vals(m) = f1(m, 2);
   y2vals(m) = f2(m, 2);
end 
   sz = 10;
   scatter(x1vals, y1vals, sz, 'filled')
   hold on;
   scatter(x2vals, y2vals, sz,RGB, 'filled')
   hold on;
   

end


