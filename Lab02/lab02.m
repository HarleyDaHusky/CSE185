%#1 load image
img = imread('01.jpg');
%img is 400w by 300h
img2 = zeros(300, 400, 3, 'uint8');
center_x = 300/2;
center_y = 400/2;
for y1 = 1:300 %rows
for x1 = 1:400 %cols
for color = 1:3
    y2 = round(cosd(-45) * (y1 - center_x) + sind(-45) * (x1 - center_y) + center_x);
    x2 = round(-sind(-45) * (y1 - center_x)+ cosd(-45) * (x1 - center_y) + center_y);
    if 1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400
        img2(y2, x2, color) = img(y1, x1, color);
    end
end
end
end
imwrite(img2,'rotate_0.jpg');



%#2
img3 = imread('01.jpg');
%img is 400w by 300h
img4 = zeros(300, 400, 3, 'uint8');
center_x = 300/2;
center_y = 400/2;
for y2 = 1:300 %rows
for x2 = 1:400 %cols
for color = 1:3
    y1 = round(cosd(-45) * (y2 - center_x) + -sind(-45) * (x2 - center_y) + center_x);
    x1 = round(sind(-45) * (y2 - center_x)+ cosd(-45) * (x2 - center_y) + center_y);
    if 1 <= y1 && y1 <= 300 && 1 <= x1 && x1 <= 400
        img4(y2, x2, color) = img3(y1, x1, color);
    end
end
end
end
imwrite(img4,'rotate_1.jpg');


%#3 size = 3
img5 = im2double(imread('lena_noisy.jpg'));
patch_size = [3, 3];
img_median = median_filter(img5, patch_size);
imwrite(img_median, 'median_0.jpg');

imgtest = medfilt2(img5, patch_size);
imwrite(imgtest, 'imgtest.jpg');
%#4 size = 5
img6 = im2double(imread('lena_noisy.jpg'));
patch_size = [5, 5];
img_median = median_filter(img6, patch_size);
imwrite(img_median, 'median_1.jpg');