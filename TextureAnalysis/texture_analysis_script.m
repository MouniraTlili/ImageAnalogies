block_size = 41;
global memoisation_table;
global ref_table; 
ref_table = -1 * ones(block_size,block_size);
memoisation_table = zeros(block_size,block_size,block_size);
original_image = im2double(imread('texture1.jpeg'));
h = size(original_image,1);
w = size(original_image,2);
%place the old image at the corner of the first
new_image = zeros(2*h,2*w,3);
new_image(new_image == 0) = NaN;
new_image(1:h,1:w,1:3) = original_image;
%create all overlapping blocks in the input texture image
r = im2col(original_image(:,:,1),[block_size block_size],'sliding');
g = im2col(original_image(:,:,2),[block_size block_size],'sliding');
b = im2col(original_image(:,:,3),[block_size block_size],'sliding'); 
blocks_pool= [r; g; b];

pool_length = size(blocks_pool,2);
%new pool is just the reshaped pool block_height*block_height*3*pool_length
new_pool = zeros(block_size,block_size,3,pool_length);
for i=1:pool_length
    patch = blocks_pool(:,i);
    new_pool(:,:,:,i)= reshape(patch,[block_size,block_size,3]);   
end
l = size(new_pool,4);
blocks_pool = reshape(new_pool,[block_size^2*3 l]);

%execute the algorithm
fill_texture(new_image, blocks_pool,block_size,h,w);
%imshow(new_image);