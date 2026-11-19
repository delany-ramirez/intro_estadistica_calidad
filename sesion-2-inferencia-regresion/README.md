# Sesión 2 — Inferencia aplicada, regresión y supuestos (6 h)

## Objetivos

Al finalizar la sesión, el estudiante será capaz de elegir y aplicar la prueba adecuada
para comparar medias y varianzas, planear el tamaño de muestra, ajustar e interpretar
modelos de regresión lineal y validarlos con análisis de residuales. **RAA3 · RAA4**

> En la versión intensiva (cohorte actual) la sesión se centra en inferencia (**RAA2 ·
> RAA3**); regresión (RAA4) queda como trabajo autónomo y no entra en la evaluación.

## Agenda (sábado, 8:00–14:00) — versión intensiva de inferencia

En la cohorte actual la Sesión 1 se dedicó a la introducción a R y a la descriptiva, por lo
que esta sesión se reorganizó en **cinco bloques de inferencia** con un único notebook
autocontenido: [`notebooks/00-inferencia-intensivo.Rmd`](notebooks/00-inferencia-intensivo.Rmd).
Regresión y diagnóstico (Teoría 04–05, Prácticas 03–04) quedan como **trabajo autónomo** 🔵.

| Hora | Min | Bloque | Material |
|------|----:|--------|----------|
| 8:00–9:00 | 60 | 1 · De la muestra a la población: TCL, normalidad, $t$, $\chi^2$, $F$ | Notebook 00 §1 · Teoría S1-03 |
| 9:00–10:00 | 60 | 2 · Intervalos de confianza | Notebook 00 §2 · Teoría S1-04 |
| 10:00–11:00 | 60 | 3 · Prueba de hipótesis para una muestra | Notebook 00 §3 · Teoría S1-05 |
| 11:00–12:00 | 60 | 4 · Comparación de dos poblaciones | Notebook 00 §4 · Teoría 01 |
| 12:00–13:00 | 60 | 5 · Pruebas de hipótesis en la práctica: ejemplos, lectura de salidas (medias, varianzas, proporciones) y potencia | Notebook 00 §5 · Teoría 02 |
| 13:00–14:00 | 60 | **Evaluación individual (50 %)** | Entregada por el docente |

Cada bloque incluye su pausa (≈ 5 min); el receso largo se toma entre los bloques 2 y 3.

## Contenidos

### ✅ Núcleo
- Distribución muestral, error estándar y TCL; verificación de normalidad.
- IC para $\mu$ y $\sigma$; pruebas para una media y una varianza; valor p, errores tipo I y II.
- Pruebas $t$ de una muestra, de dos muestras (combinada y Welch) y pareada.
- Razón de varianzas $F$ (y Levene como alternativa robusta).
- Potencia, tamaño de muestra y curvas de potencia.
- Lectura detallada de salidas de R; pruebas para una y dos proporciones.

### 🔵 Opcional (trabajo autónomo en esta cohorte)
- Puente al ANOVA (Teoría 03, Práctica 02 §3): se estudia en ASC22.
- Correlación; regresión simple y múltiple: mínimos cuadrados, $R^2$, coeficientes,
  ecuación de predicción, IC e IP (Teoría 04, Práctica 03).
- Análisis de residuales, atípicos influyentes y transformaciones (Teoría 05, Práctica 04).
- Box-Cox y modelo log-log (Práctica 04, §2.2–2.3).
- Prueba de Durbin-Watson y VIF.

## Materiales

### Teoría

| # | Documento | Tema |
|---|-----------|------|
| 01 | [`teoria/01-pruebas-t-varianzas.md`](teoria/01-pruebas-t-varianzas.md) | Elección de la prueba; t de una y dos muestras, pareada; razón F |
| 02 | [`teoria/02-potencia-tamano-muestra.md`](teoria/02-potencia-tamano-muestra.md) | Potencia, tamaño de muestra, curva de potencia |
| 03 | [`teoria/03-puente-anova.md`](teoria/03-puente-anova.md) | Partición de la variabilidad y estadístico F |
| 04 | [`teoria/04-correlacion-regresion.md`](teoria/04-correlacion-regresion.md) | Correlación, regresión simple y múltiple, IC e IP |
| 05 | [`teoria/05-supuestos-diagnostico.md`](teoria/05-supuestos-diagnostico.md) | Residuales, influencia, transformaciones |

### Prácticas (R Markdown)

| # | Práctica | Contenido |
|---|----------|-----------|
| 00 | [`notebooks/00-inferencia-intensivo.Rmd`](notebooks/00-inferencia-intensivo.Rmd) | **Versión intensiva:** teoría + demostraciones de los 5 bloques de inferencia, con ejercicios "Tu turno" |
| 01 | [`notebooks/01-pruebas-t-varianzas.Rmd`](notebooks/01-pruebas-t-varianzas.Rmd) | Dos líneas de ensamble (Welch, F, Levene); durómetros (pareada vs. independiente) |
| 02 | [`notebooks/02-potencia-anova.Rmd`](notebooks/02-potencia-anova.Rmd) | `power.t.test`, `pwr`, curvas de potencia; partición SC y F a mano |
| 03 | [`notebooks/03-regresion.Rmd`](notebooks/03-regresion.Rmd) | Curado de adhesivo: correlación, regresión simple y múltiple, IC e IP |
| 04 | [`notebooks/04-diagnostico-residuales.Rmd`](notebooks/04-diagnostico-residuales.Rmd) | Gráficos de diagnóstico, influencia, Box-Cox, log-log |

### Datos

| Archivo | Descripción | Variables |
|---------|-------------|-----------|
| [`datos/tiempo-ciclo-lineas.csv`](datos/tiempo-ciclo-lineas.csv) | Tiempo de ciclo en dos líneas de ensamble (15 y 18 ciclos) | `linea` (A, B), `tiempo_ciclo_s` |
| [`datos/dureza-durometros.csv`](datos/dureza-durometros.csv) | Dureza de 12 probetas medidas con dos durómetros (pareado) | `probeta`, `durometro_1`, `durometro_2` (HRC) |
| [`datos/rugosidad-proveedores.csv`](datos/rugosidad-proveedores.csv) | Rugosidad de láminas de tres proveedores, 8 por proveedor | `proveedor` (P1–P3), `rugosidad_um` (Ra, µm) |
| [`datos/curado-adhesivo.csv`](datos/curado-adhesivo.csv) | Resistencia al corte de 30 probetas de adhesivo | `temperatura_c`, `tiempo_min`, `humedad_pct`, `resistencia_mpa` |
| [`datos/consumo-energia.csv`](datos/consumo-energia.csv) | Consumo de energía vs. producción en 40 días (heterocedástico, un registro erróneo) | `dia`, `produccion_t`, `consumo_kwh` |
| [`datos/resistencia-cajas.csv`](datos/resistencia-cajas.csv) | Resistencia a la compresión de cajas de dos proveedores (Ej. 01) | `proveedor` (Norte, Sur), `resistencia_kgf` |
| [`datos/temperatura-hornos.csv`](datos/temperatura-hornos.csv) | Temperatura de 10 hornos con sensor nuevo y patrón (Ej. 01) | `horno`, `patron_c`, `sensor_c` |
| [`datos/tostion-cafe.csv`](datos/tostion-cafe.csv) | Pérdida de peso en 24 baches de tostión de café (Ej. 03–04) | `tiempo_min`, `temperatura_c`, `perdida_peso_pct` |
| [`datos/tiempo-entrega.csv`](datos/tiempo-entrega.csv) | Tiempo de 25 entregas de bebidas (Ej. 04) | `cajas`, `distancia_m`, `tiempo_min` |
| [`datos/soldadura-procedimientos.csv`](datos/soldadura-procedimientos.csv) | Resistencia a la tracción de 16 uniones por procedimiento; mínimo 480 MPa (Taller, ej. 1) | `procedimiento` (actual, nuevo), `resistencia_mpa` |
| [`datos/ph-medidores.csv`](datos/ph-medidores.csv) | pH de 15 lotes de jugo con medidor de planta y de laboratorio; sesgo admisible ±0.10 (Taller, ej. 2) | `lote`, `ph_laboratorio`, `ph_planta` |

### Ejercicios

| # | Enunciado | Solución |
|---|-----------|----------|
| 01 | [`ejercicios/ej01-pruebas-t.md`](ejercicios/ej01-pruebas-t.md) | [`ej01-pruebas-t-sol.Rmd`](ejercicios/ej01-pruebas-t-sol.Rmd) |
| 02 | [`ejercicios/ej02-potencia.md`](ejercicios/ej02-potencia.md) | [`ej02-potencia-sol.Rmd`](ejercicios/ej02-potencia-sol.Rmd) |
| 03 | [`ejercicios/ej03-regresion.md`](ejercicios/ej03-regresion.md) | [`ej03-regresion-sol.Rmd`](ejercicios/ej03-regresion-sol.Rmd) |
| 04 | [`ejercicios/ej04-diagnostico.md`](ejercicios/ej04-diagnostico.md) | [`ej04-diagnostico-sol.Rmd`](ejercicios/ej04-diagnostico-sol.Rmd) |

### Taller de aplicación (versión intensiva)

| Plantilla de entrega | Contenido |
|---|---|
| [`ejercicios/taller-inferencia_plantilla.Rmd`](ejercicios/taller-inferencia_plantilla.Rmd) | Ej. 1 · Soldadura: código resuelto, el estudiante entrega el análisis. Ej. 2 · Medidores de pH: el estudiante escribe el código (con pistas) y el análisis. |

La solución está en `docente/soluciones/taller-inferencia-sol.Rmd`.

### Evaluación individual (50 %)

El enunciado, los datos (dos versiones), la plantilla, la solución y la rúbrica están en
`docente/evaluacion/` y se entregan a los estudiantes al iniciar el bloque.

> Las prácticas compilan (Knit) de principio a fin con los paquetes de [`install.R`](../install.R).
