function build_conf_map()
	global map;
	global conf_map;
	global q_start;
	global q_goal;
	global c_start;
	global c_goal;

	
    cx = q_start(1:4,1);
    cy = q_start(1:4,2);
    polyin = polyshape(cx,cy);
    [c_start(1,1),c_start(1,2)] = centroid(polyin);

    c_start();



	c_goal = q_goal;

	for i = 1:length(map)
		conf_tris = [];
		work_obs = map{i};
		x_points = work_obs(:, 1);
		x_points(length(x_points)) = [];
		y_points = work_obs(:, 2);
		y_points(length(y_points)) = [];
		tri_indices = delaunay(x_points, y_points);
		[N, M] = size(tri_indices);
		for j = 1:N
			work_tri = [work_obs(tri_indices(j, 1), :) ; work_obs(tri_indices(j, 2), :) ; work_obs(tri_indices(j, 3), :)];
			conf_tri = work_to_conf_tri(work_tri);
			conf_tris{j} = conf_tri;
		end
		if i == 1
			conf_obs = conf_tris{1};
			lower_index = 2;
		else
			lower_index = 1;
		end
		for j = lower_index:length(conf_tris)
			tmp_tri = conf_tris{j};
			[X, Y] = polybool('+', conf_obs(:, 1), conf_obs(:, 2), tmp_tri(:, 1), tmp_tri(:, 2));
			conf_obs = [];
			conf_obs(:, 1) = X;
			conf_obs(:, 2) = Y;
		end
	end
	j = 0;
	k = 1;
	tmp_obs = [];
	for i = 1:length(conf_obs)
		if isequaln(conf_obs(i, 1), NaN)
			j = j + 1;
			k = 1;
			tmp_map{j} = tmp_obs;
			tmp_obs = [];
		else
			tmp_obs(k, :) = conf_obs(i, :);
			k = k + 1;
		end
	end
	tmp_map{j + 1} = tmp_obs;

	for i = 1:length(tmp_map)
		tmp_obs = [];
		obs = tmp_map{i};
		k = 1;
		for j = 1:length(obs) - 1
			if j == 1
				p1 = obs(length(obs) - 1, :);
			else
				p1 = obs(j - 1, :);
			end
			p2 = obs(j, :);
			p3 = obs(j + 1, :);
			if (p1(1) - p3(1)) * (p2(2) - p3(2)) - (p1(2) - p3(2)) * (p2(1) - p3(1)) ~= 0
				tmp_obs(k, :) = obs(j, :);
				k = k + 1;
			end
		end
		tmp_obs(k, :) = tmp_obs(1, :);
		conf_map{i} = tmp_obs;
	end

	draw_conf_map();
end

