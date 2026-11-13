# AS001 · Análisis Estadístico (nivelatorio)

Repositorio del curso **Análisis Estadístico** de la Maestría en Sistemas Integrados de
Gestión de la Calidad (UTP). Nivelatorio de **12 horas** de acompañamiento directo, en
**dos sábados de 6 h**, precedidos de trabajo autónomo. Prepara al estudiante para
**Diseño y Desarrollo de Experimentos (ASC22)**.

Material en español: teoría en `.md` (LaTeX) y prácticas ejecutables en **R Markdown**
(`.Rmd`). El curso usa **solo R** (tidyverse + R Markdown).

## 📚 Programa

| Momento | Tema | Carpeta | Peso |
|---------|------|---------|-----:|
| Antes de S1 | Diagnóstico de entrada (sin nota) + Pre-trabajo 1 | [`pre-trabajos/`](pre-trabajos/) | 15 % |
| Sesión 1 | Variabilidad, normalidad e inferencia · Taller integrador 1 | [`sesion-1-variabilidad-inferencia/`](sesion-1-variabilidad-inferencia/) | 20 % |
| Entre sesiones | Pre-trabajo 2 | [`pre-trabajos/`](pre-trabajos/) | 15 % |
| Sesión 2 | Inferencia aplicada, regresión y supuestos · Evaluación individual | [`sesion-2-inferencia-regresion/`](sesion-2-inferencia-regresion/) | 50 % |
| — | Recursos generales | [`recursos/`](recursos/) | — |

Cada sesión sigue la misma estructura: `teoria/` · `notebooks/` · `datos/` · `ejercicios/`.

### Resultados de aprendizaje

- **RAA1.** Organizar y visualizar datos de procesos de calidad, seleccionando medidas y
  gráficos descriptivos para comparar grupos y detectar valores atípicos.
- **RAA2.** Modelar la variabilidad de una característica de calidad con distribuciones de
  probabilidad y verificar el supuesto de normalidad.
- **RAA3.** Estimar parámetros y contrastar hipótesis sobre medias y varianzas,
  interpretando valor p, errores tipo I y II y potencia.
- **RAA4.** Ajustar e interpretar modelos de regresión lineal y evaluar sus supuestos
  mediante análisis de residuales, con software estadístico.

## 🗂️ Estructura del repositorio

```
intro_estadistica_calidad/
├── docs/convenciones.md                  # estilo .md/LaTeX y .Rmd
├── install.R                             # instala los paquetes de R del curso
├── pre-trabajos/                         # diagnóstico, instalación, tutorial de R, pre-trabajos 1 y 2
├── sesion-1-variabilidad-inferencia/
│   ├── teoria/   notebooks/   datos/   ejercicios/
├── sesion-2-inferencia-regresion/        (misma sub-estructura)
├── recursos/                             # bibliografía, cheatsheet, plantillas
├── slides_qmd/                           # presentaciones Quarto/Reveal.js (una por sesión)
└── docente/                              # ⚠️ solo docente: soluciones, evaluación, rúbricas
```

> ⚠️ **`docente/`** contiene las soluciones del taller, de los pre-trabajos y la evaluación
> individual. No la compartas con los estudiantes (exclúyela al publicar el repositorio).

## ⚙️ Puesta en marcha

1. Instala [R](https://cran.r-project.org/) (≥ 4.2) y
   [RStudio](https://posit.co/download/rstudio-desktop/) o VS Code con la extensión de R.
2. Abre la carpeta del repositorio como proyecto y ejecuta una sola vez:

   ```r
   source("install.R")
   ```

3. Abre cualquier `.Rmd` de `notebooks/` y pulsa **Knit** (o `rmarkdown::render("archivo.Rmd")`).
   Los datos se leen con rutas relativas desde `../datos/`.

Guía detallada para estudiantes: [`pre-trabajos/00-instalacion-r.md`](pre-trabajos/00-instalacion-r.md).
Tutorial de R (pipe, `dplyr`, `ggplot2`): [`pre-trabajos/01-tutorial-r.md`](pre-trabajos/01-tutorial-r.md).

## 🎞️ Diapositivas

Quarto / Reveal.js en `slides_qmd/`. Generan un único `.html` autocontenido:

```bash
quarto render slides_qmd/sesion-1/slides.qmd
quarto render slides_qmd/sesion-2/slides.qmd
```

## 🔁 Datos

Todos los datasets son **simulados** con parámetros realistas y se regeneran con
`Rscript docente/scripts/generar-datos.R` (semillas fijas). Cada README de sesión
documenta sus variables y unidades.

## 📄 Licencia

Material bajo [CC BY 4.0](LICENSE); el código (`.Rmd`, scripts) además bajo MIT.
