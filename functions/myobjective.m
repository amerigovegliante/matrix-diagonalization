function [f,g] = myobjective(z,A)

    if size(A,1) ~= size(A,2)                                   % matrix size integrity check
        error("The matrix A is not squared!");                  
    end
        
    B = A - z * eye(size(A));                                   % A = B - zI

    [L,U,P] = lu(B);                                            % lu factorization with partial pivoting

    detU = prod(diag(U));                                       % detU is the product of it's diagonal values
    detP = det(P);                                              % detP = +1 or -1 because it's a permutation matrix
    detB = detU / detP;                                         % detU = detB * detP

    f = detB;

    % B matrix inversion

    id = eye(size(B));                                          % n x n identity matrix
    y = L \ (P * id);                                           % solve linear system L*y = P*id
    Binv = U \ y;                                               % solve linear system U*Binv = y

    g = 1 / trace(Binv);                                        % g = trace(B^-1)
end