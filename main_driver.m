
% driver is top-level script

letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N'};

% right now script just works with this folder
% remember to be in main folder for cd command to work
cd('Data_Set_Silence_Truncate_n35DB\5_key_Press_normal');
miraudio = miraudio('folder');
% audio is cells, each cell being audio data for a key
% audio data is accoustic energy vs. time
% order is A-Z
audio = mirgetdata(miraudio); 


mapped_audio = containers.Map(letters,audio);
% this allows us to index audio by ex: mapped_audio('A')
scatter(mapped_audio('A'),mapped_audio('B'))

% get rid of silence

% Optional:
% compress it into one chanel 
    % miraudio may do this automatically - check
% possibly get rid of bottom half?
% bottom half is similar to top half so im not sure if it's needed

% extract features
% I would guess most important features would be:
    % average value 
        % (use mirrms())
    % variance 
        %(not sure what to use, maybe standard deviation?)
    % # high peaks
    % spacing of each peak
    
   % we might just be able to call mirfeatures

% other features I could do:
    % mirspectrum: analyzes frequency
    % mirflux: change in frequency
    % brightness: what frequency most of sound energy is at
    
    
% do machine learning

cd('..'); cd('..');
