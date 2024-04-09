%#1 load image
img = imread('01.jpg');

% green channel to 0 and save image
img(:,:,2) = 0;
imwrite(img, 'green.jpg');
%-------------------------------------------------------
%#2 load image
img2 = imread('01.jpg');

% Grayscale
img2 = im2double(img2);
R = img2(:,:,1);
G = img2(:,:,2);
B = img2(:,:,3);
img2 = 0.299 * R + 0.587 * G + 0.114 * B;
imwrite(img2, 'gray.jpg');
%-------------------------------------------------------
%#3 load image
img3 = imread('01.jpg');

%rotate image 90 degrees
img3 = imrotate(img3, 90);
imwrite(img3, 'rotate.jpg');
%-------------------------------------------------------
%#4 load image
img4 = imread('01.jpg');

%crop image (upper left (30,100), lower right (270,300)
img4cropped = imcrop(img4,[30, 100, 270, 300]);
imwrite(img4cropped, 'crop.jpg');
%-------------------------------------------------------
%#5 load image
img5 = imread('01.jpg');

%flip image 
img5 = flip(img5, 2);
imwrite(img5, 'flip.jpg');
%-------------------------------------------------------
%#6 load image
img61 = imread('01.jpg');
img62 = imread('02.jpg');
img63 = imread('03.jpg');
img64 = imread('04.jpg');
%combine image
zcanvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300,1:400, :) = img61;
canvas(1:300,416:815,:)=img62;
canvas(316:615,1:400,:)=img63;
canvas(316:615,416:815,:)=img64;
imwrite(canvas, 'combine.jpg');
%-------------------------------------------------------
% %test
% img11 = imread('01.jpg');
% img12 = imread('02.jpg');
% size(img12);
% imgV11 = img11(:);
% imgV12 = img12(:);
% avg = (imgV11+imgV12)/2;
% avg=reshape(avg,300,400,3);
% imwrite(avg,('test.jpg'));
%#7 load image
img71 = imread('05.jpg');
img72 = imread('06.jpg');
size(img72);
imgV71 = img71(:);
imgV72 = img72(:);
avg = (imgV71+imgV72)/2;
avg=reshape(avg,375,1242,3);
imwrite(avg,('average.jpg'));