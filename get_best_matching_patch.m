function [ref_i,ref_j] = get_best_matching_patch(patch, patch_width, imgA1)
height = size(imgA1,1);
width = size(imgA1,2);
half_width = floor(patch_width/2);
assert((patch_width-1)/2 == half_width);
summation = inf;
ref_i = -1;
ref_j = -1;
B = im2col(imgA1,[5 5],'sliding');
% for i=1:height
%     for j = 1:width
%         if (       i<=half_width ...
%                 || j<=half_width ...
%                 || i>=height - half_width ...
%                 || j>=width - half_width)
%             continue;
%         end
%         %Get a 5x5 patch surrounding the pixel we're looking at 
%         p = imgA1(i-half_width:i+half_width, j-half_width:j+half_width,:);
%         curr_sum = sum(sum((p-patch).^2));
%         if curr_sum < summation
%             summation = curr_sum;
%             ref_i = i;
%             ref_j = j;
%         end
% 
%     end
% end
end