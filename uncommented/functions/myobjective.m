function [f,g] = myobjective(z,A)

    if size(A,1) ~= size(A,2)                                   
        error("The matrix A is not squared!");                  
    end
        
    B = A - z * eye(size(A));                                   

    [L,U,P] = lu(B);                                            

    detU = prod(diag(U));                                       
    detP = det(P);                                              
    detB = detU / detP;                                         

    f = detB;

    % B matrix inversion

    id = eye(size(B));                                          
    y = L \ (P * id);                                           
    Binv = U \ y;                                               

    g = 1 / trace(Binv);                                        
end