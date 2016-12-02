function imgB2 = create_image_analogy1(imgA1, imgA2, imgB1)
    patch_size = 5;
    A1r = im2col(imgA1(:,:,1),[patch_size patch_size],'sliding');
    A1g = im2col(imgA1(:,:,2),[patch_size patch_size],'sliding');
    A1b = im2col(imgA1(:,:,3),[patch_size patch_size],'sliding');
    A1 = [A1r; A1g; A1b];

    B1r = im2col(imgB1(:,:,1),[patch_size patch_size],'sliding');
    B1g = im2col(imgB1(:,:,2),[patch_size patch_size],'sliding');
    B1b = im2col(imgB1(:,:,3),[patch_size patch_size],'sliding');
    B = [B1r; B1g; B1b];

    A2r = im2col(imgA2(:,:,1),[patch_size patch_size],'sliding');
    A2g = im2col(imgA2(:,:,2),[patch_size patch_size],'sliding');
    A2b = im2col(imgA2(:,:,3),[patch_size patch_size],'sliding');
    %A2 = [A2r; A2g; A2b];
    %A2 = im2col(imgA2,[patch_size patch_size],'sliding');
    imgB2 = zeros(size(B,2),3);
    for i = 1:size(B,2)
        patch = B(:,i);
        t1 = tic();
        [~,index] = min(sum(bsxfun(@minus,A1,patch).^2,1));
        %disp('t1');
        %disp(toc(t1));
        t2 = tic();
        res_pixel = [A2r((patch_size^2+1)/2,index)...
                    A2g((patch_size^2+1)/2,index)...
                    A2b((patch_size^2+1)/2,index)];
        imgB2(i,:) = res_pixel;
        %disp('t2');
        %disp(toc(t2));
    end
    imgB2 = reshape(imgB2,[size(imgB1,1)-4,size(imgB1,2)-4,3]);

end
