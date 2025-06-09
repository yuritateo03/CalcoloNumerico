function [sol, iter, res] = jacobi(A, b, epsilon, x0, max_iter)
    %Inizializzo le matrici
    D = diag(diag(A));
    R = A - D;

    %Iterazione
    for iter = 1 : max_iter
        %Calcolo del nuovo vettore
        x1 = D \ (b - R * x0);
        
        %Criterio di arresto sull'errore relativo
        if (norm(x1 - x0, inf)/norm(x1, inf)) < epsilon
            sol = x1;
            res = norm(A * x1 - b, inf);
            return;
        end
        
        %Aggiornamento del vettore
        x0 = x1;
    end

    warning("Iterazioni massime superate");
    sol = x1;
    res = norm(A * x1 - b, inf);
end