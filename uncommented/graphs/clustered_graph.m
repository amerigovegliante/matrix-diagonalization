function [] = clustered_graph(clustered_results) 
    figure;                                                             
    imagesc(clustered_results);                                         
    colormap([1 0 0; 0 1 0]);                                           
    colorbar('Ticks',[0,1],'TickLabels',{'Fail','Success'});            
    xlabel('Multiplicity');                                             
    ylabel('Delta index (smaller delta = more clustered)');             
    yticks(1:4);                                                        
    yticklabels({'1e-1','1e-2','1e-3','1e-4'});                         
    title('Clustered Eigenvalues: Diagonalization Success');            

end
