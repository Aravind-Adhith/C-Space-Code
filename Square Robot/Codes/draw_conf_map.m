function draw_conf_map()
	global conf_map;
	global c_start;
	global c_goal;

	figure;
	for i = 1:length(conf_map)
		obs = conf_map{i};
		patch(obs(:, 1), obs(:, 2), 'black');
	end
	hold on;
	plot(c_start(1), c_start(2), 'Marker', 'o', 'LineWidth', 3, 'MarkerEdgeColor', 'blue', 'MarkerSize', 15);
	plot(c_goal(1), c_goal(2), 'Marker', 'x', 'LineWidth', 3, 'MarkerEdgeColor', 'red', 'MarkerSize', 15);
	grid on;
	hold off;
end

