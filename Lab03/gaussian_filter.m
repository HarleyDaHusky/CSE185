function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    filtered_img = zeros(size(img));
    for x = round(size(H,1)):size(img, 1) - round(size(H,1))
        for y = round(size(H,2)):size(img, 2) - round(size(H,2))
            total = 0;
            for x1 = -1*(round(hsize/2))+1:round(hsize/2)-1
                for y1 = -1*(round(hsize/2))+1:round(hsize/2)-1
                    total = total + (img(x+x1,y+y1)*H(x1+round(hsize/2),y1+round(hsize/2)));
                end
            end
            filtered_img(x,y) = total;
        end
    end
    output = filtered_img;
end

