function [] = spaced_graph(spaced_results) 
    figure;                                                                         % new figure
    bar(1:7, spaced_results, 'FaceColor',[0 1 0]);                                  % bar chart with 1 to 7 values on x-axis, and green color
    xlabel('Multiplicity');
    ylabel('Diagonalization Success (1 = success, 0 = fail)');
    title('Well Spaced Eigenvalues: Diagonalization Success vs Multiplicity');
    ylim([-0.2 1.2]);                                                               % y-axis range set for better view
    grid on;
end