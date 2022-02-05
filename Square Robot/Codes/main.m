clear all;
clc;

global theta;
global Beta1; 
global Beta2;

theta = 0;
Beta1 = 1;
Beta2 = 1; 

build_map(theta,Beta1,Beta2);
build_conf_map();

build_vis_graph();
run_a_star();

