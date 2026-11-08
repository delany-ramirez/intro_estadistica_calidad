# Evaluación individual — Inyección de piezas plásticas

> **Duración:** 60 min · **Modalidad:** individual, con computador y material del curso;
> sin comunicación con otras personas ni uso de asistentes de IA · **Peso:** 50 %
> **RAA1–RAA4**
> **Datos:** `inyeccion-version-A.csv` o `inyeccion-version-B.csv` (el docente asigna la
> versión) · **Entrega:** `evaluacion-individual_plantilla.Rmd` diligenciada + `.html`
> compilado.

## Contexto

Una empresa inyecta tapas plásticas con **peso objetivo de 28.0 g**. El área de calidad
sospecha que el peso depende de la **máquina** (M1, M2), de la **temperatura del molde**
(°C) y de la **presión de inyección** (bar). Se registraron 40 piezas (20 por máquina) en
operación normal.

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

## Pregunta 3 — Modelo de regresión *(20 min, 35 puntos)* · RAA4

**a)** Ajusta un modelo de regresión lineal múltiple del peso en función de la
temperatura, la presión y la máquina. Escribe la ecuación ajustada.

**b)** Interpreta el coeficiente de la **presión** y el de la **máquina** (con sus IC).
Reporta e interpreta $R^2$ ajustado.

**c)** Compara el resultado sobre la máquina con el de la Pregunta 2. Si difieren,
explica por qué.

**d)** Para una pieza de **M1** a **55 °C** y **100 bar**, calcula el peso predicho y el
intervalo adecuado para **una pieza individual**. ¿Se puede asegurar que cumple
28.0 ± 0.6 g?

## Pregunta 4 — Validación del modelo *(10 min, 15 puntos)* · RAA4

**a)** Elabora los gráficos de diagnóstico de residuales y aplica al menos una prueba
formal. ¿Se cumplen los supuestos? ¿Hay puntos influyentes?

**b)** En 2–3 líneas, ¿qué recomendarías al jefe de producción a partir del modelo?

## Reproducibilidad *(5 puntos)*

El documento compila sin errores y toda cifra mencionada sale de una salida de R.
