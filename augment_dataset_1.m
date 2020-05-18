function [] = augment_dataset_1 (directory)
    % Augmentation strategy imitating Human Protein Atlas Image Classification
    % competition winner's augmentation algorithm.
    patch_size = 128;
    num_patches_per_image = 2;
    filenames = get_filenames_from_dir( directory );
    for i = 1:length(filenames)
        [ filepath, name, ext ] = fileparts(filenames(i));
        img = imread(filenames(i));
        % flip and rotate 90º
        img = imrotate(flipdim(img, 2), 90);
        % cut random patches
        for j = 1:num_patches_per_image
            patch_pos = round(((length(img) - patch_size) - 1 ) * rand(1) + 1 );
            img_aux = imcrop(img, [patch_pos patch_pos patch_pos+patch_size patch_pos+patch_size]);
            name = append(name, "_var", int2str(j));
            imwrite ( img_aux, fullfile(directory, append(name, ext)));
        end
    end
end

