addpath("functions\");
warning('off','all');

delta = 1e-4;
toll = 1e-8;
it = 10;
maxit = 100;

%% TEST WITH WELL SPACED EIGENVALUES
spaced_eigenvalues = [2, 350];
spaced_results = [];
spaced_max_multiplicity = 7;

for i = 1:7 
    A = matrix_gen(spaced_eigenvalues,i * ones(size(spaced_eigenvalues)));
    spaced_results = [spaced_results; test_diagonalization(A,spaced_eigenvalues, delta, toll, it, maxit)];

    if spaced_results(i) == 0
        spaced_max_multiplicity = spaced_max_multiplicity - 1;
        break;
    end
end

fprintf("For well spaced eigenvalues the limit we calculated the limit for multiplicity is the following: %d\n\n", spaced_max_multiplicity);

%% TEST WITH CLUSTERED EIGENVALUES
clustered_results = [];
clustered_max_multiplicity = 1;
clustered_max_delta = 0;

for i = 1:4 
    clustered_eigenvalues = [2 + 3 * 10^-i, 2 + 2 * 10^-i, 2 + 10^-i];

    row_results = []; 
    for j = 1:7 
        A = matrix_gen(clustered_eigenvalues, j * ones(size(clustered_eigenvalues)));
        res = test_diagonalization(A, clustered_eigenvalues, delta, toll, it, maxit);
        row_results = [row_results, res];

        if res == 0 
            clustered_max_delta = 10^-i;
            clustered_max_multiplicity = j;
            break;
        end
    end

    % riempio fino a 7 con NaN per avere sempre una matrice rettangolare
    if length(row_results) < 7
        row_results(end+1:7) = NaN;
    end

    clustered_results = [clustered_results; row_results];
end

fprintf("For clustered eigenvalues the limit we calculated is a spacing of %e and multiplicity of %d \n\n", clustered_max_delta, clustered_max_multiplicity);

%% GRAFICO 3: molteplicità massima vs spaziatura (riassunto)
max_mult_per_spacing = nan(1, size(clustered_results,1));
for r = 1:size(clustered_results,1)
    idx = find(clustered_results(r,:) == 0, 1); % primo fallimento
    if isempty(idx)
        max_mult_per_spacing(r) = size(clustered_results,2);
    else
        max_mult_per_spacing(r) = idx - 1;
    end
end

spacings = 10.^(-1:-1:-size(clustered_results,1)); % [1e-1, 1e-2, 1e-3, 1e-4]

figure;
semilogx(spacings, max_mult_per_spacing, '-o','LineWidth',1.5);
xlabel('Spaziatura tra autovalori (\delta)');
ylabel('Molteplicità massima gestibile');
title('Molteplicità massima vs spaziatura (clustered)');
grid on;

%% GRAFICO 4: andamento successi/fallimenti per spaziatura
figure;
plot(1:size(clustered_results,2), clustered_results', 'o-','LineWidth',1.5);
xlabel('Molteplicità');
ylabel('Successo (1) / Fallimento (0)');
title('Andamento dei test per diverse spaziature');
legend(arrayfun(@(i) sprintf('\\delta = 10^{-%d}', i), 1:size(clustered_results,1), 'UniformOutput',false), ...
       'Location','southwest');
ylim([-0.1 1.1]);
grid on;
