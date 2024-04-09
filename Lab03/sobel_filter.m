function output = sobel_filter(img, kernel)
    filtered_img = zeros(size(img));
    for x = round(size(kernel,1)):size(img, 1) - round(size(kernel,1))
        for y = round(size(kernel,2)):size(img, 2) - round(size(kernel,2))
            total = 0;
            for x1 = floor(size(kernel,1)/2)-(size(kernel,1)-1):floor(size(kernel,1)/2)
                for y1 = floor(size(kernel,2)/2)-(size(kernel,2)-1):floor(size(kernel,2)/2)
                    total = total + (img(x+x1,y+y1)*kernel(x1+2,y1+2));
                end
            end
            filtered_img(x,y) = total;
        end
    end
    output = filtered_img;
end