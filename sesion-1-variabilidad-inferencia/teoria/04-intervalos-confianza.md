# Del intervalo de confianza a la prueba: distribuciones t, χ² y F

> **Objetivos.** Construir e interpretar intervalos de confianza para una media, una
> varianza y una razón de varianzas, reconociendo la distribución muestral que sustenta
> cada uno. · **RAA3**

## 1. Estimación puntual y por intervalo

Un estimador puntual ($\bar{y}$, $s^2$) da un solo número; un **intervalo de confianza
(IC)** del $100(1-\alpha)\,\%$ da un rango de valores plausibles para el parámetro y
expresa la **precisión** de la estimación.

> **Interpretación correcta.** Si se repitiera el muestreo muchas veces, el
> $100(1-\alpha)\,\%$ de los intervalos así construidos contendría el verdadero
> parámetro. Un intervalo ya calculado lo contiene o no; la "confianza" es del
> **procedimiento**.

## 2. Tres distribuciones muestrales

Si $y_1,\dots,y_n \sim N(\mu,\sigma^2)$ independientes:

| Estadístico | Distribución | Se usa para | En R |
|---|---|---|---|
| $T=\dfrac{\bar{y}-\mu}{s/\sqrt{n}}$ | $t_{n-1}$ | Media con $\sigma$ desconocida | `qt`, `pt` |
| $X^2=\dfrac{(n-1)s^2}{\sigma^2}$ | $\chi^2_{n-1}$ | Una varianza | `qchisq`, `pchisq` |
| $F=\dfrac{s_1^2/\sigma_1^2}{s_2^2/\sigma_2^2}$ | $F_{n_1-1,\,n_2-1}$ | Razón de dos varianzas | `qf`, `pf` |

- La $t$ es simétrica, con colas más pesadas que la normal; tiende a $N(0,1)$ al crecer $n$.
- La $\chi^2$ y la $F$ son **asimétricas** y solo toman valores positivos.
- La $t$ es robusta a la no normalidad (gracias al TCL); la $\chi^2$ y la $F$ **no lo son**.

## 3. Intervalos de confianza

**Media** ($\sigma$ desconocida):

$$
\bar{y} \pm t_{\alpha/2,\,n-1}\,\frac{s}{\sqrt{n}}
$$

**Varianza** (y, sacando raíz, desviación estándar):

$$
\frac{(n-1)s^2}{\chi^2_{\alpha/2,\,n-1}} \;\le\; \sigma^2 \;\le\;
\frac{(n-1)s^2}{\chi^2_{1-\alpha/2,\,n-1}}
$$

**Razón de varianzas**:

$$
\frac{s_1^2}{s_2^2}\,\frac{1}{F_{\alpha/2,\,n_1-1,\,n_2-1}} \;\le\;
\frac{\sigma_1^2}{\sigma_2^2} \;\le\;
\frac{s_1^2}{s_2^2}\,F_{\alpha/2,\,n_2-1,\,n_1-1}
$$

> Aquí $t_{\alpha/2,\nu}$ y $\chi^2_{\alpha/2,\nu}$ denotan el valor que deja un área
> $\alpha/2$ **a la derecha** (en R: `qt(1 - alpha/2, nu)`, `qchisq(1 - alpha/2, nu)`).

### Ejemplo: espesor de recubrimiento

Con $n=25$, $\bar{y}=51.28$ µm y $s=1.54$ µm, $t_{0.025,24}=2.064$:

$$
51.28 \pm 2.064\cdot\frac{1.54}{\sqrt{25}} = 51.28 \pm 0.64 \;\Rightarrow\; [50.64,\ 51.91]\ \mu\text{m}.
$$

El valor objetivo de 50 µm **no** está dentro del IC: los datos sugieren que el proceso
está centrado por encima del objetivo.

## 4. Del intervalo a la prueba (dualidad)

Para una prueba bilateral de nivel $\alpha$:

$$
\text{Se rechaza } H_0:\theta=\theta_0 \iff \theta_0 \notin \text{IC}_{100(1-\alpha)\%}(\theta).
$$

El IC responde **dos** preguntas a la vez: si hay diferencia (¿contiene $\theta_0$?) y
**de qué tamaño** puede ser (su amplitud y ubicación). Por eso se recomienda reportarlo
siempre junto con el valor p (documento 05).

## 5. Tamaño de muestra para estimar una media

Para que el semiancho del IC no supere un error $E$ (con $\sigma$ aproximada de un
estudio piloto):

$$
n = \left(\frac{z_{\alpha/2}\,\sigma}{E}\right)^2 .
$$

---

### Para repasar

- ¿Por qué el IC para $\sigma^2$ no es simétrico alrededor de $s^2$?
- Si duplicas $n$, ¿en qué factor se reduce la amplitud del IC para $\mu$?
- ¿Qué supuesto es más crítico para el IC de la varianza que para el de la media?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 8.
- Navidi, W. _Estadística para ingenieros y científicos_, cap. 5.
