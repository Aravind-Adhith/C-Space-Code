x1 = [-4 -5 2 6];
y1 = [0 7 6 -3];

polyin = polyshape(x1,y1);
[x,y] = centroid(polyin);


%plot(polyin)
%hold on
%plot(x,y,'r*')
%hold off