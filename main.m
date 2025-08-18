addpath("functions\"); 
addpath("graphs\");
addpath("testing\");

warning('off','all'); 

delta = 1e-4; 
toll = 1e-8; 
it = 10; 
maxit = 100; 

%% TEST WITH WELL SPACED EIGENVALUES
spaced_eigenvalues = [2, 350, 4332];
spaced_results = zeros(1,7);

for i = 1:7 
    A = test_matrix_gen(spaced_eigenvalues,i * ones(size(spaced_eigenvalues)));
    res = test_diagonalization(A, spaced_eigenvalues, delta, toll, it, maxit);
    spaced_results(i) = res;
end

% TEST WITH CLUSTERED EIGENVALUES
clustered_results = []; 
clustered_max_multiplicity = 1; 
clustered_max_delta = 0; 

for i = 1:4 
    clustered_eigenvalues = [2 + 3 * 10^-i, 2 + 2 * 10^-i, 2 + 10^-i];
    row_results = [];
    
    for j = 1:7 
        A = test_matrix_gen(clustered_eigenvalues, j * ones(size(clustered_eigenvalues))); 
        res = test_diagonalization(A, clustered_eigenvalues, delta, toll, it, maxit);
        row_results = [row_results, res];
    end
    
    if length(row_results) < 7
        row_results(end+1:7) = NaN;
    end
    
    clustered_results = [clustered_results; row_results];
end 

spaced_graph(spaced_results);
clustered_graph(clustered_results);