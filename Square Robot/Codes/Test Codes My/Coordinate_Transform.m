clc,clear,close

q_start = [0 0 ; 0 1 ; 1 1 ; 1 0 ; 0 0];

theta = degtorad(45);

for i = 1:5
    x=q_start(i,1);
    y=q_start(i,2);
    
    M = [ x ; y];
    T = [ cos(theta) -sin(theta) ; sin(theta) cos(theta) ];
    
    New_M = T*M;

    q_start_new(i,1) = New_M(1,1);
    q_start_new(i,2) = New_M(2,1);
end

q_start
q_start_new
