function build_vis_graph()
	global conf_map;
	global c_start;
	global c_goal;
	global all_nodes;
	global visibility_edges;

	all_nodes = [];
	all_edges = [];
	k = 3;

	all_nodes(1, :) = [c_start, 1];
	all_nodes(2, :) = [c_goal, 2];
	for i = 1:length(conf_map)
		obs = conf_map{i};
		for j = 1:length(obs) - 1
			all_edges = [all_edges ; [obs(j + 1, :), obs(j, :)]];
			all_nodes(k, :) = [obs(j, :), i + 2];
			k = k + 1;
		end
	end

	visibility_edges = all_edges;
	for i = 1:length(all_nodes)
		for j = 1:length(all_nodes)
			if all_nodes(i, 3) ~= all_nodes(j, 3)
				flag = 1;
				for k = 1:length(all_edges)
					val = line_seg_int([all_nodes(i, 1), all_nodes(i, 2)], [all_nodes(j, 1), all_nodes(j, 2)], [all_edges(k, 1), all_edges(k, 2)], [all_edges(k, 3), all_edges(k, 4)]);
					if val == 1
						flag = 0;
						break;
					end
				end
				if flag == 1
					visibility_edges = [visibility_edges ; all_nodes(i, 1), all_nodes(i, 2), all_nodes(j, 1), all_nodes(j, 2)];
				end
			end
		end
	end

	construct_vis_graph();

	draw_vis_graph();
end

function val = line_seg_int(p1, p2, q1, q2)
	if p2(1) - p1(1) == 0
		m_p = 10000;
	else
		m_p = (p2(2) - p1(2)) / (p2(1) - p1(1));
	end
	if q2(1) - q1(1) == 0
		m_q = 10000;
	else
		m_q = (q2(2) - q1(2)) / (q2(1) - q1(1));
	end
	if m_p == m_q
		val = 0;
		return;
	end
	a = p1(2) - m_p * p1(1);
	b = q1(2) - m_q * q1(1);
	x = (b - a) / (m_p - m_q);
	y = m_p * x + a;
	dist1 = norm(p1 - [x, y]);
	dist2 = norm(p2 - [x, y]);
	dist3 = norm(p1 - p2);
	dist4 = norm(q1 - [x, y]);
	dist5 = norm(q2 - [x, y]);
	dist6 = norm(q1 - q2);
	if ((dist1 / dist3) >= 0.99 || (dist2 / dist3) >= 0.99) || ((dist4 / dist6) >= 0.99 || (dist5 / dist6) >= 0.99)
		val = 0;
		return;
	end
	val = 1;
end

