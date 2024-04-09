function [output, match] = template_matching_SSD(img, template, threshold)
    output = zeros(size(img));
    shift_u = floor(size(template,1)/2); %padding = 2
    shift_v = floor(size(template,2)/2);
    for u = 1 + shift_u : size(img, 1)-shift_u
        for v = 1 + shift_v : size(img, 2) - shift_v
            total = 0;
            x1 = v - shift_v; 
            x2 = v + shift_v;
            y1 = u - shift_u; 
            y2 = u + shift_u;
            patch = img(y1:y2, x1:x2); %error here
            % SSD
            for i = 1:size(patch, 1)
                for j = 1:size(patch, 2) 
                    total = total + ((patch(i, j) - template(i, j))^2);
                end
            end
            output(u,v ) = total;
        end
    end
match = (output < threshold);