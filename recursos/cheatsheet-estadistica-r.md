# Cheatsheet — Análisis estadístico con R

Consulta rápida para el taller, la evaluación y ASC22.

## 1. ¿Qué prueba uso?

```
¿Qué quiero saber?
│
├─ Describir / comparar grupos ......... summarise() por grupo + boxplot/violín (S1)
├─ ¿Los datos son normales? ............ Q-Q + shapiro.test / nortest::ad.test (S1)
│
├─ Sobre UNA media vs. referencia ...... t.test(y, mu = mu0) (S1)
├─ Sobre UNA varianza .................. chi² = (n-1)s²/σ0² con pchisq (S1)
│
├─ DOS medias
│   ├─ mismas unidades (pareado) ....... t.test(x1, x2, paired = TRUE) (S2)
│   └─ unidades independientes ......... t.test(y ~ grupo)  [Welch] (S2)
├─ DOS varianzas ....................... var.test(y ~ grupo) | car::leveneTest (S2)
├─ TRES o más medias ................... aov(y ~ grupo)  → ASC22 (S2, puente)
│
├─ ¿Cuántos datos necesito? ............ power.t.test() / pwr::pwr.t.test() (S2)
│
└─ Relación entre variables numéricas
    ├─ fuerza de la relación lineal .... cor(), cor.test() (S2)
    └─ modelo / predicción ............. lm() + plot(modelo) + predict() (S2)
```

## 2. Descriptiva

```r
df |> group_by(grupo) |>
  summarise(n = n(), media = mean(y), mediana = median(y), s = sd(y),
            RIC = IQR(y), CV = 100 * sd(y) / mean(y), min = min(y), max = max(y))
z <- (y - mean(y)) / sd(y)
vallas <- quantile(y, c(.25, .75)) + c(-1.5, 1.5) * IQR(y)
```

| Gráfico | ggplot2 |
|---|---|
| Cajas | `geom_boxplot()` |
| Violín + datos | `geom_violin() + geom_jitter(width = .1)` |
| Histograma | `geom_histogram(binwidth = ...)` |
| Acumulada | `stat_ecdf()` |
| Q-Q | `geom_qq() + geom_qq_line()` |

## 3. Distribuciones en R

| | Densidad | Prob. acumulada $P(X \le x)$ | Cuantil | Aleatorios |
|---|---|---|---|---|
| Normal | `dnorm` | `pnorm` | `qnorm` | `rnorm` |
| t | `dt` | `pt` | `qt` | `rt` |
| Ji cuadrado | `dchisq` | `pchisq` | `qchisq` | `rchisq` |
| F | `df` | `pf` | `qf` | `rf` |

Valor crítico con área $\alpha/2$ a la derecha: `qt(1 - alpha/2, gl)`.

## 4. Fórmulas clave

| Qué | Fórmula |
|---|---|
| Error estándar | $\sigma/\sqrt{n}$ |
| IC media | $\bar{y} \pm t_{\alpha/2,n-1}\, s/\sqrt{n}$ |
| IC varianza | $\left[\frac{(n-1)s^2}{\chi^2_{\alpha/2}},\ \frac{(n-1)s^2}{\chi^2_{1-\alpha/2}}\right]$ |
| $t$ una muestra | $t_0 = (\bar{y}-\mu_0)/(s/\sqrt{n})$ |
| $t$ pareada | $t_0 = \bar{d}/(s_d/\sqrt{n})$ |
| Varianza combinada | $s_p^2 = \frac{(n_1-1)s_1^2+(n_2-1)s_2^2}{n_1+n_2-2}$ |
| Razón de varianzas | $F_0 = s_1^2/s_2^2$ |
| ANOVA | $F_0 = CM_{\text{Entre}}/CM_E$ |
| Pendiente | $\hat\beta_1 = S_{xy}/S_{xx}$ |
| $R^2$ | $1 - SC_E/SC_T$ |

## 5. Regresión

```r
m <- lm(y ~ x1 + x2, data = df)
summary(m)                    # coeficientes, R², R² ajustado, F global
confint(m)                    # IC de los coeficientes
broom::tidy(m, conf.int = TRUE); broom::glance(m)
predict(m, nuevo, interval = "confidence")   # media
predict(m, nuevo, interval = "prediction")   # una observación nueva
car::vif(m)                   # multicolinealidad (> 5–10)
```

## 6. Diagnóstico de residuales

```r
par(mfrow = c(2, 2)); plot(m)            # 4 gráficos
shapiro.test(residuals(m))               # normalidad
car::ncvTest(m)                          # varianza constante
car::durbinWatsonTest(m)                 # independencia
rstudent(m); hatvalues(m); cooks.distance(m)
car::influencePlot(m)
MASS::boxcox(m)                          # transformación sugerida
```

| Medida | Referencia |
|---|---|
| Residual estudentizado | $|r_i| > 3$ |
| Apalancamiento | $h_{ii} > 2p/n$ |
| Distancia de Cook | $D_i > 1$ (revisar si $> 4/n$) |

## 7. Reporte mínimo de una prueba

> Estadístico (gl) = valor, p = valor; estimación de la diferencia con IC 95 %;
> conclusión en unidades del proceso; supuestos verificados.
