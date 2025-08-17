function [A] = matrix_gen(eigenvals, multiplicities)

    J = create_jordan(eigenvals, multiplicities);

    [Q,~] = qr(rand(size(J)));

    A = Q' * J * Q;

end

function J = create_jordan(eigenvals, multiplicities) 
    
    J = [];

    if length(eigenvals) ~= length(multiplicities) 
        error("The eigenvalues given are more than the multeplicities");
    end

    for k = 1:length(eigenvals)
        block = eigenvals(k) * eye(multiplicities(k)); 
        for i = 1:multiplicities(k) - 1 
            block(i,i + 1) = 1;
        end
        J = blkdiag(J,block);
    end
end



