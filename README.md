# keyboard-audio-analysis
Created by me and RayStormX

Summary:
Extracts data from recordings of keystrokes.  Attempts to predict the key that was pressed based on that data.
Requires [mirtoolbox](http://www.mathworks.com/matlabcentral/fileexchange/24583-mirtoolbox)

Detailed Summary:

1. uses 26 recordings of 25 keystrokes for each letter A-Z.
2. Segment_all function is used to segment these recordings into waveforms of each keystroke
3. getfeatures is used to extract and trim the push peak from each waveform
4. The main driver trains and tests multiple SVM's (support vector machines) for each key.
5. The false positive and negative rate is extracted from the resulting classifications.

Also thanks to the authors of this paper:
http://www.almaden.ibm.com/cs/projects/iis/hdb/Publications/papers/ssp04.pdf
