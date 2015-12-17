% Trains a SVM to be able to classify key-stroke sounds

letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',...
    'P,','S','T','U','V','W','X','Y','Z'
};
home = 'c:\dev\Matlab\Audio Analysis\';


% extract features (comment this out if features are already extracted)

%features = getfeatures(home,['Keystrokes\Single_Key_Press_test']);
load('training_features.mat');
load('testing_features.mat');
mapped_features = containers.Map(letters,features); 
%features by letter if desired

% visualize if desired
% if using more than 3 features use PCA to compress
% into lower-dimensional space, then visualize
% scatter(features(1,:),features(2,:))
% xlabel('feature 1'); ylabel('feature 2');

% do machine learning
% Right now machine learning only works with 25 Keystroke dataset

j = 1;
results = [];
num_samples = length(training_features);

for i = 1:12:num_samples % 12 samples each letter
    labels = zeros(1,num_samples);
    labels(i:i+11) = 1; % categorize letter
    SVMStruct = svmtrain(training_features',labels,...
        'method','LS'); %#ok<SVMTRAIN>
    % For now just test on same data
    results = [results svmclassify(SVMStruct,testing_features')]; %#ok<SVMCLASSIFY>
    correct_classifications = length(find(results(i:i+11,j)==1));
    false_positive_rate(j) = length(find(results(:,j)==1)-correct_classifications)/118;
    false_negative_rate(j) = (12-correct_classifications)/12;
    j = j+1;
end
avg_fp = mean(false_positive_rate(1:26));
avg_fn = mean(false_negative_rate(1:26));
% Sensitivity is 1-false_negative_rate
% Specificity is 1-false_positive_rate
plot(false_positive_rate*100)
xlabel('letters a-z')
ylabel('false positive rate')
title('False Positive Rate of SVM classifier for each letter')

% to do: input results into classPerf to analyze performance more easily
% http://www.mathworks.com/help/bioinfo/ref/classperf.html