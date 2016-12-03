function res = s(i,j, seam, img)
    global memoisation_table;
    global ref_table; 
    assert (i>0 , 'something went wrong, negative index i in s');
    %disp(i);

    if (i == get_height(img) && j > 0 && j<=get_width(img))
        w = img(i,j);
        seam(get_height(img)) = j;
        seam_res = seam;
        res = {w;seam_res};
    elseif (i == get_height(img))
        w = Inf;
        seam_res = seam;
        res = {w;seam_res};
    elseif (j<=0 || j> get_width(img))
        w = Inf;
        seam_res = seam;
        res = {w;seam_res};
    elseif ref_table(i,j) ~= -1
        w = ref_table(i,j);
        seam_res = 1:get_height(img);
        seam_res(1:end) = memoisation_table(i,j, :);
        res = {w,seam_res};  
    elseif ref_table(i,j) == -1
        left = s(i+1,j-1, seam, img);
        right = s(i+1,j+1, seam, img);
        bottom = s(i+1,j, seam, img);

        left_path_weight = left{1};
        left_path_seam = left{2};
        right_path_weight = right{1};
        right_path_seam = right{2};
        bottom_path_weight = bottom{1};
        bottom_path_seam = bottom{2};
        
        if left_path_weight <= right_path_weight && left_path_weight <= bottom_path_weight
            %taking left
            w = img(i,j-1) + left_path_weight;
            left_path_seam(i) = j;
            seam_res = left_path_seam;
            %disp(seam_res);
            ref_table(i,j) = w;
            memoisation_table(i,j,:)= seam_res(1:end);
            %disp('start')
             %disp(ref_table(i,j));
            %disp(seam_res(1:end));
            %disp(memoisation_table(i,j,:));
            %disp('end')
            res = {w;seam_res};

        elseif right_path_weight <= left_path_weight && right_path_weight <= bottom_path_weight
            %taking right
            w = img(i,j+1) + right_path_weight;
            right_path_seam(i) = j;
            seam_res = right_path_seam;
            %disp(seam_res);
            
            ref_table(i,j) = w;    
            memoisation_table(i,j,:)= seam_res(1:end);
            %disp('start')
            %disp(ref_table(i,j));
            %disp(seam_res(1:end));
            %disp(memoisation_table(i,j,:));
            %disp('end')
            res = {w;seam_res};
        else
            %taking bottom
            w = img(i,j) + bottom_path_weight;
            bottom_path_seam(i) = j;
            seam_res = bottom_path_seam;
            %disp(seam_res);
            ref_table(i,j) = w;
            memoisation_table(i,j,:)= seam_res(1:end);
            %disp('start')
             %disp(ref_table(i,j));
            %disp(seam_res(1:end));
            %disp(memoisation_table(i,j,:));
            %disp('end')
            res = {w;seam_res};
        end
    end
end
