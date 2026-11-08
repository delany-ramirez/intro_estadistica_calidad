# Estadística descriptiva comparativa

> **Objetivos.** Elegir las medidas y gráficos que permiten **comparar grupos** y
> **detectar valores atípicos** en datos de procesos de calidad. · **RAA1**

## 1. Medidas de posición

| Medida | Fórmula / definición | Robusta a atípicos |
|---|---|---|
| Media | $\bar{y} = \frac{1}{n}\sum y_i$ | ❌ |
| Mediana | Valor central de los datos ordenados ($Q_2$) | ✅ |
| Cuartiles | $Q_1$ (25 %), $Q_3$ (75 %) | ✅ |
| Percentil $p$ | Valor que deja el $p\,\%$ de los datos por debajo | ✅ |

Si la media y la mediana difieren mucho, la distribución es **asimétrica** o hay
**atípicos**.

## 2. Medidas de dispersión

$$
s^2 = \frac{1}{n-1}\sum_{i=1}^{n}(y_i-\bar{y})^2, \qquad s=\sqrt{s^2}, \qquad
\text{RIC} = Q_3 - Q_1, \qquad CV = \frac{s}{\bar{y}}\times 100\,\% .
$$

- $s$ está en las mismas unidades que los datos.
- El **RIC** es robusto; el **coeficiente de variación** permite comparar dispersión de
  variables con escalas distintas.
- El **rango** $y_{\max}-y_{\min}$ se usa en cartas de control con subgrupos pequeños.

## 3. Puntaje Z y regla empírica

El **puntaje Z** expresa a cuántas desviaciones estándar está una observación de la media:

$$
z_i = \frac{y_i - \bar{y}}{s}.
$$

**Regla empírica** (datos aproximadamente normales y en forma de campana):

| Intervalo | Proporción esperada |
|---|---|
| $\bar{y} \pm 1s$ | ≈ 68 % |
| $\bar{y} \pm 2s$ | ≈ 95 % |
| $\bar{y} \pm 3s$ | ≈ 99.7 % |

> Un $|z|>3$ es sospechoso de atípico **si** los datos son aproximadamente normales. Con
> datos asimétricos o bimodales, la regla empírica **no aplica** (compárala con las
> proporciones observadas para comprobarlo).

## 4. Atípicos por la regla del diagrama de cajas

Se marcan como atípicos los puntos fuera de las **vallas de Tukey**:

$$
[\,Q_1 - 1.5\,\text{RIC},\; Q_3 + 1.5\,\text{RIC}\,].
$$

Un atípico no se borra por ser atípico: se **investiga**. Puede ser un error de registro
(se corrige), una causa asignable (se documenta y se actúa) o un valor legítimo de la
cola (se conserva).

## 5. Gráficos para comparar grupos

| Gráfico | Qué muestra bien | Limitación | `ggplot2` |
|---|---|---|---|
| **Cajas** (boxplot) | Mediana, RIC, atípicos; comparación de muchos grupos | Oculta la bimodalidad | `geom_boxplot()` |
| **Violín** | Forma completa de la distribución por grupo | Suaviza con muestras pequeñas | `geom_violin()` |
| **Histograma** | Forma, modas, asimetría | Depende del ancho de clase | `geom_histogram()` |
| **Acumulada empírica** (ECDF) | Percentiles; comparar distribuciones completas | Menos intuitiva | `stat_ecdf()` |
| **Puntos / jitter** | Cada dato individual; muestras pequeñas | Se satura con $n$ grande | `geom_jitter()` |

> **Buena práctica.** Combina un gráfico de resumen (cajas) con uno de forma (violín o
> histograma) y superpone los datos individuales cuando $n$ es pequeño.

## 6. Flujo de análisis descriptivo

1. Leer los datos y revisar tipos, faltantes y rangos imposibles.
2. Graficar **toda** la muestra (histograma): ¿una o varias modas?
3. **Estratificar** por las variables candidatas a causa asignable.
4. Resumir por grupo: $n$, media, mediana, $s$, RIC, mín., máx.
5. Identificar atípicos (vallas de Tukey, $|z|>3$) e investigarlos.
6. Comparar contra la **especificación** (nominal y tolerancias).

---

### Para repasar

- ¿Por qué un diagrama de cajas puede ocultar una distribución bimodal?
- Si $\bar{y}=500.2$ mL y $s=1.9$ mL, ¿qué fracción esperarías fuera de 500 ± 4 mL bajo
  normalidad?
- ¿Cuándo preferirías la mediana y el RIC sobre la media y $s$?

### Referencias

- Navidi, W. _Estadística para ingenieros y científicos_, cap. 1.
- Mendenhall, W. _Introducción a la probabilidad y estadística_, cap. 2.
