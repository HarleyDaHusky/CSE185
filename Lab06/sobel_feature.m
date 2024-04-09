function [magnitude, orientation] = sobel_feature(img)

    % horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; 
    % vertical edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; 
    
    %% Sobel filtering
    Gy = imfilter(img, Hy);
    Gx = imfilter(img, Hx);
    
    %% compute gradient magnitude and orientation
    magnitude = sqrt((Gy.^2) + (Gx.^2)); 
    orientation = atan2(Gy, Gx); 

end
