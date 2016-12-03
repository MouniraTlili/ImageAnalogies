function seam = find_lowest_seam(img)
    img_grad = gradient(img);
    img_grad_R = img_grad(:,:,1);
    img_grad_G = img_grad(:,:,2);
    img_grad_B = img_grad(:,:,3);
    img_grad = 0.2989 * img_grad_R + 0.5870 * img_grad_G + 0.1140 * img_grad_B;
    %gradient energy function (removes dark seams)
    %img_grad = 1 * img_grad;
    %negative gradient energy function (removes light seams)
    %img_grad = -1 * img_grad;
    %Magnitude of gradient energy function
    img_grad = abs(img_grad);
    
    %imshow(img_grad);
    
    
    array = 1:get_height(img);
    res = s(1,1, array, img_grad);
    for j = 2:1:get_width(img) 
        temp = s(1,j, array, img_grad);
        if (temp{1} < res{1})
            res = temp;
        end
    end
    
    seam = res{2};
end
