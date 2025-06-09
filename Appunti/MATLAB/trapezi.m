function [sol] = trapezi(f, a, b, epsilon)
    %Inizializzazione
    n = 4;
    In_prev = trapezio(f, a, b, n);
    stop = false;
    
    %Iterazione
    while stop == false
        n = n * 2;
        In_curr = trapezio(f, a, b, n);

        %Controllo sulla differenza tra le due iterazioni
        if abs(In_curr - In_prev) < epsilon
            stop = true;
        else
            In_prev = In_curr;
        end
    end
    sol = In_curr;
end

function In = trapezio(f, a, b, n)
    %Calcolo di h
    h = (b - a)/n;
    
    %Calcolo della sommatoria
    sum = 0;
    for j = 1 : n - 1
        sum = sum + f(a + j*h);
    end
    
    %Calcolo di In
    In = h/2 * (f(a) + 2*sum + f(b));
end 