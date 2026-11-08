# Supuestos y diagnóstico: análisis de residuales

> **Objetivos.** Validar un modelo lineal mediante el análisis de residuales, detectar
> observaciones atípicas e influyentes y aplicar transformaciones cuando los supuestos no
> se cumplen. Es la base de la **validación del modelo** en ASC22. · **RAA4**

## 1. Los supuestos viven en el error

El modelo $y = \beta_0 + \sum \beta_j x_j + \varepsilon$ supone que los errores
$\varepsilon_i$ son:

| Supuesto | Qué significa | Si falla |
|---|---|---|
| **Linealidad** | La media de $y$ es lineal en los $x$ | Predicciones sesgadas |
| **Independencia** | Los errores no se influyen entre sí | Errores estándar y valores p incorrectos |
| **Varianza constante** (homocedasticidad) | $\text{Var}(\varepsilon_i) = \sigma^2$ en todo el rango | IC e IP incorrectos; valores p poco confiables |
| **Normalidad** | $\varepsilon_i \sim N(0,\sigma^2)$ | IP incorrectos; pruebas poco fiables con $n$ pequeño |

Como no observamos los $\varepsilon_i$, usamos los **residuales** $e_i = y_i - \hat{y}_i$.

## 2. Los cuatro gráficos de diagnóstico

`plot(modelo)` en R produce:

| Gráfico | Se ve bien si… | Patrón problemático |
|---|---|---|
| **Residuales vs. ajustados** | Nube sin forma alrededor de 0 | Curva → falta de linealidad; **embudo** → varianza no constante |
| **Q-Q normal de residuales** | Puntos sobre la recta | Colas, curvatura, puntos aislados |
| **Escala-ubicación** ($\sqrt{|e_{\text{std}}|}$ vs. ajustados) | Línea horizontal | Tendencia creciente → heterocedasticidad |
| **Residuales vs. apalancamiento** | Ningún punto más allá de las curvas de Cook | Puntos influyentes |

Además: **residuales vs. orden** de recolección (independencia en el tiempo) y **vs. cada
predictor** (linealidad en cada $x_j$).

Pruebas formales complementarias: `shapiro.test(residuals(m))`, `car::ncvTest(m)`
(varianza constante), `car::durbinWatsonTest(m)` (autocorrelación).

## 3. Atípicos, apalancamiento e influencia

| Concepto | Medida | Regla práctica |
|---|---|---|
| **Atípico** en $y$ | Residual estudentizado $r_i$ | $|r_i| > 3$ (o > 2 para revisar) |
| **Apalancamiento** (valor extremo en $x$) | $h_{ii}$ (diagonal de la matriz sombrero) | $h_{ii} > 2p/n$ |
| **Influencia** (cambia el ajuste) | **Distancia de Cook** $D_i$ | $D_i > 1$ (o > $4/n$ para revisar) |

Un punto es **influyente** cuando combina apalancamiento alto y residual grande: al
quitarlo, los coeficientes cambian de forma apreciable.

> Como con los atípicos descriptivos: **se investigan, no se borran**. Si es un error de
> registro, se corrige; si es real, se reporta el modelo con y sin el punto.

En R: `rstudent(m)`, `hatvalues(m)`, `cooks.distance(m)`, `car::influencePlot(m)`.

## 4. Transformaciones

Cuando la variabilidad crece con el nivel de la respuesta (embudo), o la relación es
multiplicativa, una transformación de $y$ (y a veces de $x$) puede estabilizar la
varianza y linealizar:

| Situación | Transformación |
|---|---|
| $\sigma \propto \mu$ (error multiplicativo) | $\log y$ |
| Conteos (Poisson) | $\sqrt{y}$ |
| Proporciones | $\arcsin\sqrt{p}$ o logit |
| No es obvio | **Box-Cox**: $y^{(\lambda)}$, elegir $\lambda$ con `MASS::boxcox(m)` |

Con $\log y = \beta_0 + \beta_1 \log x$, $\beta_1$ es una **elasticidad**: un aumento
del 1 % en $x$ se asocia con un cambio de $\beta_1$ % en $y$.

> Al transformar, las predicciones deben **devolverse** a la escala original para
> comunicarlas (p. ej., `exp()` de los límites del IP).

## 5. Flujo de validación del modelo

1. Ajustar el modelo y revisar los cuatro gráficos **antes** de leer los valores p.
2. Si hay patrón: ¿falta un término (curvatura, otra variable)? ¿Transformación?
3. Revisar puntos influyentes; investigar su origen.
4. Reajustar y volver a diagnosticar.
5. Solo entonces interpretar coeficientes, $R^2$ y predicciones.

> Este mismo flujo (ajustar → residuales → corregir → interpretar) es el que se aplica a
> cada ANOVA en ASC22.

---

### Para repasar

- Describe el gráfico de residuales vs. ajustados de un modelo con varianza creciente.
- Un punto tiene $h_{ii}$ alto pero residual pequeño. ¿Es influyente?
- ¿Por qué se revisan los residuales antes de interpretar los valores p?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 11–12.
- Montgomery, D. C. _Design and Analysis of Experiments_, cap. 3 (§3.4) y cap. 10.
