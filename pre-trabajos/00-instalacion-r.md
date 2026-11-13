# Instalación de R y RStudio

> Tiempo estimado: 20–30 min. Hazlo **antes** del diagnóstico de entrada. Si algo falla,
> escribe al foro de la plataforma con una captura del error.

## 1. Instalar R

1. Entra a <https://cran.r-project.org/>.
2. Elige tu sistema (Windows, macOS o Linux) y descarga la versión más reciente
   (≥ 4.2).
3. Instálalo con las opciones por defecto.

## 2. Instalar RStudio Desktop

1. Entra a <https://posit.co/download/rstudio-desktop/>.
2. Descarga e instala RStudio Desktop (gratuito).
3. Ábrelo: debe aparecer la **Consola** con la versión de R.

> Alternativa: VS Code con la extensión **R** (REditorSupport). En el curso se usa RStudio.

## 3. Descargar el material del curso

Descarga la carpeta del curso desde la plataforma (o clona el repositorio) y ábrela en
RStudio con **File → Open Project…** (o **File → Open Folder** si no hay `.Rproj`).
Para que las rutas relativas funcionen, la carpeta de trabajo debe ser la raíz del curso.

## 4. Instalar los paquetes

En la consola de RStudio, ejecuta:

```r
source("install.R")
```

Debes ver el mensaje **"✔ Todos los paquetes están instalados"**. Instala `tidyverse`,
`rmarkdown`, `knitr`, `car`, `nortest`, `pwr`, `broom`, `patchwork` y `MASS`.

## 5. Probar R Markdown

1. Abre [`pre-trabajo-1_plantilla.Rmd`](pre-trabajo-1_plantilla.Rmd).
2. Pulsa el botón **Knit**.
3. Debe abrirse un `.html` con una tabla de los primeros datos.

Si ves el `.html`, ¡listo! Ya puedes resolver el diagnóstico. Antes del pre-trabajo 1,
repasa el [tutorial de R](01-tutorial-r.md).

## Problemas frecuentes

| Síntoma | Solución |
|---|---|
| `there is no package called 'tidyverse'` | Ejecuta de nuevo `source("install.R")`; verifica conexión a internet |
| `cannot open file '../datos/...': No such file` | Abre el `.Rmd` desde su carpeta; no muevas el archivo fuera de `pre-trabajos/` |
| En Windows, error al instalar paquetes por permisos | Ejecuta RStudio una vez como administrador o acepta crear la librería personal |
| El botón Knit no aparece | El archivo debe tener extensión `.Rmd`; reinstala `rmarkdown` |
| Caracteres raros (Ã±, Ã©) | **File → Reopen with Encoding → UTF-8** |
