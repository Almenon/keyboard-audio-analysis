
% driver is top-level script

% load data
% data is accoustic energy vs. time

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