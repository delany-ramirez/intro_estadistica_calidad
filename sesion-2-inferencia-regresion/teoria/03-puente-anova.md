# Puente conceptual al ANOVA

> **Objetivos.** Comprender la idea de **partición de la variabilidad** y el estadístico
> $F$ como herramienta para comparar más de dos medias, sin entrar todavía en diseños
> (que ASC22 desarrolla a partir del experimento de un factor). · **RAA3**

## 1. ¿Por qué no hacer muchas pruebas t?

Con $a = 3$ proveedores hay 3 comparaciones por pares; con $a = 5$, 10. Si cada una se
hace con $\alpha = 0.05$, la probabilidad de al menos una falsa alarma crece:

$$
P(\text{al menos un error tipo I}) \approx 1-(1-\alpha)^{m}.
$$

Con $m = 10$: $1 - 0.95^{10} \approx 0.40$. El **análisis de varianza (ANOVA)** compara
todas las medias **en una sola prueba**.

## 2. La idea: partir la variabilidad total

Con $a$ grupos de $n$ observaciones ($N = an$), $\bar{y}_{i\cdot}$ media del grupo $i$ y
$\bar{y}_{\cdot\cdot}$ media global:

$$
\underbrace{\sum_{i}\sum_{j}(y_{ij}-\bar{y}_{\cdot\cdot})^2}_{SC_T}
=
\underbrace{n\sum_{i}(\bar{y}_{i\cdot}-\bar{y}_{\cdot\cdot})^2}_{SC_{\text{Entre}}}
+
\underbrace{\sum_{i}\sum_{j}(y_{ij}-\bar{y}_{i\cdot})^2}_{SC_{\text{Dentro}}=SC_E}
$$

- **Entre grupos:** cuánto se separan las medias de los grupos (señal).
- **Dentro de los grupos:** el ruido o **error experimental**.

## 3. El estadístico F

$$
F_0 = \frac{CM_{\text{Entre}}}{CM_E} = \frac{SC_{\text{Entre}}/(a-1)}{SC_E/(N-a)}
\;\sim\; F_{a-1,\,N-a}\ \text{bajo } H_0:\mu_1=\dots=\mu_a .
$$

| Fuente | gl | SC | CM | $F_0$ |
|---|---|---|---|---|
| Entre grupos | $a-1$ | $SC_{\text{Entre}}$ | $SC_{\text{Entre}}/(a-1)$ | $CM_{\text{Entre}}/CM_E$ |
| Dentro (error) | $N-a$ | $SC_E$ | $SC_E/(N-a)$ | |
| Total | $N-1$ | $SC_T$ | | |

- Si $H_0$ es cierta, ambos CM estiman $\sigma^2$ y $F_0 \approx 1$.
- Si las medias difieren, $CM_{\text{Entre}}$ crece y $F_0 \gg 1$.

> Es la **misma distribución $F$** de la razón de varianzas: el ANOVA compara medias
> **comparando dos estimaciones de varianza**.

## 4. Relación con lo que ya sabes

- Con $a = 2$, el ANOVA equivale a la $t$ con varianza combinada: $F_0 = t_0^2$.
- $CM_E$ es la generalización de $s_p^2$.
- Los supuestos son los mismos: independencia, normalidad y **varianzas iguales**, y se
  verifican con **residuales** (documento 05).
- La regresión lineal (documento 04) produce una tabla ANOVA con la misma lógica.

## 5. Lo que queda para ASC22

- El modelo de efectos $y_{ij} = \mu + \tau_i + \varepsilon_{ij}$ y su estimación.
- Comparaciones múltiples (Tukey, Dunnett) para saber **cuáles** medias difieren.
- Diseños con bloques, factoriales y más.

En R (solo para explorar): `summary(aov(y ~ grupo, data = df))`.

---

### Para repasar

- ¿Qué indica un $F_0$ cercano a 1?
- Si $SC_T = 120$ y $SC_E = 90$ con $a = 4$ y $N = 24$, calcula $F_0$.
- ¿Por qué el ANOVA, a pesar de su nombre, sirve para comparar **medias**?

### Referencias

- Montgomery, D. C. _Design and Analysis of Experiments_, cap. 3.
