# Ejercicio 02 — Normalidad, probabilidad de no conformidad y TCL

> **Temas:** gráfico de probabilidad normal, pruebas de normalidad, cálculo de
> probabilidades con la normal, error estándar y TCL. · **RAA2**
> **Datos:** [`../datos/peso-bolsas-azucar.csv`](../datos/peso-bolsas-azucar.csv) y
> [`../datos/tiempo-atencion.csv`](../datos/tiempo-atencion.csv)

## Parte A — Bolsas de azúcar

Un ingenio empaca bolsas rotuladas como **1000 g**. La regulación de producto preempacado
fija un **límite inferior de 990 g** para cualquier bolsa individual. Se pesaron 50 bolsas
de un turno.

**a)** Elabora el histograma y el gráfico Q-Q. Aplica Shapiro-Wilk y Anderson-Darling.
¿Es razonable modelar el peso con una normal?

**b)** Con $\mu \approx \bar{y}$ y $\sigma \approx s$, estima la **proporción de bolsas
por debajo de 990 g**. Exprésala en partes por millón (ppm).

**c)** La gerencia quiere reducir el sobrellenado (regalar azúcar) bajando la media a
998 g, sin cambiar $\sigma$. ¿Cuántas ppm quedarían por debajo de 990 g? ¿Qué $\sigma$
haría falta para mantener la proporción de la pregunta b)?

**d)** Calcula el error estándar de la media con $n = 50$. ¿Cuántas bolsas habría que
pesar para reducirlo a la mitad?

## Parte B — Tiempo de atención

**e)** Con los tiempos de atención (todas las filas), explica por qué **no** deberías
estimar $P(T > 25\ \text{min})$ con un modelo normal, aunque $n = 200$.

**f)** El centro reporta cada día el **tiempo medio** de una muestra de 36 clientes.
Usando el TCL, ¿entre qué valores debería estar ese promedio diario el 95 % de los días,
si el proceso no cambia? (Usa la media y la desviación de los 200 datos como $\mu$ y $\sigma$.)

**g)** ¿Por qué la respuesta de f) sí es razonable y la de e) no?

---

> Solución en [`ej02-normalidad-tcl-sol.Rmd`](ej02-normalidad-tcl-sol.Rmd).
