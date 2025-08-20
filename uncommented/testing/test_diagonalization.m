function [result] = test_diagonalization(A, eigenvals, delta, toll, it, maxit)

    for j = 1:length(eigenvals) 
       [~,ma,result_ma] = multalg(A, eigenvals(j) + delta, toll, it, maxit);
       if result_ma == 0                                                        % check if the algebraic-multiplicity method fails
           result = 0;
           return;
       end
       mg = multgeo(A,eigenvals(j),toll);

       if ma ~= mg                                                              % check if algebraic-multiplicity differs to geometric-multiplicity
           result = 0;
           return;
       end
    end
    result = 1;                                                                 % if each check fails, ma = mg so the matrix is diagonalizable
end