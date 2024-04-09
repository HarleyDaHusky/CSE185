function filtered_img = median_filter(img, patch_size)
filtered_img = zeros(size(img));
for x = round(patch_size(1)/2)+1:size(img, 1) - round(patch_size(1)/2)
for y = round(patch_size(2)/2)+1:size(img, 2) - round(patch_size(2)/2)
    neighborhood = img(x-round(patch_size(1)/2):x+round(patch_size(1)/2), y-round(patch_size(2)/2):y+round(patch_size(1)/2));
    neighborhood = neighborhood(:);
    filtered_img(x,y) = median(neighborhood);


    % The following also works and clears out the black border on the
    % edges:
    % if x+patch_size(1)<=size(img, 1) && y+patch_size(2)<=size(img, 2)
    %     neighborhood = img(x:x+round(patch_size(1)/2), y:y+round(patch_size(2)/2));
    %     filtered_img(x,y) = median(neighborhood(:));
    % elseif x+patch_size(1) >= size(img, 1) && y+patch_size(2) >= size(img, 2)
    %     neighborhood = img(x-round(patch_size(1)/2):x, y-round(patch_size(2)/2):y);
    %     filtered_img(x, y) = median(neighborhood(:));
    % elseif x+patch_size(1) >= size(img, 1) && y+patch_size(2) <= size(img, 2)
    %     neighborhood = img(x-round(patch_size(1)/2):x, y:y+round(patch_size(2)/2));
    %     filtered_img(x, y) = median(neighborhood(:));
    % elseif x+patch_size(1) <= size(img, 1) && y+patch_size(2) >= size(img, 2)
    %     neighborhood = img(x:x+round(patch_size(1)/2), y-round(patch_size(2)/2):y);
    %     filtered_img(x, y) = median(neighborhood(:));
end
end
end