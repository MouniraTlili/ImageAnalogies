function [x,y] = print_hall(i,dt, k_array)
k =  k_array(:,:,i);
k(k==0) = [];
x = dt.X(k,1);
y = dt.X(k,2);
end