# Sesión 2 — Inferencia aplicada, regresión y supuestos (6 h)

## Objetivos

Al finalizar la sesión, el estudiante será capaz de elegir y aplicar la prueba adecuada
para comparar medias y varianzas, planear el tamaño de muestra, ajustar e interpretar
modelos de regresión lineal y validarlos con análisis de residuales. **RAA3 · RAA4**

## Agenda (sábado, 8:00–14:00)

| Hora | Min | Bloque | Material |
|------|----:|--------|----------|
| 8:00–8:20 | 20 | Retroalimentación del Pre-trabajo 2 | [`pre-trabajos/`](../pre-trabajos/) |
| 8:20–9:15 | 55 | Pruebas t (una, dos muestras, pareada) y razón de varianzas F | Teoría 01 · Práctica 01 · Ej. 01 |
| 9:15–9:45 | 30 | Potencia y tamaño de muestra | Teoría 02 · Práctica 02 (§1–2) · Ej. 02 |
| 9:45–10:10 | 25 | Puente conceptual a ANOVA | Teoría 03 · Práctica 02 (§3) |
| 10:10–10:30 | 20 | Receso | |
| 10:30–11:50 | 80 | Correlación y regresión simple y múltiple | Teoría 04 · Práctica 03 · Ej. 03 |
| 11:50–12:40 | 50 | Supuestos y diagnóstico: residuales, influyentes, transformaciones | Teoría 05 · Práctica 04 · Ej. 04 |
| 12:40–12:50 | 10 | Pausa e instrucciones de la evaluación | |
| 12:50–13:50 | 60 | **Evaluación individual (50 %)** | Entregada por el docente |
| 13:50–14:00 | 10 | Cierre: qué se retoma en ASC22 | [`slides`](../slides_qmd/sesion-2/slides.qmd) |

## Contenidos

### ✅ Núcleo
- Pruebas $t$ de una muestra, de dos muestras (combinada y Welch) y pareada.
- Razón de varianzas $F$ (y Levene como alternativa robusta).
- Potencia, tamaño de muestra y curvas de potencia.
- Partición de la variabilidad y estadístico $F$ (puente al ANOVA, sin diseños).
- Correlación; regresión simple y múltiple: mínimos cuadrados, $R^2$, coeficientes,
  ecuación de predicción, IC e IP.
- Análisis de residuales, atípicos influyentes y transformaciones.

### 🔵 Opcional
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

### Ejercicios

| # | Enunciado | Solución |
|---|-----------|----------|
| 01 | [`ejercicios/ej01-pruebas-t.md`](ejercicios/ej01-pruebas-t.md) | [`ej01-pruebas-t-sol.Rmd`](ejercicios/ej01-pruebas-t-sol.Rmd) |
| 02 | [`ejercicios/ej02-potencia.md`](ejercicios/ej02-potencia.md) | [`ej02-potencia-sol.Rmd`](ejercicios/ej02-potencia-sol.Rmd) |
| 03 | [`ejercicios/ej03-regresion.md`](ejercicios/ej03-regresion.md) | [`ej03-regresion-sol.Rmd`](ejercicios/ej03-regresion-sol.Rmd) |
| 04 | [`ejercicios/ej04-diagnostico.md`](ejercicios/ej04-diagnostico.md) | [`ej04-diagnostico-sol.Rmd`](ejercicios/ej04-diagnostico-sol.Rmd) |

### Evaluación individual (50 %)

El enunciado, los datos (dos versiones), la plantilla, la solución y la rúbrica están en
`docente/evaluacion/` y se entregan a los estudiantes al iniciar el bloque.

> Las prácticas compilan (Knit) de principio a fin con los paquetes de [`install.R`](../install.R).
