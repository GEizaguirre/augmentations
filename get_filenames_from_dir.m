function [filenames] = get_filenames_from_dir(dir_name)
    files = dir(dir_name);
    filenames = [];
    for f = 1:length(files)
        if ( strcmp(files(f).name, '.') ~= 1 ) && ( strcmp(files(f).name, '..') ~= 1 )
            fname = strcat(dir_name, "/", files(f).name);
            filenames = [filenames, fname];
        end
    end
end

            

