function [f,g] = myobjective(z,A)
    
    B = A - z * eye(size(A));   % A = B - zI

    [L,U,P] = lu(B);            % lu factorization

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