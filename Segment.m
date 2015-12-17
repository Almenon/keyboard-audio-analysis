function [samples] = Segment(data,num_segments)
% accepts a x by 2 vector
% returns a sample in each column
data = mean(data,2); % compress into one channel
data(data<0) = []; % delete bottom half
window = 200;
i = 0;
num_segments = num_segments + 1; % account for minima at the start

mavg = movingmean(data,window);
% invert data to find valleys
mavginv = 1.01*max(mavg) - mavg;
[~,min_indices] = findpeaks(mavginv,'minpeakdistance',4000,...
    'Npeaks',num_segments);
%if length(min_indices)~=num_segments
%    error('sorry not able to segment to that number')
%end

% display peaks if desired
findpeaks(mavginv,'minpeakdistance',4000,...
    'Npeaks',num_segments);

% segment at min_indices
% divide by frequency to get indices in seconds
min_indices = min_indices/44100; 
samples = mirgetdata(mirsegment(data,min_indices));
% get rid of bad samples at end and start
samples(:,1) = [];
samples(:,size(samples,2)) = [];
% thanks to http://www.mathworks.com/matlabcentral/
% answers/44227-finding-local-minimums-maximums-for-a-set-of-data
