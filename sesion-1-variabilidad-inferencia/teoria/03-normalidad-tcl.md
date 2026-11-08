# Normalidad y Teorema Central del Límite

> **Objetivos.** Modelar la variabilidad de una característica de calidad con una
> distribución de probabilidad, verificar el supuesto de normalidad y entender qué
> asegura y qué no asegura el Teorema Central del Límite (TCL). · **RAA2**

## 1. Modelos de probabilidad para características de calidad

| Distribución | Variable típica | Parámetros | En R |
|---|---|---|---|
| **Normal** $N(\mu,\sigma^2)$ | Dimensiones, pesos, volúmenes | $\mu$, $\sigma$ | `dnorm`, `pnorm`, `qnorm`, `rnorm` |
| **Exponencial / Gamma** | Tiempos de atención, de falla | tasa, forma | `pexp`, `pgamma` |
| **Lognormal** | Concentraciones, tiempos de reparación | $\mu_{\log}$, $\sigma_{\log}$ | `plnorm` |
| **Binomial** | N.º de defectuosos en $n$ unidades | $n$, $p$ | `pbinom` |
| **Poisson** | N.º de defectos por unidad | $\lambda$ | `ppois` |

Con un modelo normal ajustado, la fracción fuera de especificaciones $[LIE, LSE]$ es:

$$
P(\text{no conforme}) = \Phi\!\left(\frac{LIE-\mu}{\sigma}\right) +
1 - \Phi\!\left(\frac{LSE-\mu}{\sigma}\right).
$$

## 2. ¿Son normales mis datos?

### 2.1 Gráfico de probabilidad normal (Q-Q)

Se grafican los cuantiles de la muestra frente a los cuantiles teóricos de la normal. Si
los datos son normales, los puntos caen **cerca de una recta**.

| Patrón en el Q-Q | Diagnóstico |
|---|---|
| Puntos sobre la recta | Compatible con normalidad |
| Curva en forma de **U** o **J** | Asimetría a la derecha |
| Forma de **S** | Colas más livianas o más pesadas que la normal |
| Escalón o quiebre en el centro | **Mezcla de poblaciones** (bimodalidad) |
| Uno o dos puntos alejados en un extremo | Atípicos |

En R: `qqnorm(y); qqline(y)` o `ggplot(df, aes(sample = y)) + geom_qq() + geom_qq_line()`.

### 2.2 Pruebas formales

$H_0$: los datos provienen de una distribución normal · $H_1$: no provienen.

| Prueba | Fortaleza | En R |
|---|---|---|
| **Shapiro-Wilk** | La más potente para $n \le 5000$ | `shapiro.test(y)` |
| **Anderson-Darling** | Sensible en las colas (útil en calidad) | `nortest::ad.test(y)` |
| Kolmogorov-Smirnov (Lilliefors) | Menos potente | `nortest::lillie.test(y)` |

> ⚠️ Con $n$ pequeño, las pruebas tienen **poca potencia** (casi nunca rechazan). Con $n$
> muy grande, rechazan por desviaciones **sin importancia práctica**. Usa siempre el
> gráfico Q-Q junto con la prueba.

### 2.3 ¿Qué hacer si no hay normalidad?

1. Buscar una **mezcla** (estratificar): resuelve el caso bimodal.
2. Revisar **atípicos**.
3. Usar un modelo más adecuado (gamma, lognormal) o una **transformación** (log, Box-Cox;
   Sesión 2).
4. Si el objetivo es inferir sobre la **media**, recordar el TCL (siguiente sección).

## 3. Teorema Central del Límite

Si $y_1,\dots,y_n$ son independientes, con media $\mu$ y varianza finita $\sigma^2$,
entonces, para $n$ suficientemente grande,

$$
\bar{y} \;\dot\sim\; N\!\left(\mu,\ \frac{\sigma^2}{n}\right)
\qquad\Longleftrightarrow\qquad
\frac{\bar{y}-\mu}{\sigma/\sqrt{n}} \;\dot\sim\; N(0,1).
$$

La cantidad $\sigma/\sqrt{n}$ es el **error estándar** de la media.

### Qué asegura y qué no

| ✅ El TCL **sí** asegura | ❌ El TCL **no** asegura |
|---|---|
| Que la **media muestral** es aproximadamente normal con $n$ grande | Que los **datos individuales** sean normales |
| Que el error estándar disminuye como $1/\sqrt{n}$ | Que $n=30$ sea suficiente siempre (depende de la asimetría) |
| Robustez de los IC y pruebas **para la media** | Robustez de los IC y pruebas **para la varianza** ($\chi^2$, $F$) |
| | Que la fracción fuera de especificación pueda calcularse con la normal |
| | Nada si los datos **no son independientes** |

> **En calidad:** el TCL justifica la carta $\bar{X}$ y la prueba $t$ con muestras
> moderadas, pero **no** autoriza a calcular la proporción de envases no conformes con un
> modelo normal si los volúmenes individuales no son normales.

---

### Para repasar

- Un Q-Q muestra un escalón en el centro. ¿Qué sospechas y qué harías primero?
- ¿Por qué el TCL no te ayuda a estimar la fracción de tiempos de atención mayores a 20 min?
- Si $\sigma = 6$ min, ¿cuál es el error estándar de la media con $n = 36$?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 4, 6 y 7.
- Navidi, W. _Estadística para ingenieros y científicos_, cap. 4.
