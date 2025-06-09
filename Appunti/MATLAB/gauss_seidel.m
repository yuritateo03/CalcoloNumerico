function[sol, iter, res] = gauss_seidel(A, b, epsilon, x0, max_iter)
    %Inizializzo le matrici
    L = tril(A);
    U = A - L;
    
    %Iterazione
    for iter = 1 : max_iter
        %Calcolo del nuovo vettore
        x1 = L \ (b - U*x0);
        
        %Criterio di arresto dell'errore relativo
        if (norm(x1 - x0, inf)/norm(x1, inf)) < epsilon
            sol = x1;
            res = norm(A * x1 - b, inf);
            return;
        end
       
        %Aggiornamento del vettori
        x0 = x1;
    end

    warning("Iterazioni massime superate");
    sol = x1;
    res = norm(A * x1 - b, inf);
end