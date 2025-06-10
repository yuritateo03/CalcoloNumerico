function [sol, iter] = potenzeinv(A, x0, epsilon, max_iter)
    %Prima iterazione
    y = x0/norm(x0, 2);
    x1 = A \ y;
    v0 = transpose(y) * x1;

    x0 = x1;

    %Successive iterazioni
    for iter = 2 : max_iter
        %Calcolo del nuovo vettore e del nuovo v
        y = x0/norm(x0, 2);
        x1 = A \ y;
        v1 = transpose(y) * x1;

        if abs(v1 - v0) < epsilon * abs(v1)
            sol = 1/v1;
            return;
        end
        
        %Aggiornamento valori
        x0 = x1;
        v0 = v1;
    end

    warning("Iterazioni massime raggiunte");
    sol = 1/v1;
end