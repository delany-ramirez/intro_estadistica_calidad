# Ejercicio 01 — Pruebas t y razón de varianzas

> **Temas:** elección de la prueba según el diseño, $t$ de dos muestras, $t$ pareada,
> prueba $F$. · **RAA3**
> **Datos:** [`../datos/resistencia-cajas.csv`](../datos/resistencia-cajas.csv) y
> [`../datos/temperatura-hornos.csv`](../datos/temperatura-hornos.csv)

## Parte A — Cajas de cartón de dos proveedores

Una empresa de despachos evalúa cajas de dos proveedores (**Norte** y **Sur**). Se
ensayaron 14 cajas de cada uno a compresión (kgf). El proveedor Sur es 8 % más barato,
pero compras teme que sus cajas sean **menos resistentes**.

**a)** ¿Qué prueba corresponde y por qué? Plantea $H_0$ y $H_1$ (atención a la dirección
de la alternativa).

**b)** Verifica normalidad por grupo y compara varianzas con la prueba $F$. ¿Usarías la
$t$ combinada o la de Welch?

**c)** Realiza la prueba con $\alpha = 0.05$. Reporta $t_0$, gl, valor p y el IC del 95 %
**bilateral** para la diferencia de medias.

**d)** La gerencia dice que una diferencia menor a 5 kgf no es relevante. Con base en el
IC, ¿la diferencia es **estadísticamente** significativa? ¿Es **prácticamente** relevante?
¿Qué recomendarías?

## Parte B — Validación de un sensor de temperatura

Para validar un **sensor nuevo**, se midió la temperatura de 10 hornos industriales con
el sensor y con un **termómetro patrón** al mismo tiempo. Los hornos operan a
temperaturas muy distintas (180–240 °C).

**e)** ¿Por qué estos datos son **pareados**? Calcula las diferencias sensor − patrón y
verifica su normalidad.

**f)** ¿Tiene el sensor un sesgo? Realiza la prueba pareada ($\alpha = 0.05$) y reporta el
IC del sesgo.

**g)** Repite (de forma incorrecta) el análisis como si fueran dos muestras independientes.
Compara los errores estándar y explica la diferencia en la conclusión.

---

> Solución en [`ej01-pruebas-t-sol.Rmd`](ej01-pruebas-t-sol.Rmd).
