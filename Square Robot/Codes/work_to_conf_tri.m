function conf_tri = work_to_conf_tri(work_tri)
	conf_tri = [];

	[work_tri(:, 1), work_tri(:, 2)] = poly2cw(work_tri(:, 1), work_tri(:, 2));
	o1 = work_tri(1, :);
	o2 = work_tri(2, :);
	o3 = work_tri(3, :);

	[c11 c12] = find_conf_points(o1, o3);
	[c21 c22] = find_conf_points(o2, o1);
	[c31 c32] = find_conf_points(o3, o2);

	tmp_tri = [c11 ; c12 ; c21 ; c22 ; c31 ; c32];
	tmp_tri = unique(tmp_tri, 'rows');
	indices = convhull(tmp_tri(:, 1), tmp_tri(:, 2));
	for i = 1:length(indices)
		conf_tri = [conf_tri ; tmp_tri(indices(i), :)];
	end
	[conf_tri(:, 1), conf_tri(:, 2)] = poly2cw(conf_tri(:, 1), conf_tri(:, 2));
end

function [q1 q2] = find_conf_points(p1, p2)
	global q_start;
	global c_start;

	s1 = q_start(1, :);
	s2 = q_start(2, :);
	s3 = q_start(3, :);

	offset = p1 - s1;
	r1 = p1;
	r2 = s2 + offset;
	r3 = s3 + offset;

	if is_outside(p1, p2, r2, r3)
		q1 = c_start + offset;
	end

	offset = p1 - s2;
	r1 = s1 + offset;
	r2 = p1;
	r3 = s3 + offset;
	if is_outside(p1, p2, r1, r3)
		q1 = c_start + offset;
	end

	offset = p1 - s3;
	r1 = s1 + offset;
	r2 = s2 + offset;
	r3 = p1;
	if is_outside(p1, p2, r1, r2)
		q1 = c_start + offset;
	end

	offset = p2 - s1;
	r1 = p2;
	r2 = s2 + offset;
	r3 = s3 + offset;

	if is_outside(p1, p2, r2, r3)
		q2 = c_start + offset;
	end

	offset = p2 - s2;
	r1 = s1 + offset;
	r2 = p2;
	r3 = s3 + offset;
	if is_outside(p1, p2, r1, r3)
		q2 = c_start + offset;
	end

	offset = p2 - s3;
	r1 = s1 + offset;
	r2 = s2 + offset;
	r3 = p2;
	if is_outside(p1, p2, r1, r2)
		q2 = c_start + offset;
	end
end

function ans = is_outside(p1, p2, q1, q2)
	ans = 1;

	prod_1 = dot_prod(p1, p2, q1);
	prod_2 = dot_prod(p1, p2, q2);
	if prod_1 < 0 || prod_2 < 0
		ans = 0;
	elseif prod_1 == 0 || prod_2 == 0
		dist1 = norm(p1 - p2);
		dist2 = norm(p1 - q1);
		dist3 = norm(p2 - q1);
		dist4 = norm(p1 - q2);
		dist5 = norm(p2 - q2);
		if ((dist2 / dist1) < 1 && (dist3 / dist1) < 1) || ((dist4 / dist1) < 1 && (dist5 / dist1) < 1)
			ans = 0;
		end
	end
end

function res = dot_prod(p1, p2, q1)
	res = (p1(1) - p2(1)) * (q1(2) - p2(2)) - (p1(2) - p2(2)) * (q1(1) - p2(1));
end

