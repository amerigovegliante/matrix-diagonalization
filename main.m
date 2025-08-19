addpath("functions\"); 
addpath("graphs\");
addpath("testing\");

warning('off','all'); 

delta = 1e-4;                                                                                       % starting point for newthon method
toll = 1e-8;                                                                                        % tollerance for zeros
it = 10;                                                                                            % iterations for classic newthon method
maxit = 100;                                                                                        % iterations for modifier newthon method

%% TEST WITH WELL SPACED EIGENVALUES
spaced_eigenvalues = [2, 350, 4332];
spaced_results = zeros(1,7);

for i = 1:7 
    A = test_matrix_gen(spaced_eigenvalues,i * ones(size(spaced_eigenvalues)));                     % jordan matrix with eigv with i multiplicity
    res = test_diagonalization(A, spaced_eigenvalues, delta, toll, it, maxit);                      % check if A is diagonalizable
    spaced_results(i) = res;                                                                        % store result (0 or 1)
end

% TEST WITH CLUSTERED EIGENVALUES
clustered_results = []; 

for i = 1:4 
    clustered_eigenvalues = [2 + 3 * 10^-i, 2 + 2 * 10^-i, 2 + 10^-i];                              % [2.3, 2.2, 2.1, 2.0] ... [2.0003, ... , 2]
    row_results = [];                                                                               % results of the given delta
    
    for j = 1:7 
        A = test_matrix_gen(clustered_eigenvalues, j * ones(size(clustered_eigenvalues)));          % jordan matrix with eigv with i multiplicity
        res = test_diagonalization(A, clustered_eigenvalues, delta, toll, it, maxit);               % check if A is diagonalizable
        row_results = [row_results, res];                                                           % store results
    end
    
    if length(row_results) < 7                                                                      
        row_results(end+1:7) = NaN;
    end
    
    clustered_results = [clustered_results; row_results];                                           % store new row in the total results
end 

spaced_graph(spaced_results);                                                                       % graph for the well spaced eigv experiment
clustered_graph(clustered_results);                                                                 % graph for the clustered eigv experiment   