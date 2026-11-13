# Instalación de R y RStudio

> Tiempo estimado: 20–30 min. Hazlo **antes** del diagnóstico de entrada. Si algo falla,
> escribe al foro de la plataforma con una captura del error.

Hay dos formas de trabajar en el curso. Elige **una**:

| | **Opción A — Instalar en tu equipo** | **Opción B — Posit Cloud (en el navegador)** |
|---|---|---|
| Requisitos | Permisos para instalar programas; ~3 GB libres | Solo navegador e internet; cuenta gratuita |
| Ventajas | Sin límites de uso; funciona sin internet | No instalas nada; sirve en equipos de la empresa o compartidos |
| Desventajas | La instalación puede fallar por permisos | El plan gratuito tiene un límite mensual de horas de cómputo; necesitas conexión |
| Secciones | [1 a 5](#opción-a--instalar-en-tu-equipo) | [6](#opción-b--posit-cloud-sin-instalar-nada) |

Los `.Rmd`, los datos y las entregas son **idénticos** en ambas opciones.

# Opción A — Instalar en tu equipo

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

# Opción B — Posit Cloud (sin instalar nada)

[Posit Cloud](https://posit.cloud/) ofrece RStudio en el navegador. La pantalla es la
misma de RStudio Desktop, así que el resto del curso se sigue igual.

## 6.1 Crear la cuenta

1. Entra a <https://posit.cloud/> y pulsa **Sign Up**.
2. Elige el plan **Free** y regístrate con tu correo institucional o con Google.
3. Al entrar verás tu espacio de trabajo (**Your Workspace**).

## 6.2 Crear el proyecto del curso

1. Pulsa **New Project → New RStudio Project**. Se abre RStudio en el navegador (tarda
   unos segundos la primera vez).
2. Arriba, haz clic en **Untitled Project** y ponle un nombre, por ejemplo `AS001`.

> Crea **un solo proyecto** para todo el curso. Cada proyecto es independiente: los
> paquetes y archivos de uno no están disponibles en otro.

## 6.3 Subir el material del curso

1. Descarga desde la plataforma la carpeta del curso comprimida en `.zip`.
2. En RStudio, panel **Files** (abajo a la derecha), pulsa **Upload → Choose File**,
   elige el `.zip` y pulsa **OK**. RStudio lo descomprime automáticamente.
3. Verifica que en **Files** aparezcan `install.R` y la carpeta `pre-trabajos/`. Si
   quedaron dentro de una subcarpeta (por ejemplo `intro_estadistica_calidad/`), entra a
   ella y usa **More → Set As Working Directory**.

> Para subir un archivo suelto (por ejemplo, una plantilla nueva), usa el mismo botón
> **Upload** estando dentro de la carpeta de destino.

## 6.4 Instalar los paquetes

Igual que en la opción A, en la **Console** ejecuta:

```r
source("install.R")
```

En la nube la instalación tarda más (5–15 min). Se hace **una sola vez por proyecto**:
la próxima vez que abras el proyecto, los paquetes seguirán instalados.

## 6.5 Compilar y descargar la entrega

1. Abre `pre-trabajos/pre-trabajo-1_plantilla.Rmd` y pulsa **Knit**. Si RStudio pide
   instalar paquetes adicionales, acepta.
2. El `.html` se abre en una pestaña nueva. Si el navegador lo bloquea, permite las
   ventanas emergentes de `posit.cloud`.
3. Para **descargar** el `.Rmd` y el `.html` que vas a entregar: en **Files**, marca la
   casilla de los archivos, pulsa **More → Export…** y luego **Download**. Si marcas
   varios, se descargan en un `.zip`.

## 6.6 Cuidar las horas de cómputo

- El plan gratuito tiene un **límite mensual de horas de cómputo**; consulta el valor
  vigente en <https://posit.cloud/plans>. Con 1 GB de RAM (el valor por defecto) es
  suficiente para todo el curso.
- El tiempo cuenta mientras el proyecto está abierto. Al terminar, **cierra la pestaña**
  o vuelve a **Your Workspace**; el proyecto se suspende solo tras unos minutos sin uso.
- Si se agotan las horas no podrás abrir el proyecto hasta el mes siguiente, ni siquiera
  para descargar tus archivos. **Descarga tu trabajo al final de cada sesión.**
- Revisa cuántas horas llevas en la sección **Usage** de tu cuenta de Posit Cloud.

## Problemas frecuentes

| Síntoma | Solución |
|---|---|
| `there is no package called 'tidyverse'` | Ejecuta de nuevo `source("install.R")`; verifica conexión a internet |
| `cannot open file '../datos/...': No such file` | Abre el `.Rmd` desde su carpeta; no muevas el archivo fuera de `pre-trabajos/` |
| En Windows, error al instalar paquetes por permisos | Ejecuta RStudio una vez como administrador o acepta crear la librería personal |
| El botón Knit no aparece | El archivo debe tener extensión `.Rmd`; reinstala `rmarkdown` |
| Caracteres raros (Ã±, Ã©) | **File → Reopen with Encoding → UTF-8** |
| *(Posit Cloud)* `cannot open file 'install.R'` | El `.zip` quedó en una subcarpeta: entra a ella en **Files** y usa **More → Set As Working Directory** |
| *(Posit Cloud)* El `.html` no se abre tras el Knit | Permite ventanas emergentes de `posit.cloud`, o ábrelo desde **Files → View in Web Browser** |
| *(Posit Cloud)* "Your project is out of compute hours" | Agotaste las horas del mes: espera al siguiente mes o termina en tu equipo con la opción A |
