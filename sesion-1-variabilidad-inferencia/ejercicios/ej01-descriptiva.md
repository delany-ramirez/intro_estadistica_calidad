# Ejercicio 01 — Variabilidad y descriptiva comparativa

> **Temas:** unidad experimental, estratificación, gráficos comparativos, medidas de
> posición y dispersión, atípicos. · **RAA1**
> **Datos:** [`../datos/resistencia-hilo.csv`](../datos/resistencia-hilo.csv)

## Contexto

Una tejeduría compra hilo a tres proveedores (**Alfa, Beta, Gama**). Calidad tomó 25
conos de cada proveedor, cortó **una** probeta por cono y midió la **resistencia a la
tracción (cN)**. La especificación de compra exige **mínimo 380 cN**.

| Variable | Descripción |
|---|---|
| `proveedor` | Alfa, Beta, Gama |
| `resistencia_cn` | Resistencia a la tracción (centinewton) |

## Preguntas

**a) Datos.** ¿Cuál es la unidad experimental? ¿Y la unidad de medición? Si en lugar de
25 conos se hubieran cortado 5 probetas de cada uno de 5 conos, ¿cuántas réplicas
habría por proveedor? ¿Por qué importa la diferencia?

**b) Resumen por grupo.** Construye una tabla con $n$, media, mediana, $s$, RIC, CV,
mínimo y máximo por proveedor. ¿Qué proveedor es el más **consistente**?

**c) Gráficos.** Elabora un diagrama de cajas y un gráfico de violín con los datos
superpuestos. ¿Qué te muestra cada uno que el otro no?

**d) Atípicos.** Identifica los atípicos por la regla de Tukey ($1.5\,\text{RIC}$) y por
$|z|>3$ **dentro de cada proveedor**. ¿Coinciden? ¿Qué harías con cada atípico antes de
decidir si eliminarlo?

**e) Especificación.** ¿Cuántas probetas incumplen el mínimo de 380 cN y de qué
proveedor son?

**f) Recomendación.** En 3–4 líneas, recomienda a compras qué proveedor preferir y por qué,
considerando **centro** y **variabilidad**. ¿Bastaría comparar las medias?

---

> Solución en [`ej01-descriptiva-sol.Rmd`](ej01-descriptiva-sol.Rmd). Intenta resolverlo antes de mirarla.
