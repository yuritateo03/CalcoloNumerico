# Condizionamento di un problema e condizionamento del calcolo degli zeri di una funzione, teorema di Taylor, ordine di convergenza, introduzione al metodo di Newton

### [Lezione precedente](Lezione2.md)

### Condizionamento
Quando risolviamo un problema, dobbiamo tenere presente che i dati e i calcoli che effettuiamo saranno inevitabilmente soggetti ad errori. Questi errori possono essere dovuti a semplificazioni di un modello fisico, errori di misurazione, errori di discretizzazione (ad esempio approssimare una derivata mediante rapporto incrementale), errori di aritmetica di macchina e così via. Quale sarà quindi l'effetto di questi errori sull'accuratezza della soluzione da noi calcolata?

Sia *P* un problema. Supponiamo che al dato $x$ corrisponda la soluzione $y$, e che al dato $x + δx$ corrisponda la soluzione $y + δy$. Diremo che il problema *P* è **ben condizionato** se a piccole perturbazioni di $δx$ corrispondono altrettanto piccole perturbazioni $δy$ della soluzione. In caso contrario, diremo che il problema è *mal condizionato*. Essenzialmente, diremo che un problema è ben condizionato se i risultati sono stabili rispetto a piccoli cambiamenti dei dati, quindi non variano di molto o comunque variano in termini costanti, mentre diremo che un problema è mal condizionato se i risultati sono molto sensibili a piccoli cambiamenti dei dati e variano molto.

![Immagine 1](Excalidraw/2025-03-13_22.30.59.excalidraw.svg)

È possibile quantificare la sensibilità della soluzione a perturbazioni dei dati mediante il cosiddetto *numero di condizionamento*. Immaginiamo di voler cercare il più piccolo valore $K > 0$ per cui è possibile scrivere

![Immagine 2](Excalidraw/2025-03-13_22.41.17.excalidraw.svg)

dove si suppone che $|δx|$ sia un valore piccolo. Questa disuguaglianza esprime che, per piccole perturbazioni attorno al valore $x$, l'errore relativo sulla soluzione non può superare $K$ volte l'errore relativo sul dato. Il numero $K$ è detto **numero o fattore di condizionamento** del problema. Se abbiamo che $K \approx 1$, allora il problema è ben condizionato. Se, invece, $K >> 1$ ($K$ è molto più grande di 1), allora il problema è mal condizionato. In generale, $K$ dipende dal valore del dato, quindi si può dire che sia il risultato di un certo calcolo $K(x)$, una funzione che determina il fattore di condizionamento in base al dato di input. Quindi $K$ non è un valore costante per l'intero problema, ma dipende sì dal problema stesso, ma anche dal dato preso in considerazione. 

Ad esempio, assumiamo che il nostro problema sia un rapporto. Il fattore di condizionamento tenderà ad aumentare per valori di $x$ che rendono il denominatore molto vicini allo zero, mentre tenderà a diminuire per valori di $x$ che rendono il denominatore molto "grande" e quindi distante dallo zero. Come abbiamo visto nell'esempio $f(x) = \frac{1}{x}$, nonostante ci sia poca differenza tra i dati di partenza $1$ e $0,01$, i relativi risultati, ovvero $1$ e $100$, variano molto tra di loro. Prendiamo ora due numeri un po' più distanti dallo zero, ad esempio $3$ e $4$. In questo caso i risultati saranno, rispettivamente, $0,\overline3$ e $0,25$, che sono numeri molto più vicini tra loro rispetto a $1$ e $100$, nonostante i dati di partenza $3$ e $4$ abbiano praticamente la stessa distanza dei dati $1$ e $0,01$. Questo dimostra come il fattore di condizionamento dipenda molto anche dai dati considerati.

Ciò che conta di $K$ è il suo ordine di grandezza, ovvero se ricade nelle unità, oppure nelle decine, nelle centinaia, nelle migliaia e così via. Praticamente non cambia molto tra $K = 1$ e $K = 2$, è sempre di unità costanti che si parla, ma cambia molto tra $K = 1$ e $K = 10^3$, ad esempio, siccome sono ordini di grandezza molto differenti. Immaginiamo di avere un problema *P* e supponiamo che, in corrispondenza del dato $x$, si abbia $K(x) = 10^3$. Questo significa che, a un errore relativo $10^{-4}$, può corrispondere un errore relativo pari a $10^{-1}$ sulla soluzione e questo corrisponderebbe ad una perdita di precisione di 3 cifre, come vedremo in seguito.

### Polinomio di Taylor
Siano $f: [a, b] \rightarrow R$ derivabile $n + 1$ volte, con $n \geq 1$, e sia $x_0 ∈ (a, b)$. Allora, per ogni $x ∈ (a, b)$, esiste $c$ compreso tra $x$ e $x_0$ tale che

![Immagine 3](Excalidraw/2025-03-13_23.12.34.excalidraw.svg)

Il polinomio $T_n(x)$ è detto *polinomio di Taylor di grado n centrato in* $x_0$ *e valutato in* $x$, mentre $R_n(x)$ è detto *resto di Lagrange*. Il polinomio di Taylor è una tecnica utilizzata per approssimare funzioni non polinomiali e derivabili con una funzione polinomiale ricavata dalle derivate della funzione di partenza.

### [Torna all'indice](../README.md)
