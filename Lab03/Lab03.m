%#1 load image
img = im2double(imread('lena.jpg'));

%% Sobel Filter
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge

img_sobel = sobel_filter(img, H);
%figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_h.jpg');

H1 = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
img_sobelV = sobel_filter(img, H1);
imwrite(img_sobelV, 'sobel_v.jpg');
%% Gaussian filter
hsize = 5; sigma = 2;
img_gaussian = gaussian_filter(img, hsize, sigma);
imwrite(img_gaussian, 'gaussian_5.jpg');
hsize = 9; sigma = 4;
img_gaussian = gaussian_filter(img, hsize, sigma);
imwrite(img_gaussian, 'gaussian_9.jpg');
