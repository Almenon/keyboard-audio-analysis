function [push_peak] = push_peak_extraction(data)
% extracts push peak from mean channel waveform of a single keystroke
% push peak in vast majority of cases has the max value in the signal

[M,I] = max(data);
lower_bound = I - 3000;
upper_bound = I + 3000;

push_peak = data(lower_bound:upper_bound);
plot(push_peak)
mirStruct = miraudio(push_peak,44100);
push_peak = mirgetdata(miraudio(mirStruct,'trim'));