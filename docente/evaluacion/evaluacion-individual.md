# Evaluación individual — Inyección de piezas plásticas

> **Duración:** 60 min · **Modalidad:** individual, con computador y material del curso;
> sin comunicación con otras personas ni uso de asistentes de IA · **Peso:** 50 %
> **RAA1–RAA3**
> **Datos:** `inyeccion-version-A.csv` o `inyeccion-version-B.csv` (el docente asigna la
> versión) · **Entrega:** `evaluacion-individual_plantilla.Rmd` diligenciada + `.html`
> compilado.

## Contexto

Una empresa inyecta tapas plásticas con **peso objetivo de 28.0 g** y tolerancia
**28.0 ± 0.6 g**. El área de calidad quiere saber si las dos **máquinas** (M1, M2) producen
piezas equivalentes y si cada una cumple la especificación. Se registraron 40 piezas (20
por máquina) en operación normal. La temperatura del molde y la presión se registraron
como información de contexto; en esta evaluación el análisis se centra en `maquina` y
`peso_g`.

| Variable | Descripción |
|---|---|
| `pieza` | Identificador |
| `maquina` | M1, M2 |
| `temperatura_molde_c` | Temperatura del molde (°C) |
| `presion_bar` | Presión de inyección (bar) |
| `peso_g` | Peso de la pieza (g) |

## Pregunta 1 — Descripción *(10 min, 15 puntos)* · RAA1

**a)** Resume el peso por máquina ($n$, media, mediana, $s$, mínimo, máximo) y elabora
un gráfico comparativo adecuado.

**b)** ¿Hay atípicos? Describe en 2 líneas lo que muestran el resumen y el gráfico.

## Pregunta 2 — Comparación de máquinas *(15 min, 30 puntos)* · RAA2, RAA3

**a)** Verifica los supuestos necesarios y elige la prueba adecuada para comparar el
peso medio de las dos máquinas. Justifica la elección.

**b)** Plantea $H_0$ y $H_1$, realiza la prueba con $\alpha = 0.05$ y reporta estadístico,
gl, valor p e IC del 95 % para la diferencia.

**c)** Compara también las **varianzas** de las dos máquinas. Concluye en el lenguaje del
proceso.

## Pregunta 3 — ¿Cumple cada máquina la especificación? *(20 min, 35 puntos)* · RAA2, RAA3

**a)** Para **cada máquina**, calcula el IC del 95 % para el peso medio $\mu$ y para la
desviación estándar $\sigma$. *(10 puntos)*

**b)** Para **cada máquina**, prueba si el peso medio **difiere** del objetivo de 28.0 g
($\alpha = 0.05$): plantea $H_0$ y $H_1$ y reporta $t_0$, gl y valor p. Verifica que la
decisión sea coherente con el IC de a). *(10 puntos)*

**c)** Para que prácticamente todas las piezas queden dentro de 28.0 ± 0.6 g se requiere
$\sigma \le 0.2$ g. Para cada máquina, plantea y realiza la prueba adecuada para saber si
hay evidencia de que **$\sigma$ supera 0.2 g** ($\alpha = 0.05$). Luego, con un modelo
normal, estima la fracción de piezas fuera de tolerancia. *(10 puntos)*

**d)** En 2–3 líneas: ¿el problema principal del proceso es de **centrado** o de
**variabilidad**? Justifica con tus resultados. *(5 puntos)*

## Pregunta 4 — Planeación del estudio *(10 min, 15 puntos)* · RAA3

El área de calidad considera **relevante** una diferencia de **0.2 g** entre las medias de
las dos máquinas.

**a)** Con la desviación estándar combinada de las dos máquinas y $n = 20$ por máquina,
¿qué **potencia** tenía la prueba de la Pregunta 2b para detectar esa diferencia
($\alpha = 0.05$)? *(5 puntos)*

**b)** ¿Cuántas piezas **por máquina** se necesitarían para detectarla con potencia
0.90? *(5 puntos)*

**c)** A la luz de a) y b), ¿qué se puede concluir —y qué no— del resultado de la
Pregunta 2b? Termina con una recomendación concreta al jefe de producción. *(5 puntos)*

## Reproducibilidad *(5 puntos)*

El documento compila sin errores y toda cifra mencionada sale de una salida de R.
