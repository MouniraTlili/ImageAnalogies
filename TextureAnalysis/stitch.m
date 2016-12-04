function res = stitch(box,filled_box,seam1,seam2)

mask1 = ones(size(filled_box));
for y=1:size(mask1,1)
    %on y = i
   for x=1:size(mask1,2)
       %x=j
       if x < seam1(y) || y < seam2(x)
           mask1(y,x,:) = [0,0,0];
       end
        
   end
end
box(isnan(box))=0;
% half1 = box.*(1 - mask1);
% half2 = filled_box .* mask1;
res = filled_box .* mask1 + box .* (1 - mask1);

end