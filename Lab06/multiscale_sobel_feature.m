function feature = multiscale_sobel_feature(img, scale)
    % initialize feature vector
    feature = [];

    for i = 1:scale
            %compute sobel feature
            [magnitude, orientation] = sobel_feature(img);

            %concatenate feature vector
            feature = cat(1, feature, magnitude(:));

            %down-sample image by 2
            img = imresize(img, 0.5, 'nearest');
    end
end