function sol = sostindietro(A, b)
    %Inizializzazione
    n = size(A, 1);
    sol = zeros(n, 1);
    i = n;
    
    %Iterazione
    while i >= 1

        %Calcolo sommatoria degli aij * xj
        somma = 0;
        for j = i+1 : n
            somma = somma + A(i, j) * sol(j);
        end

        %Calcolo di xi
        sol(i) = (b(i) - somma)/A(i, i);

        i = i - 1;
    end
end