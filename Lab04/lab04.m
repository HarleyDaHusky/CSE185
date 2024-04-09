%% #2 ratio = 0.1
img = im2double(imread('lena.jpg'));
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_pass_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_pass_0.1.jpg');
%% #3 ratio = 0.2
ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_pass_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_pass_0.2.jpg');
%% #5 low marilyn high einstein
name1 = 'marilyn.jpg';
name2 = 'einstein.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));

ratio = 0.2;
img_merged = hybrid_image(img1, img2, ratio);
imwrite(img_merged, 'hybrid_1.jpg');
%% #6 low einstein high marilyn
ratio = 0.2;
img_merged = hybrid_image(img2, img1, ratio);
imwrite(img_merged, 'hybrid_2.jpg');