function [l,m,flag] = multalg(A,l0,toll,it,maxit) 
    m = 1;

    if size(A,1) ~= size(A,2)                   % A size integrity check
        error("A is not a square matrix!");
    end

    [steps,flag,l] = newton(A,l0,toll,it,m);

    if flag == 1 
        return;
    end

    sk1 = steps(end);
    sk = steps(end - 1);

    m = 1 / (1 - sk / sk1);
    
    i = 0;

    while i < 10 
        [~,flag,l] = newton(A,l0,toll,maxit,m);
        if flag == 1 
            m = round(m);
            return;
        end
        m = m + 1;
        i = i + 1;
    end

    m = nan;
    l = nan;
    flag = 0;
end

function [steps,flag,l] = newton(A,l0,toll,it,m)
    
    steps = zeros(1,it);
    
    l = l0;

    flag = 0;

    for k = 1:it 
        x0 = l;
        [~,g] = myobjective(x0,A);
        l = x0 + m * g;

        step = abs(l - x0);
        if step < toll 
            flag = 1;
            steps = steps(1:k);
            return;
        end

        steps(k) = step;

    end

end