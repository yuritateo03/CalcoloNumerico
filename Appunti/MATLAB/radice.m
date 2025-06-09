function [sol, iter] = radice(S, n, epsilon, max_iter)
    %Dalla traccia si assume già che S > 0 e n > 1
    x0 = S;
       
    %Controlli preliminari su n
    if n <= 0
        error("Indice minore di 0");
    end

    if n == 1
        sol = S;
        return;
    end

    %Iterazione
    for iter = 1 : max_iter
        %Calcolo della nuova approssimazione
        x1 = ((n-1)*x0 + S/(x0^(n-1)))/n;

        %Controllo sull'errore relativo
        if (abs(x1 - x0)/abs(x0)) < epsilon
            sol = x0;
            return;
        end
        
        %Aggiornamento dei punti
        x0 = x1;
    end

    warning("Superate iterazioni massime");
    sol = x0;
end