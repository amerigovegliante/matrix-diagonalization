function [k] = multgeo(A, l, toll) 

    if size(A,1) ~= size(A,2)                   % A size integrity check
        error("A is not a square matrix!");
    end

    [~,U,~] = lu(A - l * eye(size(A)));         % lu factorization of A-lI

    k = sum(abs(diag(U)) < toll);               % count how many 0 on the diagonal of U
end
