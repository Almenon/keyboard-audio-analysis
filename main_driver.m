
% driver is top-level script

letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N'};
home = 'c:\dev\Matlab\Audio Analysis\';

% extract data into indexed map
mirStruct = getdata(home,'Data_Set_Silence_Truncate_n35DB\5_key_Press_normal');
data = mirgetdata(mirStruct); 
mapped_data = containers.Map(letters,data);
scatter(mapped_audio('A'),mapped_audio('B'))

% segment it if neccesary
% compress data if faster run-time needed

% extract features

    
    
% do machine learning

