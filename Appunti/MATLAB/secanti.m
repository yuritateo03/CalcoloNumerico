function [x_zero, iter] = secanti(f, x0, x1, tolleranza, max_iter)
    % Iterazione
    for iter = 1 : max_iter
        %Calcolo del nuovo punto
        f0 = f(x0);
        f1 = f(x1);

        if (f1 - f0) == 0
            fprintf('Errore: %.12f %.12f\n', f0, f1);
            error("Divisione per 0");
        end

        x2 = x1 - ((f1 * (x1 - x0))/(f1 - f0));

        %Controllo sull'errore relativo
        if (abs(x2 - x1)/abs(x2)) < tolleranza
            x_zero = x2;
            return;
        end

        %Aggiorna i punti
        x0 = x1;
        x1 = x2;
    end

    warning("Iterazioni massime raggiunte")
    x_zero = x2;
end

