function [] = clustered_graph(clustered_results) 
    figure;                                                             % new figure tab
    imagesc(clustered_results);                                         % color coded image, if 1 ==> green square, if 0 ==> red square
    colormap([1 0 0; 0 1 0]);                                           % colors for fail and success
    colorbar('Ticks',[0,1],'TickLabels',{'Fail','Success'});            % ticks at values 0 and 1 and labels 0 as failure and 1 as success
    xlabel('Multiplicity');                                             % the x-axis is labeled as "Multiplicity"
    ylabel('Delta index (smaller delta = more clustered)');             % same goes for the y-axis
    yticks(1:4);                                                        % y-axis positions are 1 to 4
    yticklabels({'1e-1','1e-2','1e-3','1e-4'});                         % labels y-axis position as 1e-1 ... 1e-4
    title('Clustered Eigenvalues: Diagonalization Success');            % graph title
end