function [filled_box2, overlap] = overlap_boxes(filled_box, box)
    %subplot(3,2,1);imshow(filled_box);
    
    %pause(2);
    %subplot(3,2,2); imshow(box);
    %img = filled_box;
    diff = abs(filled_box-box);
    seam1 = find_lowest_seam(diff);
    seam2 = find_lowest_seam(diff);
    seam_box = box;
    for i = 1:1:size(seam1,2)
                seam_box(i,seam1(i),1) = 255;
                seam_box(i,seam1(i),2) = 255;
                seam_box(i,seam1(i),3) = 255;
    end
    
    for i = 1:1:size(seam2,2)
                seam_box(seam2(i),i,1) = 255;
                seam_box(seam2(i),i,2) = 255;
                seam_box(seam2(i),i,3) = 255;
    end
    
    %subplot(3,2,3); imshow(seam_box);
    
    filled_box2 = stitch(box,filled_box,seam1,seam2);
    
    %subplot(3,2,4); imshow(filled_box2);
    overlap = floor(size(filled_box,1)/2);
    %filled_box2 = filled_box2;
end