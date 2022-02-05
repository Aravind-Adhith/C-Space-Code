function build_map(theta,Beta1,Beta2)
	global map;         %Obstacles
	global q_start;     %Drone Shape
	global q_goal;      %Destination of Drone
    global theta;
    global Beta1; 
    global Beta2;
    
    arm = 1/2;

    %Beta1 = 45;
    %Beta2 = 45;
    
    theta = degtorad(theta); 
    beta1 = degtorad(Beta1+90); 
    beta2 = degtorad(Beta2+90); 


	map{1} = [1 2 ; 1 4 ; 4 4 ; 4 2 ; 1 2];
	map{2} = [0 3.5 ; 0 4.5 ; 0.5 4.5 ; 0.5 3.5 ; 0 3.5];
	q_start = [ 0 -arm ; arm*sin(beta2) arm*cos(beta2) ; 0 arm ; -arm*sin(beta1) arm*cos(beta1) ; 0 -arm]; %Implementing the folding angles
	q_goal = [1 8];


        
    for i = 1:5
        x=q_start(i,1);
        y=q_start(i,2);
    
        M = [ x ; y];
        T = [ cos(theta) -sin(theta) ; sin(theta) cos(theta) ]; %Positioning the drone at 45 Deg Yaw. Looks like a kite
    
        New_M = T*M;

        q_start(i,1) = New_M(1,1);
        q_start(i,2) = New_M(2,1);
    
    end

	%map{1} = [1 1 ; 2 4 ; 5 3 ; 4 0 ; 1 1];
	%map{2} = [5 4 ; 0 5 ; 8 7 ; 10 5 ; 8 3.5 ; 7 5 ; 5 4];
	%map{3} = [14 -0.35 ; 15 0.35 ; 16 -0.35 ; 14 -0.35];
	%q_start = [-5 7 ; -4 6 ; -6 6 ; -5 7];
	%q_goal = [20 0];


	%map{1} = [0 8 ; 1 16 ; 8 17 ; 9 13 ; 6 12 ; 0 8];
	%map{2} = [13 3.8 ; 14 8.8 ; 17 4.8 ; 19 4.8 ; 21 2.3 ; 16 1.8 ; 13 3.8];
	%map{3} = [20 30 ; 20 20 ; 25 15 ; 25 20 ; 25 25 ; 20 30];
	%q_start = [0 0 ; 0.5 1 ; 1 0 ; 0 0];
	%q_goal = [30 30];

	%map{1} = [0 8 ; 1 16 ; 8 17 ; 9 13 ; 6 12 ; 0 8];
	%map{2} = [13 3.8 ; 14 8.8 ; 17 4.8 ; 19 4.8 ; 21 2.3 ; 16 1.8 ; 13 3.8];
	%map{3} = [20 30 ; 20 20 ; 25 15 ; 25 20 ; 25 25 ; 20 30];
	%q_start = [-0.25 0 ; 0.15 1.7 ; 0.15 0 ; -0.25 0];
	%q_goal = [30 30];

	draw_map();
end

