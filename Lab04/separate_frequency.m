function [low_pass_img, high_pass_img] = seperate_frequency(img, ratio)
    %% apply FFT
    frequency_map = fft2(img);
    %% shift the frequency map
    frequency_map_shifted = fftshift(frequency_map);
    %% compute the low-frequency mask
    x = size(img,2)/2;
    y = size(img,1)/2;
    y1 = y-(ratio*size(img,1)/2);
    y2 = y+(ratio*size(img,1)/2);
    x1 = x-(ratio*size(img,2)/2);
    x2 = x+(ratio*size(img,1)/2);
    mask = zeros(size(img));
    mask(y1:y2, x1:x2,:) = 1;
    %% seperate low-frequency and high-frequency maps
    low_frequency_map_shited = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1-mask);
    %% shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shited);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    %% apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map));
    high_pass_img = real(ifft2(high_frequency_map));
end