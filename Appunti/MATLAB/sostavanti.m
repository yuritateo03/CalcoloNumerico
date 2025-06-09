function sol = sostavanti(A, b)
    %Inizializzazione
    n = size(A, 1);
    sol = zeros(n, 1);

    %Iterazione
    for i = 1 : n
        %Calcolo della sommatoria degli aij * xj
        somma = 0;
        for j = 1 : i - 1
            somma = somma + A(i, j)*sol(j);
        end
        
        %Calcolo di xi
        sol(i) = (b(i) - somma)/A(i, i);
    end
end