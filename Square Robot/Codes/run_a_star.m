function run_a_star()
	global graph_nodes;
	global graph_edges;
	global c_start;
	global c_goal;
	global path;

	path = [];

	graph_nodes(1, 3) = find_euc_dist(1, 2);
	graph_nodes(1, 4) = 1;
	while 1
		to_be_expanded = det_to_be_expanded();
		expand(to_be_expanded);
		if graph_nodes(2, 4) == 2
			break;
		end
	end
	
	path = [];
	p = 2;
	while p ~= 1
		path = [path p];
		p = graph_nodes(p, 5);
	end
	path = [path p];

	draw_a_star();
end

function to_be_expanded = det_to_be_expanded()
	global graph_nodes;

	cur_min = 1000000;

	for i = 1:length(graph_nodes)
		f = graph_nodes(i, 3);
		if graph_nodes(i, 4) == 1 && f < cur_min
			cur_min = f;
			to_be_expanded = i;
		end
	end
end

function expand(to_be_expanded)
	global graph_nodes;
	global graph_edges;

	prev_node = graph_nodes(to_be_expanded, 5);
	if prev_node ~= 0
		graph_nodes(to_be_expanded, 3) = graph_nodes(prev_node, 3) + find_euc_dist(prev_node, to_be_expanded);
	else
		graph_nodes(to_be_expanded, 3) = 0;
	end
	graph_nodes(to_be_expanded, 4) = 2;

	edge_list = graph_edges{to_be_expanded};
	for i = 1:length(edge_list)
		if graph_nodes(edge_list(i), 4) ~= 2
			g = graph_nodes(to_be_expanded, 3) + find_euc_dist(to_be_expanded, edge_list(i));
			h = find_euc_dist(edge_list(i), 2);
			f = g + h;
			if f < graph_nodes(edge_list(i), 3)
				graph_nodes(edge_list(i), 3) = f;
				graph_nodes(edge_list(i), 4) = 1;
				graph_nodes(edge_list(i), 5) = to_be_expanded;
			end
		end
	end
end

function dist = find_euc_dist(i, j)
	global graph_nodes;

	p1 = [graph_nodes(i, 1), graph_nodes(i, 2)];
	p2 = [graph_nodes(j, 1), graph_nodes(j, 2)];
	dist = norm(p1 - p2);
end

