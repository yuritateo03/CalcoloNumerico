function [sol, iter, res] = halley(f, fd, fdd, x0, epsilon, max_iter)
    %Iterazione
    for iter = 1 : max_iter
        fx = f(x0);
        fdx = fd(x0);
        fddx = fdd(x0);

        %Controllo divisione per 0
        if (2*(fdx)^2 - (fx * fddx)) == 0
            error("Divisione per 0");
        end

        %Calcolo nuovo punto
        x1 = x0 - ((2*fx*fdx)/(2*(fdx)^2 - (fx * fddx)));

        %Controllo sull'errore relativo
        if (abs(x1 - x0)/abs(x1)) < epsilon
            sol = x1;
            res = f(x1);
            return;
        end

        %Aggiornamento dei punti
        x0 = x1;
    end
    
    warning("Iterazioni massime raggiunte");
end
