# Rúbrica — Evaluación individual (50 %)

| Criterio | Puntos | Excelente | Aceptable | Insuficiente |
|---|---:|---|---|---|
| **P1 Descripción** (RAA1) | 15 | Resumen completo y gráfico comparativo con datos individuales; lectura de centro y dispersión (14–15) | Resumen o gráfico incompleto (9–13) | Sin comparación por máquina (0–8) |
| **P2a Supuestos y elección** (RAA2–3) | 8 | Normalidad por grupo y $F$/Levene; justifica independiente vs. pareada y Welch vs. combinada (8) | Prueba correcta sin justificar (5–7) | Prueba inadecuada (0–4) |
| **P2b Prueba de medias** (RAA3) | 14 | $H_0$/$H_1$, estadístico, gl, p, IC y decisión correctos; significancia estadística vs. práctica (13–14) | Falta un elemento (8–12) | Interpretación incorrecta del valor p o del IC (0–7) |
| **P2c Varianzas** (RAA3) | 8 | Prueba $F$ correcta y conclusión de proceso (8) | Cálculo correcto, conclusión débil (5–7) | Ausente o incorrecta (0–4) |
| **P3a–b Modelo e interpretación** (RAA4) | 18 | Ecuación correcta; coeficientes interpretados "manteniendo lo demás constante", con IC; $R^2_{aj}$ interpretado (16–18) | Interpretación sin la condición *ceteris paribus* o sin IC (10–15) | Modelo mal especificado (0–9) |
| **P3c Contraste con P2** (RAA3–4) | 7 | Explica que la regresión descuenta temperatura y presión del error (7) | Nota la diferencia sin explicarla (3–6) | No compara (0–2) |
| **P3d Predicción** (RAA4) | 10 | Usa **IP** (no IC) y lo contrasta con la tolerancia (9–10) | Usa IC o no concluye (5–8) | Ausente (0–4) |
| **P4 Validación** (RAA4) | 15 | Lee los cuatro gráficos, prueba formal, influencia, recomendación concreta (14–15) | Gráficos sin interpretación completa (8–13) | Ausente (0–7) |
| **Reproducibilidad** | 5 | Compila; cifras de R (5) | Compila con advertencias (3) | No compila (0) |
| **Total** | **100** | | | |

## Notas para la calificación

- Las dos versiones (A y B) tienen parámetros y cifras distintos pero la misma
  dificultad: en ambas la $t$ simple **no** detecta diferencia entre máquinas y la
  regresión **sí** (al descontar temperatura y presión), y en ambas el IP de la Pregunta
  3d se sale de la tolerancia. En la versión B, `ncvTest` queda cerca de 0.05: se valora
  que el estudiante lo discuta con el gráfico. **Se califica el razonamiento.**
- Asignar versiones alternadas por puesto para reducir la copia.
- Soluciones: compilar `evaluacion-individual-sol.Rmd` con `params = list(version = "A")`
  y `"B"`.
