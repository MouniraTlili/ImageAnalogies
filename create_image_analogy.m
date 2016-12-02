function imgB2 = create_image_analogy(imgA1, imgA2, imgB1)
height = size(imgB1,1);
width = size(imgB1,2);
imgB2 = zeros(size(imgB1));
patch_width = 5;
half_width = 2;
for i=1:height
    for j = 1:width
        if (       i<=half_width ...
                || j<=half_width ...
                || i>=height - half_width ...
                || j>=width - half_width)
            continue;
        end
        %Get a 5x5 patch surrounding the pixel we're looking at 
        patch = imgB1(i-half_width:i+half_width, j-half_width:j+half_width,:);
        %Find the most similar patch to it in the original image
        [ref_i,ref_j]  = get_best_matching_patch(patch, patch_width, imgA1);
        %Get the matching patch in the edited input image 
        best_patch_in_A2 = imgA2(ref_i-half_width:ref_i+half_width, ref_j-half_width:ref_j+half_width,:);
        %find_patch_in_second_img(best_patch_in_A1, patch_width, imgA2);
        %Assign the center pixel to the output image at index i,j
        imgB2(i,j, :) = best_patch_in_A2(half_width+1,half_width+1, :);
        
    end
end



end