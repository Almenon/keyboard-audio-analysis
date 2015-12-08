
% driver is top-level script

% load data
% data is accoustic energy vs. time

features = zeros(2,2); % r is letters, c is feature
num_features = 2;

j=1;
letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N'};
for i=letters
    features(j,1) = mirgetdata(mirrms(strcat(i{1},'.wav')));
    features(j,2) = mirgetdata(mirflatness(strcat(i{1},'.wav')));
    j = j+1;
end
disp(features)
scatter(features(:,1),features(:,2))
% get rid of silence

% Optional:
% compress it into one chanel 
    % miraudio may do this automatically - check
% possibly get rid of bottom half?
% bottom half is similar to top half so im not sure if it's needed

% extract features
% I would guess most important features would be:
    % average value 
        % (use mirrms())
    % variance 
        %(not sure what to use, maybe standard deviation?)
    % # high peaks
    % spacing of each peak
    
   % we might just be able to call mirfeatures

% other features I could do:
    % mirspectrum: analyzes frequency
    % mirflux: change in frequency
    % brightness: what frequency most of sound energy is at
    
    
% do machine learning