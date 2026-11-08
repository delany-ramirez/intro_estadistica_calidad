# Taller integrador 1 — Peso de tabletas

> **Duración:** 40 min · **Modalidad:** individual (se permite consultar el material del
> curso) · **Peso:** 20 % · **RAA1, RAA2, RAA3**
> **Datos:** [`../datos/peso-tabletas.csv`](../datos/peso-tabletas.csv)
> **Entrega:** [`taller-integrador-1_plantilla.Rmd`](taller-integrador-1_plantilla.Rmd)
> diligenciada + el `.html` compilado, en la plataforma, al cierre de la sesión.

## Contexto

Un laboratorio farmacéutico fabrica tabletas con **peso nominal de 250 mg** y
especificación de **250 ± 7.5 mg** (± 3 %). Se tomaron **10 tabletas de cada uno de 4
lotes** en dos tableteadoras (**T1** y **T2**): 80 tabletas en total.

| Variable | Descripción |
|---|---|
| `tableteadora` | T1, T2 |
| `lote` | 1–4 (dentro de cada tableteadora) |
| `peso_mg` | Peso de la tableta (mg) |

## Problema 1 — Descripción y atípicos *(12 min)* · RAA1

**a)** Resume el peso por tableteadora: $n$, media, mediana, $s$, RIC, mínimo y máximo.

**b)** Elabora **un** gráfico que compare las dos tableteadoras mostrando forma y datos
individuales, con los límites de especificación.

**c)** Identifica los atípicos (regla de Tukey) por tableteadora. ¿Hay tabletas fuera de
especificación? ¿Qué recomendarías hacer con ellas antes del análisis inferencial?

## Problema 2 — Normalidad *(10 min)* · RAA2

**a)** Evalúa la normalidad del peso **en cada tableteadora** con un gráfico Q-Q y
Shapiro-Wilk.

**b)** Con un modelo normal para **T2**, estima la proporción de tabletas fuera de
especificación. ¿Es confiable esa estimación? Justifica.

## Problema 3 — Inferencia *(15 min)* · RAA3

**a)** Construye un IC del 95 % para el peso medio de **T1**. Interprétalo.

**b)** Plantea y resuelve, para **T1**, la prueba de que el peso medio difiere del
nominal (250 mg), con $\alpha = 0.05$. Reporta estadístico, gl, valor p y decisión.

**c)** ¿Qué sería un error tipo II en la prueba anterior y qué consecuencia tendría para
el paciente?

## Conclusión *(3 min)*

En 3–4 líneas dirigidas al jefe de producción: ¿qué tableteadora preocupa más y por qué
(centro y/o variabilidad)? ¿Qué acción propones?

---

### Criterios de calificación

| Criterio | Puntos |
|---|---:|
| Problema 1 (resumen, gráfico, atípicos con criterio) | 30 |
| Problema 2 (normalidad e interpretación de su alcance) | 25 |
| Problema 3 (IC, prueba completa, error tipo II en contexto) | 30 |
| Conclusión en lenguaje del proceso | 10 |
| Documento reproducible (compila sin errores, cifras salidas de R) | 5 |
| **Total** | **100** |
