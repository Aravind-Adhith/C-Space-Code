function draw_a_star()
	global visibility_edges;
	global conf_map;
	global c_start;
	global c_goal;
	global graph_nodes;
	global path;

	figure;
	for i = 1:length(conf_map)
		obs = conf_map{i};
		patch(obs(:, 1), obs(:, 2), 'black');
	end
	hold on;
	plot(c_start(1), c_start(2), 'Marker', 'o', 'LineWidth', 3, 'MarkerEdgeColor', 'blue', 'MarkerSize', 15);
	plot(c_goal(1), c_goal(2), 'Marker', 'x', 'LineWidth', 3, 'MarkerEdgeColor', 'red', 'MarkerSize', 15);

	hold on;
	for i = 1:length(visibility_edges)
		p1 = [visibility_edges(i, 1), visibility_edges(i, 3)];
		p2 = [visibility_edges(i, 2), visibility_edges(i, 4)];
		line(p1, p2, 'LineWidth', 3, 'Color', 'cyan');
	end

	hold on;
	for i = 1:length(path) - 1
		p1 = [graph_nodes(path(i), 1), graph_nodes(path(i + 1), 1)];
		p2 = [graph_nodes(path(i), 2), graph_nodes(path(i + 1), 2)];
		line(p1, p2, 'LineWidth', 3, 'Color', 'green');
	end

	grid on;
	hold off;
end

