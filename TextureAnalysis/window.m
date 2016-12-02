function w = window(i,j, img, window_size)
    half_width  = floor(window_size/2);
    w = img(i-half_width:i+half_width, j-half_width:j+half_width,:);
end