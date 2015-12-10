function [mirStruct] = getdata(home,folder)
    cd(strcat(home,folder));
    mirStruct = miraudio('folder');
    
    % return to home folder
    depth = length(strfind(folder,'\'));
    if depth > 0
        for i=(0:depth)
            cd('..')
        end
    end

end