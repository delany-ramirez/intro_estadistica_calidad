# Correlación y regresión lineal simple y múltiple

> **Objetivos.** Cuantificar la asociación lineal entre variables de proceso y ajustar,
> interpretar y usar para predicción modelos de regresión lineal simple y múltiple. · **RAA4**

## 1. Correlación

El **coeficiente de correlación de Pearson** mide la fuerza de la asociación **lineal**:

$$
r = \frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum (x_i-\bar{x})^2\sum (y_i-\bar{y})^2}},
\qquad -1 \le r \le 1 .
$$

- $|r|$ cercano a 1: relación lineal fuerte; cercano a 0: no hay relación **lineal**
  (puede haber una curva).
- **Correlación no implica causalidad**: en datos observacionales puede haber variables
  ocultas. La causalidad se establece con **experimentos** (ASC22).
- Siempre grafica: datos muy distintos pueden tener el mismo $r$ (cuarteto de Anscombe).

Prueba $H_0: \rho = 0$: `cor.test(x, y)`.

## 2. Regresión lineal simple

$$
y_i = \beta_0 + \beta_1 x_i + \varepsilon_i, \qquad \varepsilon_i \sim N(0,\sigma^2)\ \text{independientes}.
$$

### Mínimos cuadrados

Se eligen $\hat\beta_0, \hat\beta_1$ que minimizan $\sum (y_i-\hat{y}_i)^2$:

$$
\hat\beta_1 = \frac{S_{xy}}{S_{xx}} = \frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{\sum (x_i-\bar{x})^2},
\qquad
\hat\beta_0 = \bar{y} - \hat\beta_1\bar{x} .
$$

- $\hat\beta_1$: cambio estimado en la **media** de $y$ por cada unidad que aumenta $x$.
- $\hat\beta_0$: media de $y$ cuando $x = 0$ (a menudo sin sentido físico si $x = 0$ está
  fuera del rango observado).
- **Residual:** $e_i = y_i - \hat{y}_i$. **Error estándar del modelo:** $\hat\sigma = \sqrt{CM_E}$.

## 3. Bondad del ajuste y significancia

**ANOVA de la regresión** (misma lógica de partición del documento 03):

$$
SC_T = SC_R + SC_E, \qquad R^2 = \frac{SC_R}{SC_T} = 1-\frac{SC_E}{SC_T}.
$$

- $R^2$: proporción de la variabilidad de $y$ **explicada** por el modelo. En simple, $R^2 = r^2$.
- Prueba $t$ para cada coeficiente: $H_0: \beta_j = 0$, $t_0 = \hat\beta_j / ee(\hat\beta_j)$.
- Prueba $F$ global: $H_0: \beta_1 = \dots = \beta_k = 0$.

## 4. Regresión lineal múltiple

$$
y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \dots + \beta_k x_k + \varepsilon .
$$

- $\beta_j$ es el efecto de $x_j$ **manteniendo constantes las demás** variables.
- $R^2$ siempre aumenta al agregar variables; para comparar modelos usa el **$R^2$
  ajustado**:

$$
R^2_{\text{aj}} = 1-\frac{SC_E/(n-p)}{SC_T/(n-1)}, \qquad p = k+1 .
$$

- Cuidado con la **multicolinealidad** (predictores muy correlacionados entre sí): infla
  los errores estándar y vuelve inestables los coeficientes. Diagnóstico: `car::vif()`
  (> 5–10 es preocupante). En un **experimento diseñado** los factores son ortogonales y
  este problema desaparece: otro motivo para ASC22.

## 5. Predicción: IC para la media vs. intervalo de predicción

Para un valor nuevo $x_0$:

| Intervalo | Responde | Amplitud |
|---|---|---|
| **IC para la respuesta media** $E(y \mid x_0)$ | "¿Cuál es el promedio de **todas** las piezas producidas a $x_0$?" | Menor |
| **Intervalo de predicción (IP)** para una nueva $y_0$ | "¿Dónde caerá **la próxima** pieza producida a $x_0$?" | Mayor (incluye $\sigma^2$) |

En la simple:

$$
\hat{y}_0 \pm t_{\alpha/2,\,n-2}\,\hat\sigma\sqrt{\tfrac{1}{n}+\tfrac{(x_0-\bar{x})^2}{S_{xx}}}
\quad\text{(IC)} \qquad
\hat{y}_0 \pm t_{\alpha/2,\,n-2}\,\hat\sigma\sqrt{1+\tfrac{1}{n}+\tfrac{(x_0-\bar{x})^2}{S_{xx}}}
\quad\text{(IP)}
$$

En R: `predict(modelo, newdata, interval = "confidence")` o `interval = "prediction"`.

> ⚠️ **No extrapoles**: el modelo solo vale en el rango de $x$ observado.

## 6. En R

```r
modelo <- lm(resistencia_mpa ~ temperatura_c + tiempo_min + humedad_pct, data = df)
summary(modelo)      # coeficientes, t, R², R² ajustado, F global
confint(modelo)      # IC de los coeficientes
anova(modelo)        # tabla ANOVA secuencial
predict(modelo, newdata = data.frame(temperatura_c = 80, tiempo_min = 25, humedad_pct = 50),
        interval = "prediction")
```

---

### Para repasar

- $r = 0.05$ entre temperatura y rendimiento. ¿Significa que la temperatura no afecta el
  rendimiento?
- Interpreta $\hat\beta_1 = 0.056$ MPa/°C en un modelo múltiple.
- ¿Por qué el IP nunca es más angosto que el IC para la media?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 11 y 12.
- Navidi, W. _Estadística para ingenieros y científicos_, cap. 7 y 8.
