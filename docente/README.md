# Carpeta del docente

> ⚠️ **No compartir con estudiantes.** Contiene soluciones, la evaluación individual y la
> clave del diagnóstico. Exclúyela al publicar el repositorio o al subir material a la
> plataforma.

## Contenido

| Archivo | Uso |
|---------|-----|
| [`diagnostico-clave.md`](diagnostico-clave.md) | Clave del diagnóstico de entrada y qué hacer según los resultados |
| [`soluciones/pre-trabajo-1-sol.Rmd`](soluciones/pre-trabajo-1-sol.Rmd) | Solución del Pre-trabajo 1 |
| [`soluciones/pre-trabajo-2-sol.Rmd`](soluciones/pre-trabajo-2-sol.Rmd) | Solución del Pre-trabajo 2 |
| [`soluciones/taller-integrador-1-sol.Rmd`](soluciones/taller-integrador-1-sol.Rmd) | Solución y rúbrica detallada del Taller integrador 1 (20 %) |
| [`evaluacion/evaluacion-individual.md`](evaluacion/evaluacion-individual.md) | Enunciado de la evaluación individual (50 %) |
| [`evaluacion/evaluacion-individual_plantilla.Rmd`](evaluacion/evaluacion-individual_plantilla.Rmd) | Plantilla de entrega para los estudiantes |
| [`evaluacion/evaluacion-individual-sol.Rmd`](evaluacion/evaluacion-individual-sol.Rmd) | Solución parametrizada (versión A o B) |
| [`evaluacion/rubrica-evaluacion.md`](evaluacion/rubrica-evaluacion.md) | Rúbrica de la evaluación individual |
| `evaluacion/datos/inyeccion-version-{A,B}.csv` | Datos de las dos versiones |
| [`scripts/generar-datos.R`](scripts/generar-datos.R) | Regenera **todos** los datasets del curso (semillas fijas) |

## Antes de cada sesión

**Sesión 1**
- [ ] Revisar resultados del diagnóstico y del Pre-trabajo 1; elegir 2–3 ítems para el
  bloque de 8:10.
- [ ] Verificar que R y los paquetes funcionan en el aula (`source("install.R")`).
- [ ] Subir a la plataforma el enunciado y la plantilla del Taller integrador 1 (o
  entregarlos en USB al iniciar el bloque de 13:20).

**Sesión 2**
- [ ] Revisar el Pre-trabajo 2 y preparar la retroalimentación de 8:00.
- [ ] Preparar la carpeta de la evaluación para estudiantes: `evaluacion-individual.md`,
  `evaluacion-individual_plantilla.Rmd` y `datos/` (**sin** la solución ni la rúbrica).
- [ ] Asignar versiones A/B alternadas por puesto.

## Énfasis por bloque (errores frecuentes)

| Bloque | Error frecuente | Cómo abordarlo |
|---|---|---|
| Datos y variabilidad | Contar repeticiones como réplicas | Preguntar "¿cuántas veces se aplicó la condición de forma independiente?" |
| Descriptiva | Borrar atípicos sin investigar | Ejercicio 01: el atípico de Alfa incumple la especificación |
| Normalidad | Creer que el TCL normaliza los datos | Simulación de la práctica 02 §3 y "lo que el TCL no hace" |
| IC y pruebas | "p = probabilidad de que H₀ sea cierta" | Tabla de interpretaciones (teoría 05 §4) en parejas |
| Pruebas t | Analizar pareados como independientes | Durómetros: misma data, conclusión opuesta |
| Potencia | "No significativo = no hay efecto" | Ejercicio 03 de S1 (grasa) y ejercicio 02 de S2 |
| Regresión | Confundir IC con IP | Gráfico de bandas de la práctica 03 |
| Diagnóstico | Leer valores p antes que residuales | Consumo de energía: el embudo invalida los IC |

## Regenerar datos

```bash
Rscript docente/scripts/generar-datos.R
```

Si cambias un parámetro del generador, vuelve a compilar las soluciones: las cifras de los
`.Rmd` se calculan al compilar, pero algunos textos de la teoría citan valores del
ejemplo de espesor (teoría 04 §3).
