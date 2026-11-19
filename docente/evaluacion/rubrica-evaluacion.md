# Rúbrica — Evaluación individual (50 %)

| Criterio | Puntos | Excelente | Aceptable | Insuficiente |
|---|---:|---|---|---|
| **P1 Descripción** (RAA1) | 15 | Resumen completo y gráfico comparativo con datos individuales; lectura de centro y dispersión (14–15) | Resumen o gráfico incompleto (9–13) | Sin comparación por máquina (0–8) |
| **P2a Supuestos y elección** (RAA2–3) | 8 | Normalidad por grupo y $F$/Levene; justifica independiente vs. pareada y Welch vs. combinada (8) | Prueba correcta sin justificar (5–7) | Prueba inadecuada (0–4) |
| **P2b Prueba de medias** (RAA3) | 14 | $H_0$/$H_1$, estadístico, gl, p, IC y decisión correctos; significancia estadística vs. práctica (13–14) | Falta un elemento (8–12) | Interpretación incorrecta del valor p o del IC (0–7) |
| **P2c Varianzas** (RAA3) | 8 | Prueba $F$ correcta y conclusión de proceso (8) | Cálculo correcto, conclusión débil (5–7) | Ausente o incorrecta (0–4) |
| **P3a IC por máquina** (RAA3) | 10 | IC para $\mu$ ($t$) y para $\sigma$ ($\chi^2$) de cada máquina, bien calculados e interpretados (9–10) | Solo uno de los dos IC o una sola máquina (5–8) | Fórmula o distribución incorrecta (0–4) |
| **P3b Prueba para la media** (RAA3) | 10 | $H_0$/$H_1$ bilaterales, $t_0$, gl, p y decisión por máquina; coherencia con el IC; no confunde "no rechazar" con "demostrar" (9–10) | Falta un elemento o la lectura del IC (5–8) | Interpretación incorrecta del valor p (0–4) |
| **P3c Prueba para $\sigma$ y fracción fuera** (RAA2–3) | 10 | $H_1: \sigma > 0.2$ (cola derecha), $\chi^2_0$ y p correctos; fracción fuera de tolerancia con el modelo normal (9–10) | Prueba bilateral o sin fracción estimada (5–8) | Prueba inadecuada (0–4) |
| **P3d Centrado vs. variabilidad** (RAA3) | 5 | Identifica la variabilidad como problema principal y lo justifica con 3b–3c (5) | Conclusión sin justificar (2–4) | Ausente o contradictoria (0–1) |
| **P4a–b Potencia y tamaño de muestra** (RAA3) | 10 | Usa $s_p$ y $\delta = 0.2$; potencia y $n$ correctos con `power.t.test` o `pwr` (9–10) | Usa una sola $s$ o un $\delta$ incorrecto, con razonamiento correcto (5–8) | Ausente o sin sentido (0–4) |
| **P4c Conclusión y recomendación** (RAA3) | 5 | Explica que el "no significativo" de 2b no prueba igualdad por la baja potencia; recomendación concreta (5) | Recomendación genérica (2–4) | Concluye que "las máquinas son iguales" (0–1) |
| **Reproducibilidad** | 5 | Compila; cifras de R (5) | Compila con advertencias (3) | No compila (0) |
| **Total** | **100** | | | |

## Notas para la calificación

- Las dos versiones (A y B) tienen parámetros y cifras distintos pero la misma
  dificultad: en ambas la $t$ de 2b **no** detecta diferencia entre máquinas, la potencia
  para 0.2 g es menor que 0.5 (A ≈ 0.49, B ≈ 0.41) y en ambas $\sigma$ supera claramente
  0.2 g (≈ 9–10 % de piezas fuera de tolerancia). En la versión A, la media de M1 queda
  cerca del límite (p ≈ 0.06 en 3b): se valora que el estudiante no concluya "está
  centrada". **Se califica el razonamiento.**
- Asignar versiones alternadas por puesto para reducir la copia.
- Soluciones: compilar `evaluacion-individual-sol.Rmd` con `params = list(version = "A")`
  y `"B"`.
