function sol = simpson(f, a, b, epsilon)
    %Inizializzazione
    n = 4;
    In_prev = calcolo(f, a, b, n);
    stop = false;
    
    %Iterazione
    while stop == false;
        %Aggiornamento n e calcolo nuovo valore
        n = n * 2;
        In_curr = calcolo(f, a, b, n);

        %Controllo sulla differenza delle due iterazioni
        if abs(In_curr - In_prev) < epsilon
            stop = true;
        else
            In_prev = In_curr;
        end
    end
    
    sol = In_curr;
end

function In = calcolo(f, a, b, n)
    %Calcolo di h
    h = (b - a)/n;

    %Calcolo prima sommatoria
    somma1 = 0;
    for j = 1 : (n/2) - 1
        somma1 = somma1 + f(a + 2*j*h);
    end

    %Calcolo seconda sommatoria
    somma2 = 0;
    for j = 1 : (n/2)
        somma2 = somma2 + f(a + (2*j - 1)*h);
    end

    %Calcolo In
    In = h/3 * (f(a) + 2*somma1 + 4*somma2 + f(b));
end