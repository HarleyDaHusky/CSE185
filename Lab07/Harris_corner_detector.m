function [corner_x, corner_y] = Harris_corner_detector...
                                    (I, sigma1, sigma2, alpha, R_threshold)
    
	%% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    
    %% derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];

    
    
    %% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    %Ix = imfilter(I, gaussian_kernel1, 'replicate');
    Ix = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dx, 'replicate');
    %Iy = imfilter(I, gaussian_kernel2, 'replicate');
    Iy = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dy, 'replicate');

    %figure, imshow(Ix + 0.5);
    %figure, imshow(Iy + 0.5);
    imwrite(Ix, 'Cameraman_Ix.png');
    imwrite(Iy, 'Cameraman_Iy.png');



    %% compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;

    
    
    %% compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2, 'replicate');
    Syy = imfilter(Iyy, gaussian_kernel2, 'replicate');
    Sxy = imfilter(Ixy, gaussian_kernel2, 'replicate');

    
    
    %% compute corner response from determine and trace
    det = Sxx .* Syy - Sxy .* Sxy;
    trace = Sxx + Syy;
    R = det - alpha * trace.^2;

    figure, imagesc(R); colormap jet; colorbar; axis image;
    imwrite(ind2rgb(im2uint8(mat2gray(R)), parula(256)), 'Cameraman_R.png');
    
    
    %% find corner map with R > R_threshold
    corner_map = R > R_threshold;
    
    %figure, imshow(corner_map);
    imwrite(corner_map, 'Cameraman_Corner_Map.png');

    
    
    %% find local maxima of R
    local_maxima = imregionalmax(R);
    
    %figure, imshow(local_maxima)
    imwrite(local_maxima, 'Cameraman_local_maxima.png');

    
    
    %% final corner map and corner x, y coordinates
    final_corner_map = corner_map & local_maxima;

    %figure, imshow(final_corner_map)
    imwrite(final_corner_map, 'Camerman_Final_Corner_Map.png');

    [corner_y, corner_x] = find(final_corner_map);

end

