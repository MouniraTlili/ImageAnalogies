function [filled_box2, overlap] = overlap_boxes(filled_box, box)
    %subplot(3,2,1);imshow(filled_box);
    
    %pause(2);
   % subplot(3,2,2); imshow(box);
    %img = filled_box;
    diff = abs(filled_box-box);
    seam = find_lowest_seam(diff);
    for i = 1:1:size(seam,2)
                diff(i,seam(i),1) = 255;
                diff(i,seam(i),2) = 255;
                diff(i,seam(i),3) = 255;
    end
    %subplot(3,2,3); imshow(diff);
    
    filled_box2 = stitch(box,filled_box,seam);
    
    %subplot(3,2,4); imshow(filled_box2);
    overlap = floor(size(filled_box,1)/2);
    %filled_box2 = filled_box2;
end