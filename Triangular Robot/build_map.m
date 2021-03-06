function build_map()
	global map;
	global q_start;
	global q_goal;
	
	map{1} = [2 2 ; 2 4 ; 4 4 ; 4 2 ; 2 2];
	map{2} = [0 3.5 ; 0 4.5 ; 0.5 4.5 ; 0.5 3.5 ; 0 3.5];
	q_start = [0 0 ; 0 0.5 ; 0.5 0 ; 0 0];
	q_goal = [5 5];

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

