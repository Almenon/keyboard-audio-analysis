function [push_peak] = extract_push_peak(data)
% extracts push peak from audio data of a single keystroke
% push peak in vast majority of cases has the max value in the signal

% data = mean(data,2); % compress into one channel if needed

[~,I] = max(data);
bound = 438; % push peak width/2 is somewhere near this
lower_bound = I - bound; 
upper_bound = I + bound;
if lower_bound<1
    lower_bound = 1;
end
if upper_bound>length(data)
    upper_bound = length(data);
end

push_peak = data(lower_bound:upper_bound);
% plot(push_peak) % for debugging purposes
mirStruct = miraudio(push_peak,44100);
push_peak = mirgetdata(miraudio(mirStruct,'trim'));