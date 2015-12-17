function [features] = getfeatures(home,folder)
    % returns matrix of features for given folder
    % r is features, c is samples
    % folder must be inside home directory
    cd(strcat(home,folder));
    
    % comment below line out if you already have a cell array 
    % from Segment_all.m
    audioCells = mirgetdata(miraudio('folder'));
    number_samples = length(audioCells);
    features = zeros(513,number_samples);
    % 513 is number of elements in spectogram
    
    for n=1:number_samples
        % extract push peak
        push_peak = extract_push_peak(audioCells{n});
        % turn into mir object to pass into spectogram
        mirObj = miraudio(push_peak(:,n));        
        % get spectogram
        mirObj = mirspectrum(mirObj);
        features(:,n)=mirgetdata(mirObj);
    end
    
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
