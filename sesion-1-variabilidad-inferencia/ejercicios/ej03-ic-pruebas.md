# Ejercicio 03 — Intervalos de confianza y pruebas para una muestra

> **Temas:** IC para $\mu$ y $\sigma$, prueba $t$ para una media, prueba $\chi^2$ para
> una varianza, valor p, errores tipo I y II. · **RAA3**
> **Datos:** [`../datos/grasa-leche.csv`](../datos/grasa-leche.csv)

## Contexto

Una cooperativa lechera rotula su leche entera con **3.0 % de grasa**. La autoridad
sanitaria tomó **16 muestras** de distintos lotes. Además, el cliente institucional exige
que la desviación estándar del contenido de grasa sea **menor a 0.15 %**.

## Preguntas

**a)** Calcula $\bar{y}$ y $s$. Verifica el supuesto de normalidad. ¿Por qué es más
importante verificarlo para la pregunta e) que para la b)?

**b)** Construye un IC del 95 % para el contenido medio de grasa, **a mano** (con `qt`) y
con `t.test()`. Interprétalo correctamente.

**c)** Plantea y resuelve la prueba de que la grasa media difiere del valor rotulado
($\alpha = 0.05$). Reporta $t_0$, gl y valor p. ¿Coincide la decisión con el IC de b)?

**d)** Un funcionario concluye: *"como no se rechazó $H_0$, quedó demostrado que la leche
tiene 3.0 % de grasa"*. Corrige esta afirmación. ¿Qué tipo de error podría estar
cometiéndose y de qué depende su probabilidad?

**e)** Plantea y resuelve la prueba sobre la desviación estándar exigida por el cliente
($H_1: \sigma < 0.15$). Calcula también el IC del 95 % para $\sigma$.

**f)** En el contexto de la cooperativa, describe con tus palabras qué sería un error tipo
I y un error tipo II en la prueba de c), y cuál le preocupa más al **consumidor**.

---

> Solución en [`ej03-ic-pruebas-sol.Rmd`](ej03-ic-pruebas-sol.Rmd).
