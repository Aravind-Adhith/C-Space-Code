function construct_vis_graph()
	global all_nodes;
	global graph_nodes;
	global graph_edges;

	for i = 1:length(all_nodes)
		graph_nodes(i, :) = [all_nodes(i, 1), all_nodes(i, 2), 100000, 0, 0];
		graph_edges{i} = find_connected_nodes(all_nodes(i, 1), all_nodes(i, 2));
	end
end

function edge_list = find_connected_nodes(x_coor, y_coor)
	global visibility_edges;

	edge_list = [];

	for i = 1:length(visibility_edges)
		p_x = visibility_edges(i, 1);
		p_y = visibility_edges(i, 2);
		if p_x == x_coor && p_y == y_coor
			index = find_node_index(visibility_edges(i, 3), visibility_edges(i, 4));
			edge_list = [edge_list index];
		end
	end
end

function index = find_node_index(x_coor, y_coor)
	global all_nodes;

	for i = 1:length(all_nodes)
		if all_nodes(i, 1) == x_coor && all_nodes(i, 2) == y_coor
			index = i;
			return;
		end
	end
end

