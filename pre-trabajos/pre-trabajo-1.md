# Pre-trabajo 1 — Repaso descriptivo y distribuciones

> **Peso:** 15 % · **Cierre:** miércoles anterior a la Sesión 1, 23:59
> **Entrega:** [`pre-trabajo-1_plantilla.Rmd`](pre-trabajo-1_plantilla.Rmd) + `.html` compilado

## 1. Lecturas dirigidas (formativo, ~2 h)

| Lectura | Qué buscar |
|---|---|
| [`01-tutorial-r.md`](01-tutorial-r.md) + [`01-tutorial-r.Rmd`](01-tutorial-r.Rmd) | Pipe `\|>`, `group_by` + `summarise`, `count` y `ggplot2`: lo necesario para el ejercicio en R |
| [`../sesion-1-variabilidad-inferencia/teoria/01-datos-variabilidad.md`](../sesion-1-variabilidad-inferencia/teoria/01-datos-variabilidad.md) | Diferencia entre réplica y repetición; qué es estratificar |
| [`../sesion-1-variabilidad-inferencia/teoria/02-descriptiva-comparativa.md`](../sesion-1-variabilidad-inferencia/teoria/02-descriptiva-comparativa.md) | Medidas robustas; regla empírica; vallas de Tukey |
| [`../sesion-1-variabilidad-inferencia/teoria/03-normalidad-tcl.md`](../sesion-1-variabilidad-inferencia/teoria/03-normalidad-tcl.md) §1–2 | Cálculo de probabilidades con la normal; lectura del Q-Q |
| Navidi (2022), cap. 1 y 4 · Montgomery y Runger, cap. 4 | Repaso de Estadística para la Calidad |

## 2. Cuestionario (calificable, 40 %)

Responde en la plantilla (sección *Cuestionario*), con 2–4 líneas por pregunta.

1. Una planta mide la dureza de 4 puntos de cada una de 10 láminas. ¿Cuál es la unidad
   experimental, la unidad de medición y el número de réplicas? ¿Qué error se comete si
   se tratan las 40 lecturas como independientes?
2. ¿Por qué la mediana y el RIC son preferibles a la media y la desviación estándar
   cuando hay atípicos? Da un ejemplo de un proceso de tu organización.
3. Si el peso de un producto sigue $N(500, 3^2)$ g y el límite inferior es 492 g, ¿qué
   proporción de unidades es no conforme? (muestra el cálculo de $z$).
4. Explica con tus palabras qué es una **causa asignable** y cómo la estratificación
   ayuda a encontrarla.
5. Describe cómo se vería un gráfico Q-Q de datos asimétricos a la derecha.

## 3. Ejercicio en R (calificable, 60 %)

Datos: [`datos/diametro-pernos.csv`](datos/diametro-pernos.csv). Un fabricante de pernos
midió el diámetro de 60 pernos (20 por turno). La especificación es **10.00 ± 0.15 mm**.

**a)** Resume el diámetro **por turno**: $n$, media, mediana, $s$, RIC, mínimo, máximo.

**b)** Elabora un diagrama de cajas por turno con los límites de especificación y un
histograma de todos los datos.

**c)** Calcula el puntaje $z$ de cada perno (con la media y $s$ globales) y verifica la
regla empírica: ¿qué porcentaje está dentro de ±1, ±2 y ±3 desviaciones?

**d)** Elabora el gráfico Q-Q y aplica Shapiro-Wilk a todos los datos. ¿Es razonable un
modelo normal?

**e)** Con el modelo normal (media y $s$ globales), estima la proporción de pernos fuera de
especificación en ppm.

**f)** ¿Algún turno se comporta distinto? Escribe 3 líneas de conclusión para el jefe de
planta.

### Criterios de calificación del ejercicio

| Criterio | Puntos |
|---|---:|
| Resumen y gráficos correctos (a, b) | 35 |
| Z, regla empírica y normalidad (c, d) | 30 |
| Probabilidad de no conformidad (e) | 15 |
| Conclusión en lenguaje del proceso (f) | 15 |
| Documento compila sin errores | 5 |
