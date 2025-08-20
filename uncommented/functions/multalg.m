function [l,m,flag] = multalg(A,l0,toll,it,maxit)

    if size(A,1) ~= size(A,2)                                                   % matrix size integrity check
        error("The matrix A is not squared!");
    end

    x0 = l0;                                                                    % newton method start

    for i=1:it

        [~,g] = myobjective(x0,A);                                              % g = -f/f'
        x1 = x0 + g;

        steps(i) = abs(x1 - x0);                                                % keep all the step values for heuristics

        if steps(i) < toll                                                      % tollerance check
            m=1;
            flag=1;           
            l=x1;
            return;
        end

        x0 = x1;                                                                % next cycle

    end

    m = round(1/(1-(steps(end)/steps(end-1))));                                 % heuristics

    x0 = l0;                                                                    % modified newthon method start

    for n=1:9                                                                   % 10 * maxit cycle
        for i=1:maxit                                                           % maxit cycle modified newton method

            [~,g] = myobjective(x0,A);
            x1 = x0 + m*g;

            step = abs(x1 - x0);

            if step < toll                                                      % step criteria check
                flag=1;
                l=x1;
                return
            end

        x0 = x1;

        end

        m=m+1;                                                                  % increment multiplicity

    end

    l=x1;
    flag=0;

end