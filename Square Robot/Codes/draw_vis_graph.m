function draw_vis_graph()
	global conf_map;
	global c_start;
	global c_goal;
	global graph_nodes;
	global graph_edges;

	figure;
	for i = 1:length(conf_map)
		obs = conf_map{i};
		patch(obs(:, 1), obs(:, 2), 'black');
	end
	hold on;
	plot(c_start(1), c_start(2), 'Marker', 'o', 'LineWidth', 3, 'MarkerEdgeColor', 'blue', 'MarkerSize', 15);
	plot(c_goal(1), c_goal(2), 'Marker', 'x', 'LineWidth', 3, 'MarkerEdgeColor', 'red', 'MarkerSize', 15);

	hold on;

	for i = 1:length(graph_nodes)
		edge_list = [];
		edge_list = graph_edges{i};
		for j = 1:length(edge_list)
			p1 = [graph_nodes(i, 1), graph_nodes(edge_list(j), 1)];
			p2 = [graph_nodes(i, 2), graph_nodes(edge_list(j), 2)];
			line(p1, p2, 'LineWidth', 3, 'Color', 'cyan');
		end
	end
	grid on;
	hold off;
end

