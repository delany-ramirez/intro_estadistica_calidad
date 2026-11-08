# Ejercicio 04 — Diagnóstico de residuales e influencia

> **Temas:** gráficos de residuales, pruebas de supuestos, apalancamiento, distancia de
> Cook, decisión sobre puntos influyentes. · **RAA4**
> **Datos:** [`../datos/tiempo-entrega.csv`](../datos/tiempo-entrega.csv) y
> [`../datos/tostion-cafe.csv`](../datos/tostion-cafe.csv)

## Parte A — Validar el modelo del ejercicio 03

**a)** Para el modelo múltiple de la tostión de café, elabora los cuatro gráficos de
diagnóstico y aplica Shapiro-Wilk y `ncvTest` a los residuales. ¿Se cumplen los supuestos?
¿Las conclusiones del ejercicio 03 son confiables?

## Parte B — Tiempo de entrega

Una distribuidora de bebidas modela el **tiempo de una entrega** (min) en función del
número de **cajas** descargadas y de la **distancia** (m) que el repartidor camina desde el
camión. Registró 25 entregas.

**b)** Ajusta `tiempo_min ~ cajas + distancia_m` y escribe la ecuación.

**c)** Elabora los gráficos de diagnóstico. ¿Qué observación llama la atención y en qué
gráficos?

**d)** Para esa observación calcula su apalancamiento $h_{ii}$, su residual estudentizado
y su distancia de Cook, y compáralos con las referencias ($2p/n$, $|r|>3$, $D>1$). ¿Es
atípica, de alto apalancamiento, influyente?

**e)** Reajusta el modelo **sin** esa observación. Compara coeficientes, $R^2$ y $\hat\sigma$
con el modelo completo. ¿Cambia la interpretación del efecto de la distancia?

**f)** ¿Qué harías con ese punto antes de decidir excluirlo? Redacta en 3 líneas cómo
reportarías el modelo al jefe de logística.

---

> Solución en [`ej04-diagnostico-sol.Rmd`](ej04-diagnostico-sol.Rmd).
