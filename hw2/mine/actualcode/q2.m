function [] = q2()

%input deifinition
X0 = [2, 0, pi/2]';
Xb0 = [1,0,0];
Xb1 = [3, -1, -1.571];
Ut1 =[Xb0 ; Xb1];
Ut2 = [3, -1, -1.571; 3, -2, 0 ];
Xf1 = move_odo(Ut1, X0)
Xf2 = move_odo(Ut2 , Xf1)

%plotting
title('noiseless odometry trajectory');
scatter(X0(1),X0(2));
hold on ;
scatter(Xf1(1),Xf1(2));
hold on;
scatter(Xf2(1),Xf2(2));

plot([X0(1),Xf1(1)],[X0(2),Xf1(2)]);
hold on ;
plot([Xf1(1),Xf2(1)],[Xf1(2),Xf2(2)]);
hold on;

end

function[Xf]= move_odo(u, Xi)
        Xb_current = u(1:1,:); %current;
        Xb_future = u(2:2,:) ;        
        future_y = Xb_future(2);
        future_x =  Xb_future(1);        
        current_y = Xb_current(2);
        current_x = Xb_current(1);
        future_theta = Xb_future(3);
        current_theta = Xb_current(3);
        
% inputNourishing
% del_rot1 = atan2(future-current,yx) - thetacurrent
        del_rot1 = atan2(future_y - current_y, future_x - current_x) - current_theta;
        del_rot2 = future_theta - current_theta - del_rot1;
        del_trans = sqrt((future_x - current_x)^2 + (future_y -current_y)^2); %2.236

% % adding noise
        del_rot1_cp = del_rot1 ;
        del_rot2_cp = del_rot2 ;
        del_trans_cp = del_trans ;
% 
% % determing output X1
        Xf(1,1)= Xi(1) + (  del_trans_cp * cos( Xi(3)  + del_rot1_cp ) ) ;
        Xf(1,2)= Xi(2) + (  del_trans_cp * sin( Xi(3) + del_rot1_cp ) );
        Xf(1,3)= Xi(3) + del_rot1_cp + del_rot2_cp ;
        
end

% future_y = Xb1(2);
% future_x =  Xb1(1);
% current_x = Xb0(1);
% current_y = Xb0(2);
% future_theta = Xb1(3);
% current_theta = Xb0(3);
% % inputNourishing
% % del_rot1 = atan2(future-current,yx) - thetacurrent
% del_rot1 = atan2(future_y - current_y, future_x - current_x) - current_theta;
% del_rot2 = future_theta - current_theta - del_rot1;
% del_trans = sqrt((future_x - current_x)^2 + (future_y -current_y)^2); %2.236
% 
% % % adding noise
% del_rot1_cp = del_rot1 ;
% del_rot2_cp = del_rot2 ;
% del_trans_cp = del_trans ;
% % 
% % % determing output X1
% Xf1(1,1)= X0(1) + (  del_trans_cp * cos( X0(3)  + del_rot1_cp ) ) ;
% Xf1(1,2)= X0(2) + (  del_trans_cp * sin( X0(3) + del_rot1_cp ) );
% Xf1(1,3)= X0(3) + del_rot1_cp + del_rot2_cp ;





% Xb1 = Ut2(1:1,:); %current
% Xb2 = Ut2(2:2,:); %future
% 
% % inputNourishing
% % del_rot1 = atan2(future-current,yx) - thetacurrent
% del_rot1 = atan2(Xb2(2) - Xb1(2), Xb2(1) -Xb1(1)) - Xb1(3);
% del_rot2 = Xb2(3) - Xb1(3) - del_rot1;
% del_trans = sqrt((Xb2(1) - Xb1(1))^2 + (Xb2(2) - Xb2(2))^2); 
% 
% % % adding noise
% del_rot1_cp = del_rot1;
% del_rot2_cp = del_rot2;
% del_trans_cp = del_trans;
% 
% % % determing output X2
% Xf2(1,1)= Xf1(1) + (del_trans_cp * cos(Xf1(3) + del_rot1_cp)); 
% Xf2(1,2)= Xf1(2) + (del_trans_cp * sin(Xf1(3) + del_rot1_cp));
% Xf2(1,3)= Xf1(3) + del_rot1_cp + del_rot2_cp ;
