function [l,m,flag] = multalg(A,l0,toll,it,maxit)

if size(A,1) ~= size(A,2)
    error("The matrix A is not squared!");
end

x0 = l0;

for i=1:it

    [~,g] = myobjective(x0,A);
    x1 = x0 + g;
    steps(i) = abs(x1 - x0);

    if (steps(i)<toll)
        m=1;
        flag=1;           
        l=x1;
        return
    end

    x0 = x1;

end

% Newton moddato nel caso Newton semplice fallisca

temp = steps(end)/steps(end-1);
m = round(1/(1-temp));      % calcolo m secondo l'euristica fornita

x0 = l0;

for n=1:9
    for i=1:maxit

        [~,g] = myobjective(x0,A);
        x1 = x0 + m*g;
        step = abs(x1 - x0);

        if (step<toll)
            flag=1;
            l=x1;
            return
        end

    x0 = x1;

    end

    m=m+1;

end

l=x1;
flag=0;

end