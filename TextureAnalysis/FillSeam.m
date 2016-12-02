function filled_img = FillSeam(seam, window_size, img_gray,img)
    % is grayscale
    %seam = [x1 y1]
           %[x2 y2]
           %[x3 y3]
    window_fullness = zeros(length(seam),1);
    for i=1:length(seam)
        A = window(seam(i,1),seam(i,2), img_gray, window_size);
        window_fullness(i,1) = sum(~isnan(A));     
    end
    sorted_pixels = zeros(length(seam),3);
    sorted_pixels(:,1:2) = seam(:,:);
    sorted_pixels(:,3) = window_fullness(:,1);
    
    

end