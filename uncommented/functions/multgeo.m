function [k] = multgeo(A, l, toll) 

    if size(A,1) ~= size(A,2)                   
        error("A is not a square matrix!");
    end

    [~,U,~] = lu(A - l * eye(size(A)));         %

    k = sum(abs(diag(U)) < toll);               
end

