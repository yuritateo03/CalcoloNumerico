In questa parte di programma ci concentreremo sulla risoluzione di un problema specifico. Data una certa funzione $f: [a, b] \rightarrow R$, continua nel suo dominio, bisogna calcolare un certo valore $α ∈ [a, b]$ tale che $f(α) = 0$. Graficamente, questo equivale a cercare un punto di intersezione del grafico di $f$ con l'asse delle $x$.

 ![[Metodi numerici per la risoluzione delle equazioni non-lineari 2025-03-03 20.27.59.excalidraw.svg|center]]

Questo è un problema di fondamentale importanza in molte applicazioni pratiche, ad esempio in economia, ingegneria, fisica, biologia e così via. Nonostante ciò, raramente è possibile calcolare esattamente le soluzioni di un'equazione non lineare di questo tipo. In genere, ci si deve accontentare di un'approssimazione della soluzione, ottenuta mediante metodi numerici che vedremo prossimamente. Altre volte un'espressione esatta esiste, invece, ma è troppo complessa da calcolare per cui si preferisce approssimarla numericamente. Un esempio tipico di equazione la cui soluzione non è esprimibile in forma chiusa è un'equazione trascendente mista, ad esempio $x - cos(x) = 0$.
### Teorema degli zeri
Sia $f: [a, b] \rightarrow R$ continua e tale che $f(a)f(b) < 0$ (ovvero $f(a)$ e $f(b)$ hanno segni opposti). Allora esiste un certo $α ∈ (a, b)$ tale che $f(α) = 0$. 

Se $f(α) = 0$, diremo che $α$ è uno *zero* di (o per) $f$.

Il teorema degli zeri assicura che una funzione continua ammetta sempre *almeno* uno zero all'interno di un intervallo ai cui estremi essa assume valori di segno opposto.

Si noti bene che il teorema degli zeri indica una condizione *sufficiente* ma non *necessaria* per la presenza di uno zero, ovvero potrebbe esserci una funzione che non rispetta le ipotesi del teorema degli zeri ma che ha comunque uno zero. Inoltre, queste ipotesi non garantiscono l'unicità dello zero, potrebbero essercene molteplici in quell'intervallo.

![[Metodi numerici per la risoluzione delle equazioni non-lineari 2025-03-03 21.00.26.excalidraw.svg| center]]

Per garantire anche l'unicità dello zero, oltre a verificare le ipotesi del teorema degli zeri, la funzione deve anche essere strettamente monotona (quindi deve essere o strettamente crescente o strettamente decrescente) nell'intervallo $[a, b]$. 

I metodi numerici che studieremo per l'approssimazione degli zeri saranno di natura *iterativa*. Produrranno una successione di approssimazioni che, presumibilmente, converge al valore preciso della soluzione. Ogni valore della successione si calcola mediante il suo predecessore e, man mano che si itera, si otterrà un'approssimazione sempre migliore della soluzione.
## Metodo delle successive bisezioni
Questo è il primo metodo che 