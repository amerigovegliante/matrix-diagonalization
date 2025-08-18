function [result] = test_diagonalization(A, eigenvals, delta, toll, it, maxit)

    for j = 1:length(eigenvals) 
       [~,ma,result_ma] = multalg(A, eigenvals(j) + delta, toll, it, maxit);
       if result_ma == 0
           result = 0;
           return;
       end
       mg = multgeo(A,eigenvals(j),toll);

       if ma ~= mg 
           result = 0;
           return;
       end
    end
    result = 1;
end