function [letter_mean,letter_variance] = featureanalyze(features,samples_per_letter)
% finds variance and mean of features
% assumes features is a matrix with each column being a sample
% outputs two matrices with each column a letter

    rLength = size(features,1);
    cLength = size(features,2);
    letter_mean = zeros(rLength,cLength);
    letter_diff = zeros(rLength,cLength);
    j = 1;
    
    for i = (1:26)
        letter_mean(1:4,i) = mean(features(1:4,j:(j+4)),2);
        letter_diff(1:4,i) = max(features(1:4,j:(j+4))')-min(features(1:4,j:(j+4))');
        j = j+samples_per_letter;
    end

    letter_variance = letter_diff/2;

end