img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;
%% Gaussian Pyramid
I = img;
for s = 1 : scale
% Gaussian filter
I = gaussian_filter(I, hsize, sigma);
% Save or show image
imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
% Down-sampling
I = imresize(I, 0.5);
end


%% Laplacian Pyramxid
I2 = img;
for s = 1 : scale
% Gaussian filtering
I2_gauss = gaussian_filter(I2, hsize, sigma);
% Laplacian filtering
I2 = I2 - I2_gauss;
% Save or show image
imwrite(I2 + 0.5, sprintf('Laplacian_scale%d.jpg', s));
% Down-sampling
I2 = imresize(I2, 0.5);
end
