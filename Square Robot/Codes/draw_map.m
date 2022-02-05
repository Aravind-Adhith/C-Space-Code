function draw_map()
	global map;
	global q_start;
	global q_goal;

	figure;
	for i = 1:length(map)
		obs = map{i};
		patch(obs(:, 1), obs(:, 2), 'black'); %Plotting the obstacles
	end
	patch(q_start(:, 1), q_start(:, 2), 'blue'); %Plotting the drone
	hold on;
	plot(q_goal(1), q_goal(2), 'Marker', 'x', 'LineWidth', 3, 'MarkerEdgeColor', 'red', 'MarkerSize', 15); %Marking the end points
	grid on;
	hold off;


end

