clear all;
close all;
set(0,'DefaultFigureWindowStyle','docked');
[params, param_labels, species_labels] = setparameters();
h = 0.025;
showplot=1;
multiplier_mesh = 0+h:h:2-h;
num_multiplier_idx = size(multiplier_mesh, 2);
for param_idx=1:size(params, 2)
    param_label = param_labels{param_idx};
    fprintf("Mutating param %s\n", param_label);
    center_value = params(param_idx);
    y_final = cell(num_multiplier_idx, 1);
    for multiplier_idx=1:num_multiplier_idx
        mutated_value = multiplier_mesh(multiplier_idx)*center_value;
        params(param_idx) = mutated_value;
        y_final{multiplier_idx} = evolve(params, showplot);
        
    end
    figure;
    hold on;
    num_species=size(y_final{1}, 2)-1;
    legend_array = cell(num_species, 1);
    for species_idx=1:num_species
        species_label = species_labels{species_idx};
        species_variation = zeros(num_multiplier_idx, 1);
        for multiplier_idx=1:num_multiplier_idx
            species_variation(multiplier_idx) = y_final{multiplier_idx}(species_idx);
        end
        X = (multiplier_mesh*center_value)';
        Y = species_variation;
        [rho, pval] = corr(X, Y, 'Type', 'Spearman');
        scatter(X, Y);
        legend_str = sprintf("%s rho = %f pval = %f", species_label, rho, pval);
        legend_array{species_idx} = legend_str;
    end
    title_str = sprintf("Variation with %s", param_label);
    title(title_str);
    xlabel(param_label);
    legend(legend_array);
    drawnow;
    params(param_idx) = center_value;
end