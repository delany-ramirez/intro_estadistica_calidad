# Instala los paquetes de R usados en el curso AS001 — Análisis Estadístico.
# Uso (desde la raíz del repositorio):  source("install.R")

paquetes <- c(
  "tidyverse",  # readr, dplyr, tidyr, ggplot2 ...
  "rmarkdown",  # compilar .Rmd
  "knitr",      # tablas con kable()
  "car",        # leveneTest, qqPlot, influencePlot, ncvTest
  "nortest",    # ad.test (Anderson-Darling)
  "pwr",        # potencia y tamaño de muestra
  "broom",      # tidy() / glance() / augment() para modelos
  "patchwork",  # combinar gráficos ggplot
  "MASS"        # boxcox()
)

faltantes <- setdiff(paquetes, rownames(installed.packages()))
if (length(faltantes) > 0) {
  install.packages(faltantes, repos = "https://cloud.r-project.org")
}

ok <- vapply(paquetes, requireNamespace, logical(1), quietly = TRUE)
if (all(ok)) {
  message("✔ Todos los paquetes están instalados. R ", getRversion())
} else {
  warning("No se pudieron instalar: ", paste(paquetes[!ok], collapse = ", "))
}
