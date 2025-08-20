function [] = spaced_graph(spaced_results) 
    figure;                                                                         
    bar(1:7, spaced_results, 'FaceColor',[0 1 0]);                                  
    xlabel('Multiplicity');
    ylabel('Diagonalization Success (1 = success, 0 = fail)');
    title('Well Spaced Eigenvalues: Diagonalization Success vs Multiplicity');
    ylim([-0.2 1.2]);                                                               
    grid on;

end
