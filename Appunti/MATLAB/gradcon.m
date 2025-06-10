function [sol, iter, res] = gradcon(A, b, x0, epsilon, max_iter)
    %Inizializzazione
    xk = x0;
    rk = b - A*xk;
    pk = rk;

    %Iterazione
    for iter = 1 : max_iter
        %Step dell'algoritmo fornito dall'esercizo
        Apk = A * pk;
        ak = (rk'*rk)/(pk'*Apk);
        x1 = xk + ak*pk;
        r1 = rk - ak*Apk;
        
        %Controllo sulla tolleranza
        if norm(r1, 2) < epsilon * norm(x1)
            sol = x1;
            res = norm(r1, 2);
            return;
        end
        
        %Continuo algoritmo
        beta = (r1'*r1)/(rk'*rk);
        p1 = r1 + beta*pk;
        
        %Aggiornamento valori
        xk = x1;
        rk = r1;
        pk = p1;
    end

    warning("Iterazioni massime raggiunte");
    sol = x1;
    res = norm(r1, 2);
end