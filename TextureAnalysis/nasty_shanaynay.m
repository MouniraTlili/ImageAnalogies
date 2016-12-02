n = 1;
NUM = 100;
hold on;
k_array = zeros(NUM,1,n);
for i=1:n
    M = ones(NUM,1);
    x = rand(NUM,1);
    y = rand(NUM,1);
    if (floor(i/3)*3 == i)
        x = x+M*i;
    elseif (floor(i/3)*3+1 == i)
        y = y+M*i;
    else (floor(i/3)*3+1 == i)
        x = x+M*i;
        y = y+M*i;
    end
    dt = DelaunayTri(x,y);
    k = convexHull(dt);
    k_array(1:size(k,1),1,i) = k;
    plot(dt.X(:,1),dt.X(:,2), '.', 'markersize',10); 
    plot(dt.X(k,1),dt.X(k,2), 'r');
end
hold off;
[xi,yi] = print_hall(1,dt,k_array);


