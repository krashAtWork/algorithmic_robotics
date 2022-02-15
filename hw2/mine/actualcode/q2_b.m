function [] = q2_b()
% X0 = [2, 0, pi/2]'
% Xb0 = [1,0,0];
% Xb1 = [3, -1, -1.571];
% Ut =[Xb0 ; Xb1]

%input deifinition
n = 1000;
X0 = [2, 0, pi/2]';
Xb0 = [1,0,0];
Xb1 = [3, -1, -1.571];
Ut1 =[Xb0 ; Xb1];
Ut2 = [3, -1, -1.571; 3, -2, 0 ];
alpha1 = [0.01, 0.002, 0.0001, 0.0001];
alpha2 = [0.0001, 0.0002, 0.01, 0.0001];
Xf1 = zeros(n,3);
Xf2 = zeros(n,3);

for i=1:n
    temp1 = move_odo(Ut1, X0, alpha1);
    Xf1(i,1) = temp1(1);
    Xf1(i,2) = temp1(2);
    Xf1(i,3) = temp1(3);
end
Xf1
for i=1:n
    i
    X2 = Xf1(i:i,:)
    temp1 = move_odo(Ut1,X2' , alpha1)
    Xf2(i,1) = temp1(1);
    Xf2(i,2) = temp1(2);
    Xf2(i,3) = temp1(3);
end
Xf2
% 
%    X1 = transpose(Xf1(i:1,:));
%    temp2 = move_odo(Ut2 , X1, alpha1 );
%     Xf2(i,1) = temp2(1);
%     Xf2(i,2) = temp2(2);
%     Xf2(i,3) = temp2(3);

% Xf2 = move_odo(Ut2 , Xf1, alpha1 );


% Ut1;
% X0;
% Xb0 = Ut1(1:1,:); %current
% Xb1 = Ut1(2:2,:); %future
% 
% Xf1 = zeros(1,3);
% Xf2 = zeros(1,3);

% alpha1 =[0.01, 0.002, 0.0001, 0.0001];
% alpha1 =[0.0001, 0.0002, 0.01, 0.0001];



% % inputNourishing
% del_rot1 = atan2(Xb1(2) - Xb0(2), Xb1(1) -Xb0(1)) - Xb0(3);
% del_rot2 = Xb1(3) - Xb0(3) - del_rot1;
% del_trans = sqrt((Xb1(1) - Xb0(1))^2 + (Xb1(2) - Xb0(2))^2); %2.236
% n= 1000;
% for i=1:n
% % % adding noise
% del_rot1_cp = del_rot1 +  sample(del_rot1,del_trans, alpha1(1),alpha1(2));
% del_rot2_cp = del_rot2 + sample(del_rot2,del_trans, alpha1(1),alpha1(2));
% del_trans_cp = del_trans + sample(del_trans,(del_rot1 + del_rot2), alpha1(3),alpha1(4));
% % 
% % % determing output X1
% Xf1(i,1)= X0(1) + (del_trans_cp * cos(X0(3))) ;
% Xf1(i,2)= X0(2) + (del_trans_cp * sin(X0(3)));
% Xf1(i,3)= X0(3) + del_rot1_cp + del_rot2_cp ;





% Ut2 = [3, -1, -1.571; 3, -2, 0 ]
% 
% Xb1 = Ut2(1:1,:); %current
% Xb2 = Ut2(2:2,:); %future
% % 
% % % inputNourishing
% del_rot1 = atan2(Xb2(2) - Xb1(2), Xb2(1) -Xb1(1)) - Xb1(3);
% del_rot2 = Xb2(3) - Xb1(3) - del_rot1;
% del_trans = sqrt((Xb2(1) - Xb1(1))^2 + (Xb2(2) - Xb2(2))^2); 
% 
% for j=1:1:n
%  % % adding noise
% del_rot1_cp = del_rot1 +  sample(del_rot1,del_trans, alpha1(1),alpha1(2));
% del_rot2_cp = del_rot2 + sample(del_rot2,del_trans, alpha1(1),alpha1(2));
% del_trans_cp = del_trans + sample(del_trans,(del_rot1 + del_rot2), alpha1(3),alpha1(4));
% % 
% 
% % % % determing output X2
% Xf2(j,1)= Xf1(j,1) + (del_trans_cp * cos(Xf1(j,3))); 
% Xf2(j,2)= Xf1(j,2) + (del_trans_cp * sin(Xf1(j,3)));
% Xf2(j,3)= Xf1(j,3) + del_rot1_cp + del_rot2_cp ;
% end


%mapping X1 and X2 , noiseless X1 and X2
% title('For alpha 2');
% nlx1 = [2.0000 ,   2.2361 ,  -0.0002];
% nlx2 = [2.0000 ,   2.2361  ,  1.5708];
% plot([X0(1),nlx1(1)],[X0(2),nlx1(2)]);
% hold on ;
% plot([nlx1(1),nlx2(1)],[nlx1(2),nlx2(2)]);
% hold on;

x1vals = zeros(n,1);
x2vals = zeros(n,1);
RGB = [204 204 255]/256 ;
for m = 1:1:n
     x1vals(m) = Xf1(m,1);
     x2vals(m) = Xf2(m,1); 
end
y1vals = zeros(n,1);
y2vals = zeros(n,1);

for m = 1:1:n
   y1vals(m) = Xf1(m, 2);
   y2vals(m) = Xf2(m, 2);
end 
   sz = 10;
   scatter(x1vals, y1vals, sz, 'filled')
   hold on;
   scatter(x2vals, y2vals, sz, RGB, 'filled')
% % % determing output X2
% Xf2(1,1)= Xf1(1) + (del_trans_cp * cos(Xf1(3))); 
% Xf2(1,2)= Xf1(2) + (del_trans_cp * sin(Xf1(3)));
% Xf2(1,3)= Xf1(3) + del_rot1_cp + del_rot2_cp ;
% 
% %plotting
% scatter(X0(1),X0(2));
% hold on ;
% scatter(Xf1(1),Xf1(2));
% hold on;
% scatter(Xf2(1),Xf2(2));

end

function[Xf]= move_odo(u, Xi, alpha )
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
        del_rot1_cp = del_rot1 + sample(del_rot1,del_trans, alpha(1),alpha(2));
        del_rot2_cp = del_rot2 + sample(del_rot2,del_trans, alpha(1),alpha(2));
        del_trans_cp = del_trans + sample(del_trans,(del_rot1 + del_rot2), alpha(3),alpha(4)) ;
% 
% % determing output X1
        Xf(1,1)= Xi(1) + (  del_trans_cp * cos( Xi(3)  + del_rot1_cp ) ) ;
        Xf(1,2)= Xi(2) + (  del_trans_cp * sin( Xi(3) + del_rot1_cp ) );
        Xf(1,3)= Xi(3) + del_rot1_cp + del_rot2_cp ;
   
end



