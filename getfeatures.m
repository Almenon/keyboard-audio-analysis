function [features] = getfeatures(home,folder)
% warning: takes somewhat long time (2 min)?
    cd(strcat(home,folder));
    
    features = zeros(4,130); % letter is column, feature is row
    
    features(1,:) = mirgetdata(mirrms('folder'));
    features(2,:) = mirgetdata(mirflatness('folder'));
    features(3,:) = mirgetdata(mirzerocross('folder'));
    features(4,:) = mirgetdata(mirskewness('folder'));
    
    % return to home folder
    depth = length(strfind(folder,'\'));
    if depth > 0
        for i=(0:depth)
            cd('..')
        end
    end

end

% NOTES:

    % I could load data with miraudio and use entire waveform as features
    % however, I would have to normalize all waveforms to same length
    
% other possible features:
    % variance 
    % number of high peaks
    % spacing of each peak
    % FFT

% examples:
    % mirspectrum: analyzes frequency via FFT
    %    use 'Normal','NormalLength' to normalize over time and energy
    % mircepstrum: better version of mirspectrum
    %    but no normalization optionss
    % mirflux: change in frequency
    % brightness: what frequency most of sound energy is at
    % mirskewness: what side most of data is on
    
% if waveform needs to be normalized to same size we could use
% resample(a, new_length, length(a))
