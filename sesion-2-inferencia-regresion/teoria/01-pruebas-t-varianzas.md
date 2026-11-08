# Pruebas t y razón de varianzas

> **Objetivos.** Elegir y aplicar la prueba adecuada para comparar medias (una muestra,
> dos muestras independientes, muestras pareadas) y varianzas (razón $F$), según cómo se
> recogieron los datos. · **RAA3**

## 1. ¿Qué prueba uso? La pregunta es el diseño

```
¿Cuántas muestras?
│
├─ Una, contra un valor de referencia ............ t de una muestra
│
└─ Dos
   ├─ Las mismas unidades medidas dos veces
   │  (antes/después, dos instrumentos) ......... t PAREADA
   │
   └─ Unidades distintas e independientes
      ├─ ¿Varianzas iguales? (prueba F, gráficos)
      │   ├─ Sí ................................. t con varianza combinada
      │   └─ No / dudoso ......................... t de Welch (opción por defecto en R)
      └─ ¿Se quiere comparar dispersión? ......... F (razón de varianzas)
```

## 2. t de una muestra (repaso)

$$
t_0 = \frac{\bar{y}-\mu_0}{s/\sqrt{n}} \sim t_{n-1}\ \text{bajo } H_0 .
$$

En R: `t.test(y, mu = mu0, alternative = "two.sided" | "less" | "greater")`.

## 3. Dos muestras independientes

Hipótesis: $H_0: \mu_1 = \mu_2$ (o $\mu_1-\mu_2=\Delta_0$).

### 3.1 Varianzas iguales (combinada)

$$
t_0 = \frac{\bar{y}_1-\bar{y}_2}{s_p\sqrt{\frac{1}{n_1}+\frac{1}{n_2}}}, \qquad
s_p^2 = \frac{(n_1-1)s_1^2+(n_2-1)s_2^2}{n_1+n_2-2}, \qquad gl = n_1+n_2-2 .
$$

### 3.2 Varianzas distintas (Welch)

$$
t_0 = \frac{\bar{y}_1-\bar{y}_2}{\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}}, \qquad
\nu = \frac{\left(\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}\right)^2}
{\frac{(s_1^2/n_1)^2}{n_1-1}+\frac{(s_2^2/n_2)^2}{n_2-1}} .
$$

> **Recomendación práctica.** Usa Welch por defecto (`t.test(y ~ grupo)`). Pierde muy poca
> potencia cuando las varianzas son iguales y protege cuando no lo son, sobre todo con
> tamaños de muestra distintos.

## 4. Muestras pareadas

Cuando cada unidad se mide en **ambas** condiciones, se analizan las **diferencias**
$d_i = y_{1i} - y_{2i}$:

$$
t_0 = \frac{\bar{d}-\Delta_0}{s_d/\sqrt{n}} \sim t_{n-1}.
$$

El emparejamiento **elimina la variabilidad entre unidades** del error. Si las unidades
son muy distintas entre sí (probetas de dureza variada, hornos a distintas
temperaturas), la prueba pareada es mucho más potente que la de dos muestras.

> ⚠️ Analizar datos pareados como independientes es un error grave: la variabilidad entre
> unidades se queda en el denominador y **oculta** diferencias reales. Es el antecedente
> directo del **bloqueo** que verás en ASC22.

En R: `t.test(x1, x2, paired = TRUE)` o `t.test(x1 - x2)`.

## 5. Razón de varianzas (F)

$$
H_0: \sigma_1^2 = \sigma_2^2, \qquad
F_0 = \frac{s_1^2}{s_2^2} \sim F_{n_1-1,\,n_2-1}\ \text{bajo } H_0 .
$$

Se usa para **comparar consistencia** (¿la línea B es más variable que la A?) y como
diagnóstico antes de la $t$ combinada. En R: `var.test(y ~ grupo)`.

> ⚠️ La prueba $F$ es **muy sensible a la no normalidad**. Si los datos no son normales,
> usa la prueba de **Levene** (`car::leveneTest`), más robusta.

## 6. Supuestos y reporte

| Prueba | Supuestos | Si fallan |
|---|---|---|
| $t$ (cualquiera) | Independencia; normalidad (de cada grupo o de las diferencias) | Con $n$ moderado, la $t$ es robusta (TCL); con $n$ pequeño y asimetría: transformar o usar Wilcoxon 🔵 |
| $F$ | Independencia; normalidad **estricta** | Levene |

Reporte mínimo: estadístico, gl, valor p, **diferencia estimada con su IC** y
conclusión en el lenguaje del proceso.

---

### Para repasar

- Se mide la rugosidad de 15 piezas antes y después de un pulido. ¿Qué prueba usas?
- ¿Por qué un IC para $\mu_1-\mu_2$ que no contiene 0 equivale a rechazar $H_0$?
- ¿En qué situación la $t$ combinada puede dar un valor p engañoso?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 10.
- Montgomery, D. C. _Design and Analysis of Experiments_, cap. 2.
