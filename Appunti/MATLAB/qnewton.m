function [sol, iter, res] = qnewton(f, x0, h, epsilon, max_iter)
    %Iterazione
    for iter = 1 : max_iter
        f0 = f(x0);
        
        %Calcolo nuovo punto
        x1 = x0 - h*(f0/(f(x0 + h) - f0));
        
        %Controllo sull'errore relativo
        if (abs(x1 - x0)/abs(x1)) < epsilon
            sol = x1;
            res = f(x1);
            return;
        end
        
        %Aggiornamento punto
        x0 = x1;
    end

    warning("Iterazioni superate");
    sol = x1;
    res = f(x1);
end