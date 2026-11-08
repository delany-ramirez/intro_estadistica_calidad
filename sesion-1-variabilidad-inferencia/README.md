# Sesión 1 — Variabilidad, normalidad e inferencia (6 h)

## Objetivos

Al finalizar la sesión, el estudiante será capaz de describir y comparar datos de un
proceso de calidad, detectar causas asignables por estratificación, verificar el supuesto
de normalidad y plantear e interpretar intervalos de confianza y pruebas de hipótesis
para una muestra. **RAA1 · RAA2 · RAA3**

## Agenda (sábado, 8:00–14:00)

| Hora | Min | Bloque | Material |
|------|----:|--------|----------|
| 8:00–8:10 | 10 | Presentación del curso y ruta hacia ASC22 | [`slides`](../slides_qmd/sesion-1/slides.qmd) |
| 8:10–8:30 | 20 | Lectura del diagnóstico de entrada y errores del Pre-trabajo 1 | [`pre-trabajos/`](../pre-trabajos/) |
| 8:30–9:25 | 55 | Datos y variabilidad: caso bimodal | Teoría 01 · Práctica 01 (§1–3) |
| 9:25–10:20 | 55 | Repaso descriptivo comparativo en R | Teoría 02 · Práctica 01 (§4–8) · Ej. 01 |
| 10:20–10:40 | 20 | Receso | |
| 10:40–11:35 | 55 | Normalidad y Teorema Central del Límite | Teoría 03 · Práctica 02 · Ej. 02 |
| 11:35–12:20 | 45 | Del IC a la prueba: distribuciones t, χ² y F | Teoría 04 · Práctica 03 (§1–2) |
| 12:20–12:30 | 10 | Pausa | |
| 12:30–13:20 | 50 | H₀, H₁, errores tipo I y II, valor p | Teoría 05 · Práctica 03 (§3–6) · Ej. 03 |
| 13:20–14:00 | 40 | **Taller integrador 1 (20 %)** | [`ejercicios/taller-integrador-1.md`](ejercicios/taller-integrador-1.md) |

## Contenidos

### ✅ Núcleo
- Unidad experimental y de medición; réplica vs. repetición; aleatorización; estratificación;
  causas comunes y asignables. Vocabulario de ASC22: factor, respuesta, error experimental.
- Gráficos comparativos (cajas, violín, histograma, acumulada); posición y dispersión;
  puntaje Z y regla empírica; atípicos.
- Gráfico de probabilidad normal; Shapiro-Wilk y Anderson-Darling; TCL (qué asegura y qué no).
- Distribuciones $t$, $\chi^2$ y $F$; IC para $\mu$ y $\sigma$; dualidad IC–prueba.
- $H_0$ y $H_1$; errores tipo I y II; nivel de significación; valor p.

### 🔵 Opcional
- Simulación de cobertura de IC y de potencia (Práctica 03, §5–6).
- Ejercicio 02, parte B.

## Materiales

### Teoría

| # | Documento | Tema |
|---|-----------|------|
| 01 | [`teoria/01-datos-variabilidad.md`](teoria/01-datos-variabilidad.md) | Fuentes de variabilidad, UE, réplica, aleatorización, estratificación, caso bimodal |
| 02 | [`teoria/02-descriptiva-comparativa.md`](teoria/02-descriptiva-comparativa.md) | Medidas y gráficos para comparar grupos; Z; regla empírica; atípicos |
| 03 | [`teoria/03-normalidad-tcl.md`](teoria/03-normalidad-tcl.md) | Modelos de probabilidad, Q-Q, pruebas de normalidad, TCL |
| 04 | [`teoria/04-intervalos-confianza.md`](teoria/04-intervalos-confianza.md) | Distribuciones t, χ², F; IC para media, varianza y razón de varianzas |
| 05 | [`teoria/05-pruebas-hipotesis.md`](teoria/05-pruebas-hipotesis.md) | Hipótesis, errores tipo I y II, α, valor p |

### Prácticas (R Markdown)

| # | Práctica | Contenido |
|---|----------|-----------|
| 01 | [`notebooks/01-variabilidad-descriptiva.Rmd`](notebooks/01-variabilidad-descriptiva.Rmd) | Caso bimodal, estratificación, gráficos comparativos, Z, atípicos |
| 02 | [`notebooks/02-normalidad-tcl.Rmd`](notebooks/02-normalidad-tcl.Rmd) | Q-Q, Shapiro-Wilk, Anderson-Darling, simulación del TCL |
| 03 | [`notebooks/03-intervalos-pruebas.Rmd`](notebooks/03-intervalos-pruebas.Rmd) | t, χ², F; IC; pruebas para media y varianza; simulación de α y potencia |

### Datos

| Archivo | Descripción | Variables |
|---------|-------------|-----------|
| [`datos/llenado-envases.csv`](datos/llenado-envases.csv) | Volumen de 120 envases de 500 mL llenados por dos boquillas (caso bimodal) | `orden`, `turno`, `boquilla` (B1, B2), `volumen_ml` |
| [`datos/tiempo-atencion.csv`](datos/tiempo-atencion.csv) | Tiempo de atención de 200 clientes de un centro de servicio (asimétrico) | `caso`, `canal` (presencial, telefonico), `tiempo_min` |
| [`datos/espesor-recubrimiento.csv`](datos/espesor-recubrimiento.csv) | Espesor de recubrimiento de 25 piezas; objetivo 50 µm, σ ≤ 2.5 µm | `pieza`, `espesor_um` |
| [`datos/humedad-cafe.csv`](datos/humedad-cafe.csv) | Humedad de 20 lotes de café pergamino seco; meta 11 %, máximo 12 % | `lote`, `humedad_pct` |
| [`datos/resistencia-hilo.csv`](datos/resistencia-hilo.csv) | Resistencia a la tracción de hilo de tres proveedores (Ej. 01); mínimo 380 cN | `proveedor`, `resistencia_cn` |
| [`datos/peso-bolsas-azucar.csv`](datos/peso-bolsas-azucar.csv) | Peso neto de 50 bolsas de 1000 g (Ej. 02); LIE 990 g | `bolsa`, `peso_g` |
| [`datos/grasa-leche.csv`](datos/grasa-leche.csv) | Contenido de grasa de 16 muestras de leche rotulada al 3.0 % (Ej. 03) | `muestra`, `grasa_pct` |
| [`datos/peso-tabletas.csv`](datos/peso-tabletas.csv) | Peso de 80 tabletas de 250 mg, dos tableteadoras × 4 lotes (Taller 1) | `tableteadora`, `lote`, `peso_mg` |

### Ejercicios

| # | Enunciado | Solución |
|---|-----------|----------|
| 01 | [`ejercicios/ej01-descriptiva.md`](ejercicios/ej01-descriptiva.md) | [`ej01-descriptiva-sol.Rmd`](ejercicios/ej01-descriptiva-sol.Rmd) |
| 02 | [`ejercicios/ej02-normalidad-tcl.md`](ejercicios/ej02-normalidad-tcl.md) | [`ej02-normalidad-tcl-sol.Rmd`](ejercicios/ej02-normalidad-tcl-sol.Rmd) |
| 03 | [`ejercicios/ej03-ic-pruebas.md`](ejercicios/ej03-ic-pruebas.md) | [`ej03-ic-pruebas-sol.Rmd`](ejercicios/ej03-ic-pruebas-sol.Rmd) |

### Taller integrador 1 (20 %)

| Enunciado | Plantilla de entrega | Duración |
|-----------|----------------------|----------|
| [`ejercicios/taller-integrador-1.md`](ejercicios/taller-integrador-1.md) | [`taller-integrador-1_plantilla.Rmd`](ejercicios/taller-integrador-1_plantilla.Rmd) | 40 min |

La solución y la rúbrica detallada están en `docente/`.

> Las prácticas compilan (Knit) de principio a fin con los paquetes de [`install.R`](../install.R).
