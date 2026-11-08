# Convenciones del repositorio

Guía de estilo y reproducibilidad para todo el material del curso.

## 1. Estructura de cada sesión

```
sesion-N-nombre/
├── README.md        # agenda de la sesión, objetivos, contenidos núcleo/opcional, rutas
├── teoria/          # documentos .md con LaTeX (uno por tema)
├── notebooks/       # prácticas ejecutables en R Markdown (.Rmd)
├── datos/           # datasets .csv usados por notebooks y ejercicios
└── ejercicios/      # enunciados (.md) y soluciones (.Rmd)
```

## 2. Núcleo vs. opcional

- ✅ **Núcleo** — material evaluable, imprescindible.
- 🔵 **Opcional** — profundización o lecturas para ampliar.

## 3. Estilo de los `.md` con LaTeX

- Fórmulas **inline** con `$...$`; en **bloque** con `$$...$$` en su propia línea, con
  líneas en blanco alrededor.
- Notación: $\mu$, $\sigma^2$ parámetros; $\bar{y}$, $s^2$ estimadores; $\alpha$ nivel de
  significación; $\beta_j$ coeficientes de regresión. Coherente con Montgomery, la
  notación que retoma ASC22.
- Un archivo `.md` por tema, con encabezado `# Título` y un bloque de objetivos al inicio,
  e indicando el resultado de aprendizaje (RAA) que atiende.
- Idioma: **español**. Términos técnicos en inglés entre paréntesis la primera vez.

## 4. Prácticas en R Markdown

- Solo **R**: no hay versión en Python.
- Cada `.Rmd` debe **compilar (Knit) de principio a fin sin errores** con los paquetes de
  [`install.R`](../install.R).
- Leer datos desde `../datos/` con rutas relativas; nunca rutas absolutas.
- Fijar semilla cuando haya simulación (`set.seed(...)`).
- Encabezado YAML: `title`, `subtitle` (sesión), salida `html_document` con `toc`.
- Primera sección: **Objetivos** y **Paquetes**. Preferir `tidyverse` (`dplyr`, `ggplot2`)
  y funciones base de `stats` para las pruebas (`t.test`, `var.test`, `lm`).

### Convención de nombres

| Elemento | Patrón | Ejemplo |
|----------|--------|---------|
| Teoría | `NN-tema-corto.md` | `03-normalidad-tcl.md` |
| Práctica | `NN-tema-corto.Rmd` | `02-normalidad-tcl.Rmd` |
| Datos | `nombre-descriptivo.csv` | `llenado-envases.csv` |
| Ejercicio | `ejNN-tema.md` + `ejNN-tema-sol.Rmd` | `ej01-variabilidad.md` |
| Plantilla de entrega | `*_plantilla.Rmd` | `taller-integrador-1_plantilla.Rmd` |

## 5. Datos

- `.csv` con encabezados en minúscula y `snake_case`, separador coma, punto decimal,
  unidades en el nombre de la columna (`volumen_ml`, `tiempo_min`).
- Todos los datos son simulados con
  [`docente/scripts/generar-datos.R`](../docente/scripts/generar-datos.R).
- Documentar cada dataset (contexto, variables, unidades) en el README de la sesión.

## 6. Entregas de estudiantes

- Se entregan como `.Rmd` **y** el `.html` compilado, nombrados
  `apellido-nombre_<actividad>.Rmd`.
- Toda cifra reportada en el texto debe provenir de una salida de R en el mismo documento.
