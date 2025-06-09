function [sol, iter, res] = steffensen(f, x0, epsilon, max_iter)
    %Iterazione
    for iter = 1 : max_iter
        f0 = f(x0);
        den = f(x0 + f0) - f0;
        
        %Controllo divisione per 0
        if den == 0
            error("Divisione per 0");
        end
        
        %Calcolo nuovo punto
        x1 = x0 - ((f0^2)/den);
        
        %Criterio di arresto sull'errore relativo
        if (abs(x1 - x0)/abs(x1)) < epsilon
            sol = x1;
            res = f(x1);
            return;
        end
        
        %Aggiorna i punti
        x0 = x1;
    end

    warning("Superate iterazioni massime");
    sol = x1;
    res = f(x1);
end