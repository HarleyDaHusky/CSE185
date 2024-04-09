function [output, match] = template_matching_normcorr(img, template, threshold)
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
            patch = img(y1:y2, x1:x2);
            % Normalized Cross-Correlation
            patch = patch(:);
            template = template(:);
            newPatch = patch - mean(patch);
            newTemplate = template - mean(template);
            new2Patch = newPatch/norm(newPatch);
            new2Template = newTemplate/norm(newTemplate);
            value = dot(new2Patch, new2Template);
            output(u,v) = value;
        end
    end
match = (output > threshold);