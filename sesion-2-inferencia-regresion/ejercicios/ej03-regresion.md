# Ejercicio 03 — Regresión lineal simple y múltiple

> **Temas:** correlación, mínimos cuadrados, $R^2$, coeficientes, ecuación de predicción,
> IC e IP. · **RAA4**
> **Datos:** [`../datos/tostion-cafe.csv`](../datos/tostion-cafe.csv)

## Contexto

Una tostadora de café de especialidad controla la **pérdida de peso (%)** del grano
durante la tostión, pues define el grado de tueste y el rendimiento. Registró 24 baches
con su **tiempo de tostión** (min) y la **temperatura final** del grano (°C).

| Variable | Descripción |
|---|---|
| `tiempo_min` | Tiempo de tostión (min) |
| `temperatura_c` | Temperatura final del grano (°C) |
| `perdida_peso_pct` | Pérdida de peso (%) |

## Preguntas

**a)** Elabora los diagramas de dispersión de la pérdida de peso contra cada variable y
calcula la matriz de correlación. ¿Qué variable parece más relacionada?

**b)** Ajusta la regresión simple de la pérdida de peso contra el **tiempo**. Escribe la
ecuación, interpreta la pendiente y su IC del 95 %, y reporta $R^2$.

**c)** Ajusta la regresión múltiple con **tiempo y temperatura**. Escribe la ecuación.
¿Son significativos ambos coeficientes? ¿Cuánto mejora el $R^2$ ajustado y el error
estándar $\hat\sigma$?

**d)** Interpreta el coeficiente de la temperatura en el modelo múltiple.

**e)** El perfil de tueste que el maestro tostador busca para un cliente exige una
pérdida de peso entre **19 % y 21 %**. Para un bache de **15 min** a **215 °C**, calcula el valor ajustado, el IC del 95 %
para la pérdida media y el IP del 95 % para un bache individual. ¿Puede garantizar que
**ese** bache quede en el rango deseado?

**f)** ¿Sería válido usar el modelo para un bache de 22 min? ¿Por qué?

---

> Solución en [`ej03-regresion-sol.Rmd`](ej03-regresion-sol.Rmd). Los supuestos de este
> modelo se verifican en el ejercicio 04.
