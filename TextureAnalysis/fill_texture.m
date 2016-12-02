function new_image = fill_texture(new_image, blocks_pool, block_height,starty,startx)
    imshow(new_image);
    h = size(new_image,1);
    w = size(new_image,2);
    s = size(blocks_pool);
    half_block = floor(block_height/2);
    disp(s);
    %patch = blocks_pool(:,1);
    %imshow(reshape(patch,[block_height,block_height,3]));
    coin = 1;
    for y= half_block+1:half_block:h
        if (y<starty)
           x = startx;
        else
            x = 1;
        end
        while (x <= w)
            
            [y1,y2,x1,x2] = get_box_to_fill(new_image,y,x,half_block);
            disp([y1,y2,x1,x2]);
            if (y1 == -1)
                x = x + 1; 
                continue;
            end
            box = new_image(y1:y2,x1:x2,:);
            [filled_box, overlap] = fill_box(box, blocks_pool);
%             temp_filled_box = 255*ones(size(filled_box));
%             new_image(y1:y2,x1:x2,1:3) =coin* temp_filled_box;
            
            new_image(y1:y2,x1:x2,1:3) =filled_box;
            pause(2);
            if coin ==1
                coin = 0;
            else
                coin = 1;
            end
            x = x + overlap; 
            imshow(new_image);
        
        end
    end   
end
