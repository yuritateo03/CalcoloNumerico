function [sol, iter] = traub(f, Df, x0, epsilon, max_iter)
    %Iterazione
    for iter = 1 : max_iter
        %Calcolo derivata per ottimizzare
        Df_val = Df(x0);

        %Controllo divisione per 0
        if Df_val == 0
            error("Divisione per 0");
        end
        
        %Calcolo nuovo punto
        y0 = x0 - (f(x0)/Df_val);
        x1 = y0 - (f(y0)/Df_val);

        %Controllo errore relativo
        if (abs(x1 - x0)/abs(x1)) < epsilon
            sol = x1;
            return;
        end

        %Aggiorna i punti
        x0 = x1;
    end
    
    warning("Numero iterazioni superato");
    sol = x1;
end



        