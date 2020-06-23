function [params, param_labels, species_labels] = setparameters()


param_labels = {'r2', 'Ar', 'KT', 'a', 'sigmaA', 'Beta', 'V', 'Alpha', 'r', 'KX', 'mu', 'gamma2', 'gamma1', 'gamma2s', 'rhoF', 'rhoFs', 'A', 'sigmaF', 'rhoX', 'K1', 'rhoX2', 'sigmaX', 'rMs', 'C', 'sigmaM', 'rM', 'rhoVs', 'rhoV', 'BetaS', 'sigmaV', 'BetaM', 'rhoS', 'sigmaS'};

species_labels = {'A2', 'A1', 'I', 'As', 'Is', 'F', 'X', 'Ms', 'M', 'V', 'S'};


params=zeros(1, size(param_labels, 2));
for param_idx=1:size(param_labels, 2)
    params(param_idx)=1;
    %fprintf("%10s = %f\n", param_labels{param_idx}, params(param_idx));
end