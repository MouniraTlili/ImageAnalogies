function [filled_box, overlap] = fill_box(box, blocks_pool)
% test
% r = box(:,:,1);
% g = box(:,:,2);
% b = box(:,:,3);
% filled_box = cat(3,0*g,0*r,0*r);
% overlap = size(box,1);
%end test
%box width
w = size(box,1);
%pool length
l = size(blocks_pool,4);
box = reshape(box,[w^2*3 1]);  
blocks_pool = reshape(blocks_pool,[w^2*3 l]);
%do the subtraction, a-nan == nan
mi = bsxfun(@minus,blocks_pool,box).^2;
%replace nan with zero
mi(isnan(mi)) = 0;
%sum and find the min value
s = sum(mi,1);
[~,index] = min(s);
filled_box = reshape(blocks_pool(:,index), [w w 3]);
overlap = floor(size(filled_box,1)/2);
end