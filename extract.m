function [ data ] = extract( data )
%EXTRACT extracts features
%   Detailed explanation goes here


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

end

