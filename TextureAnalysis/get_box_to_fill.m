function [y1,y2,x1,x2] = get_box_to_fill(new_image,y,x,half_block)
   h = size(new_image,1);
   w = size(new_image,2);
   
   y1 = y-half_block;
   y2 = y+half_block;
   x1 = x-half_block;
   x2 = x+half_block;
   
   if (y1<1 || x1<1 || y2 > h || x2 >w)
       y1 = -1 ;
       y2 = -1 ;
       x1 = -1 ;
       x2 = -1 ;
   end


end