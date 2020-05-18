function [] = augment_dataset_4(directory)
   % Augmentation strategy imitating Human Protein Atlas Image Classification
    % competition fourth model's augmentation algorithm.
    patch_size = 128;
    num_patches_per_image = 2;
    filenames = get_filenames_from_dir( directory );
    for i = 1:length(filenames)
        [ filepath, name, ext ] = fileparts(filenames(i));
        img = imread(filenames(i));
        % cut random patches
        for j = 1:num_patches_per_image
            patch_pos = round(((length(img) - patch_size) - 1 ) * rand(1) + 1 );
            img = imcrop(img, [patch_pos patch_pos patch_pos+patch_size patch_pos+patch_size]);
            name = append(name, "_var", int2str(j));
            imwrite ( img, fullfile(directory, append(name, ext)));
        end
    end
end

