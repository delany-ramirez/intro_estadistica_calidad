# Prueba de hipótesis: H₀, H₁, errores y valor p

> **Objetivos.** Plantear hipótesis en el contexto de un proceso de calidad, distinguir
> los errores tipo I y II, e interpretar correctamente el nivel de significación y el
> valor p. · **RAA3**

## 1. Las hipótesis

- **Hipótesis nula** $H_0$: el estado "sin cambio" o "cumple" (p. ej., $\mu = 11\,\%$).
  Siempre contiene la igualdad.
- **Hipótesis alternativa** $H_1$: lo que se quiere demostrar con evidencia.

| Pregunta del proceso | $H_0$ | $H_1$ | Tipo |
|---|---|---|---|
| ¿El llenado promedio difiere de 500 mL? | $\mu = 500$ | $\mu \ne 500$ | Bilateral |
| ¿La humedad promedio supera la meta de 11 %? | $\mu \le 11$ | $\mu > 11$ | Cola derecha |
| ¿La desviación del espesor es menor que 2.5 µm? | $\sigma \ge 2.5$ | $\sigma < 2.5$ | Cola izquierda |

> La alternativa se define **antes** de ver los datos, a partir de la pregunta de
> negocio. Cambiarla después para "lograr" significancia invalida la prueba.

## 2. Procedimiento general

1. Plantear $H_0$ y $H_1$; fijar $\alpha$.
2. Verificar supuestos (independencia, normalidad según la prueba).
3. Calcular el **estadístico de prueba** (p. ej., $t_0 = \dfrac{\bar{y}-\mu_0}{s/\sqrt{n}}$).
4. Obtener el **valor p** (o comparar con el valor crítico).
5. Decidir y **concluir en el lenguaje del proceso**, con el IC.

## 3. Los dos tipos de error

| Decisión \ Realidad | $H_0$ verdadera | $H_0$ falsa |
|---|---|---|
| **No rechazar $H_0$** | Correcto $(1-\alpha)$ | **Error tipo II** $(\beta)$ |
| **Rechazar $H_0$** | **Error tipo I** $(\alpha)$ | Correcto: **potencia** $(1-\beta)$ |

En calidad:

- **Error tipo I** = **falsa alarma**: se detiene o ajusta un proceso que estaba bien
  (riesgo del productor).
- **Error tipo II** = **no detectar** un cambio real: se despacha producto no conforme
  (riesgo del consumidor).

$\alpha$ se fija directamente; $\beta$ se controla con el tamaño de muestra, la magnitud
del efecto y la variabilidad (Sesión 2, potencia).

## 4. Nivel de significación y valor p

- **Nivel de significación $\alpha$:** probabilidad máxima de error tipo I que se acepta
  (habitualmente 0.05; en seguridad o salud, 0.01).
- **Valor p:** probabilidad, **suponiendo que $H_0$ es verdadera**, de obtener un
  estadístico tan o más extremo que el observado.

$$
\text{valor } p \le \alpha \;\Rightarrow\; \text{se rechaza } H_0 .
$$

### Interpretaciones correctas e incorrectas

| ✅ Correcto | ❌ Incorrecto |
|---|---|
| "Si la humedad media fuera 11 %, sería raro (p = 0.013) observar una media muestral tan alta." | "Hay 1.3 % de probabilidad de que $H_0$ sea cierta." |
| "No hay evidencia suficiente para afirmar que el promedio difiere de 500 mL." | "Se demostró que el promedio es 500 mL." |
| "La diferencia es estadísticamente significativa; su magnitud (IC) es 0.1 a 0.4 mL, irrelevante frente a la tolerancia." | "Es significativo, luego es importante." |

> **Significancia estadística ≠ importancia práctica.** Con $n$ muy grande, diferencias
> diminutas resultan significativas. Reporta siempre la **magnitud** del efecto y su IC.

## 5. Pruebas para una muestra (resumen)

| Parámetro | Estadístico | Distribución bajo $H_0$ | En R |
|---|---|---|---|
| $\mu$ | $t_0=\dfrac{\bar{y}-\mu_0}{s/\sqrt{n}}$ | $t_{n-1}$ | `t.test(y, mu = mu0, alternative = ...)` |
| $\sigma^2$ | $\chi^2_0=\dfrac{(n-1)s^2}{\sigma_0^2}$ | $\chi^2_{n-1}$ | cálculo directo con `pchisq` |

---

### Para repasar

- En el control de un lote de medicamentos, ¿cuál error es más grave? ¿Cómo influye en la
  elección de $\alpha$?
- Un analista obtiene p = 0.07 y concluye "el proceso está centrado". ¿Qué está mal?
- Plantea $H_0$ y $H_1$ para: "el nuevo proveedor reduce la variabilidad del espesor".

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 9.
- Wasserstein, R. L. y Lazar, N. A. (2016). The ASA statement on p-values. _The American
  Statistician_, 70(2), 129–133.
