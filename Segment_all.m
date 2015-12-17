% segments all audio files in current folder
% saves audio data as array of cells,
% 1 cell per segment

data = mirgetdata(miraudio('folder'));
% data is 1 file per cell
training_samples = [];
testing_samples = [];

% you might get a warning from Segment if it finds 24 segments
% instead of 25.
for i=(1:length(data))
    cells = num2cell(Segment(data{i}, 25),1);
    % split testing and training evenly
    training_samples = [training_samples,cells(1:12)];
    testing_samples = [testing_samples,cells(13:24)];
end

save('training_samples','training_samples');
save('testing_samples','testing_samples');