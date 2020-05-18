function [] = augment_dataset ( input_directory, output_directory, option )
    % Augmentation strategies imitating Human Protein Atlas Image 
    % Classification best first and fourth models' algorithms.
    % Ouyang, W., Winsnes, C. F., Hjelmare, M., Cesnik, A. J., Åkesson, L.,
    % Xu, H., Sullivan, D. P., Dai, S., Lan, J., Jinmo, P., Galib, S. M., Henkel, 
    % C., Hwang, K., Poplavskiy, D., Tunguz, B., Wolfinger, R. D., Gu, Y., Li, C.,
    % Xie, J., … Lundberg, E. (2019). Analysis of the Human Protein Atlas Image 
    % Classification competition. Nature Methods, 16(12), 1254–1261. 
    % https://doi.org/10.1038/s41592-019-0658-6
    if ~exist( input_directory, 'dir' )
        printf( "ERROR, the input directory does not exist.\nProgram exited with ERROR status.\n" );
    else
        filenames = get_filenames_from_dir( input_directory );
        if input_directory ~= output_directory
            if ~exist( output_directory, 'dir' )
                printf( "Creating output directory %s.\n", output_directory );
                mkdir(output_directory);
            end
            for i = 1:length(filenames)
                [ filepath, name, ext ] = fileparts(filenames(i));
                file_name = fullfile ( output_directory, append(name, ext) );
                imwrite( imread(filenames(i)), file_name ); 
            end
        end
        switch option
            case 1
                augment_dataset_1 ( output_directory );
            case 4
                augment_dataset_4 ( output_directory );
            otherwise
                printf( "The specified option is not correct.\n" );
    end
end

