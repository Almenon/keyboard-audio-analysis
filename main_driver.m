% Trains a machine learning algorithim to 
% be able to classify key-stroke sounds

letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',...
    'P,','S','T','U','V','W','X','Y','Z'
};
home = 'c:\dev\Matlab\Audio Analysis\';

% Trim silence at ends if desired
% mirStruct = miraudio('folder','trim','trimthreshold',.03)
% mirsave(mirStruct)

% extract features (comment this out if features are already extracted)

%features = getfeatures(home,['Keystrokes\Single_Key_Press_test']);
%mapped_features = containers.Map(letters,features); % features by letter if desired


% visualize if desired
% if using more than 3 features use PCA to compress
% into lower-dimensional space, then visualize
scatter(features(1,:),features(2,:))
xlabel('feature 1'); ylabel('feature 2');

% do machine learning

labels = zeros(1,26*5);
labels(1:5) = 1; % categorize A
SVMStruct = svmtrain(features',labels); %#ok<SVMTRAIN>
% For now just test on same data
results = svmclassify(SVMStruct,features'); %#ok<SVMCLASSIFY>
error_rate = length(find(results==1)-5)/130;