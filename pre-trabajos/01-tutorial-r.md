# Tutorial de R para el curso

> **Formativo, sin nota.** Tiempo estimado: 2–3 h. Hazlo después de
> [instalar R](00-instalacion-r.md) y **antes** del pre-trabajo 1.
> Práctica ejecutable para seguir en clase: [`01-tutorial-r.Rmd`](01-tutorial-r.Rmd).

## Objetivos

Al terminar este tutorial podrás:

- Declarar variables y vectores, y reconocer los tipos de dato que usa el curso.
- Leer un `.csv` y explorar un *data frame* (tibble).
- Encadenar operaciones con el **pipe** `|>` y los verbos de `dplyr`: `filter`, `select`,
  `arrange`, `mutate`, `summarise`, `group_by` y `count`.
- Calcular conteos, proporciones, medias, medianas, desviaciones estándar y cuantiles,
  globales y **por grupo**.
- Construir gráficos con `ggplot2` (histograma, cajas, dispersión, barras, Q-Q) y
  combinarlos con `patchwork`.

Atiende de forma transversal a **RAA1** (describir la variabilidad con herramientas
gráficas y numéricas): todo lo que aquí se aprende se reutiliza en los notebooks de las
dos sesiones.

**Datos del tutorial:** [`datos/tapas-inyeccion.csv`](datos/tapas-inyeccion.csv) — peso de
90 tapas plásticas inyectadas (nominal 12.0 ± 0.5 g) en tres máquinas y dos turnos.

| Variable | Tipo | Descripción |
|---|---|---|
| `tapa` | entero | Identificador de la tapa (orden de producción) |
| `maquina` | texto | Inyectora: `M1`, `M2`, `M3` |
| `turno` | texto | `dia`, `noche` |
| `peso_g` | numérico | Peso de la tapa en gramos |
| `defecto` | texto | Defecto visual: `ninguno`, `rebaba`, `rechupe`, `mancha` |

---

## 1. Dónde se escribe el código

| Lugar | Para qué |
|---|---|
| **Consola** | Probar una línea. Lo que se escribe allí no queda guardado. |
| **Script** (`.R`) | Guardar código que se ejecuta de principio a fin. |
| **R Markdown** (`.Rmd`) | Texto + código + resultados en un solo documento. **Es el formato de entrega del curso.** |

Un `.Rmd` tiene tres partes:

1. **Encabezado YAML** entre `---`: título, autor, formato de salida.
2. **Texto** en Markdown: `# Título`, `**negrilla**`, listas con `-`.
3. **Bloques de código** (*chunks*) entre ```` ```{r} ```` y ```` ``` ````.

Atajos útiles en RStudio:

| Acción | Windows / Linux | macOS |
|---|---|---|
| Ejecutar la línea o selección | `Ctrl + Enter` | `Cmd + Enter` |
| Ejecutar el chunk completo | `Ctrl + Shift + Enter` | `Cmd + Shift + Enter` |
| Insertar un chunk nuevo | `Ctrl + Alt + I` | `Cmd + Option + I` |
| Escribir el pipe `\|>` | `Ctrl + Shift + M` | `Cmd + Shift + M` |
| Escribir la asignación `<-` | `Alt + -` | `Option + -` |
| Compilar (Knit) | `Ctrl + Shift + K` | `Cmd + Shift + K` |

> Para que `Ctrl + Shift + M` escriba `|>` (y no `%>%`), activa **Tools → Global Options →
> Code → Use native pipe operator**.

**Knit** ejecuta el `.Rmd` en una sesión **limpia**, de arriba abajo. Si un objeto solo
existe porque lo creaste en la consola, el Knit fallará: todo debe estar en los chunks.

## 2. Objetos y declaración de variables

En R se guarda un valor en un **objeto** con el operador de asignación `<-`:

```r
nominal <- 12        # número
tolerancia <- 0.5
LIE <- nominal - tolerancia   # 11.5
LSE <- nominal + tolerancia   # 12.5
proceso <- "inyección"        # texto (siempre entre comillas)
```

- El nombre va a la izquierda, el valor a la derecha. Escribir solo el nombre (`LIE`)
  muestra su contenido.
- R distingue mayúsculas: `LIE` y `lie` son objetos distintos.
- Los nombres no llevan espacios, tildes ni empiezan por número. En el curso usamos
  `snake_case`: `peso_g`, `media_turno`.
- `=` también asigna, pero se reserva para los argumentos de funciones: `mean(x, na.rm = TRUE)`.

### Tipos de dato

| Tipo | Ejemplo | Se usa para |
|---|---|---|
| `numeric` (`double`) | `12.05`, `-3` | Mediciones (peso, tiempo, diámetro) |
| `integer` | `5L`, `1:10` | Conteos, identificadores |
| `character` | `"M1"`, `"noche"` | Etiquetas de texto |
| `logical` | `TRUE`, `FALSE` | Resultado de una comparación |
| `factor` | `factor(c("bajo", "alto"))` | Variable categórica con niveles (útil para ordenar gráficos y en ANOVA) |

`class(x)` dice el tipo de un objeto. `NA` representa un dato faltante.

### Vectores

Un **vector** guarda varios valores del **mismo tipo**. Se crea con `c()` ("combinar"):

```r
pesos <- c(12.1, 11.9, 12.3, 11.8, 12.0)
length(pesos)    # 5
pesos[2]         # 11.9 — los índices empiezan en 1
pesos[pesos > 12]         # filtra: 12.1 12.3
pesos - nominal           # opera elemento a elemento
mean(pesos > LSE)         # proporción de TRUE = proporción fuera por arriba
```

Otras formas de crear vectores: `1:10`, `seq(0, 1, by = 0.1)`, `rep("M1", 3)`.

> **Truco que se usa todo el curso:** `TRUE` vale 1 y `FALSE` vale 0. Por eso
> `sum(condición)` **cuenta** cuántos cumplen y `mean(condición)` da la **proporción**.

### Operadores de comparación y lógicos

| Operador | Significado | Operador | Significado |
|---|---|---|---|
| `==` | igual | `!=` | distinto |
| `<`, `<=` | menor, menor o igual | `>`, `>=` | mayor, mayor o igual |
| `&` | y | `\|` | o |
| `!` | no | `%in%` | pertenece a: `maquina %in% c("M1", "M2")` |

### Funciones

Una función recibe **argumentos** entre paréntesis y devuelve un resultado:

```r
round(3.14159, digits = 2)   # 3.14
mean(c(1, 2, NA))            # NA: hay un faltante
mean(c(1, 2, NA), na.rm = TRUE)   # 1.5
```

`?mean` o `help(mean)` abren la ayuda. Al final de la ayuda siempre hay ejemplos.

## 3. Paquetes

Un paquete agrega funciones a R. Se **instala una vez** y se **carga en cada documento**:

```r
install.packages("tidyverse")   # una sola vez (ya lo hizo install.R)
library(tidyverse)              # al inicio de cada .Rmd
```

`tidyverse` carga, entre otros, `readr` (leer datos), `dplyr` (manipular), `tidyr`
(reorganizar) y `ggplot2` (graficar). `knitr::kable()` da formato a las tablas.

Si dos paquetes tienen funciones con el mismo nombre (por ejemplo `select` en `dplyr` y en
`MASS`), se puede indicar cuál usar con `paquete::funcion()`: `dplyr::select(...)`.

## 4. Data frames y lectura de datos

Un **data frame** es una tabla: cada **columna** es una variable (un vector) y cada
**fila** una observación. `read_csv()` lo lee como *tibble*, una versión moderna del
data frame.

```r
tapas <- read_csv("datos/tapas-inyeccion.csv")
```

La ruta es **relativa** a la carpeta donde está el `.Rmd`. En los notebooks de las
sesiones se usa `"../datos/archivo.csv"`: `..` significa "subir una carpeta".

| Función | Qué muestra |
|---|---|
| `glimpse(tapas)` | Columnas, tipo y primeros valores |
| `head(tapas, 10)` | Primeras 10 filas |
| `nrow(tapas)`, `ncol(tapas)` | Número de filas y de columnas |
| `names(tapas)` | Nombres de las columnas |
| `summary(tapas)` | Resumen rápido de cada columna |
| `tapas$peso_g` | Extrae **una columna** como vector |

Con `$` se usan las funciones de vectores directamente: `mean(tapas$peso_g)`.

## 5. El pipe `|>`

El pipe toma lo que está a su izquierda y lo pasa como **primer argumento** de la
función de la derecha. Se lee "**y luego**":

```r
# Sin pipe: se lee de adentro hacia afuera
round(mean(tapas$peso_g), 2)

# Con pipe: se lee de izquierda a derecha, paso a paso
tapas$peso_g |> mean() |> round(2)
```

Su poder aparece al encadenar varios pasos sobre una tabla:

```r
tapas |>                          # toma los datos, y luego
  filter(maquina == "M3") |>      # quédate con la máquina M3, y luego
  summarise(media = mean(peso_g)) # calcula la media del peso
```

> `%>%` (del paquete `magrittr`) hace lo mismo y lo verás en libros y foros. En el curso
> usamos el pipe nativo `|>`.

## 6. Los verbos de `dplyr`

Cada verbo recibe una tabla y devuelve **otra tabla**; por eso se pueden encadenar.
Dentro de los verbos las columnas se nombran **sin comillas y sin `$`**.

| Verbo | Qué hace | Ejemplo |
|---|---|---|
| `filter()` | Conserva **filas** que cumplen una condición | `filter(turno == "noche", peso_g > 12)` |
| `select()` | Conserva o quita **columnas** | `select(maquina, peso_g)`; `select(-tapa)` |
| `arrange()` | Ordena filas | `arrange(desc(peso_g))` |
| `mutate()` | Crea o modifica columnas | `mutate(desvio = peso_g - 12)` |
| `summarise()` | Resume muchas filas en una | `summarise(media = mean(peso_g))` |
| `group_by()` | Hace que lo siguiente se calcule **por grupo** | `group_by(maquina)` |
| `count()` | Cuenta filas por categoría | `count(maquina, defecto)` |

### 6.1 `mutate`: crear variables

```r
tapas <- tapas |>
  mutate(
    desvio_g    = peso_g - nominal,
    z           = (peso_g - mean(peso_g)) / sd(peso_g),
    conforme    = peso_g >= LIE & peso_g <= LSE,           # lógico
    defectuosa  = defecto != "ninguno",
    clase_peso  = case_when(
      peso_g < LIE ~ "bajo",
      peso_g > LSE ~ "alto",
      .default = "ok"
    ),
    maquina     = factor(maquina)
  )
```

- `if_else(condición, valor_si, valor_no)` para dos casos; `case_when()` para varios.
- Para que el cambio quede guardado hay que **reasignar** (`tapas <- tapas |> mutate(...)`).
  Sin la asignación, R solo muestra el resultado.

### 6.2 Conteos y proporciones

```r
tapas |> count(maquina)                 # n por máquina
tapas |> count(maquina, defecto)        # tabla cruzada en formato largo
tapas |> count(defecto, sort = TRUE)    # ordenado de mayor a menor (Pareto)

tapas |>
  count(maquina, defectuosa) |>
  group_by(maquina) |>
  mutate(prop = n / sum(n))             # proporción dentro de cada máquina
```

`table(tapas$maquina, tapas$defecto)` hace lo mismo en R base, como tabla de doble entrada.

### 6.3 Resúmenes numéricos

| Función | Estadístico | Notación |
|---|---|---|
| `n()` | Tamaño de muestra (solo dentro de `summarise`) | $n$ |
| `mean(x)` | Media | $\bar{y}$ |
| `median(x)` | Mediana | $\tilde{y}$ |
| `sd(x)` | Desviación estándar muestral | $s$ |
| `var(x)` | Varianza muestral | $s^2$ |
| `IQR(x)` | Rango intercuartílico | $Q_3 - Q_1$ |
| `quantile(x, 0.25)` | Cuantil | $Q_1$ |
| `min(x)`, `max(x)` | Extremos | |
| `sum(cond)`, `mean(cond)` | Conteo / proporción que cumple | |

`sd()` y `var()` dividen entre $n - 1$:

$$
s = \sqrt{\frac{1}{n-1}\sum_{i=1}^{n} (y_i - \bar{y})^2}
$$

Si hay faltantes, todas devuelven `NA` salvo que se agregue `na.rm = TRUE`.

```r
tapas |>
  summarise(n = n(), media = mean(peso_g), s = sd(peso_g),
            mediana = median(peso_g), RIC = IQR(peso_g),
            fuera = sum(!conforme))
```

### 6.4 Agrupar: `group_by` + `summarise`

Es el patrón más usado del curso (estratificar):

```r
resumen <- tapas |>
  group_by(maquina) |>
  summarise(n = n(), media = mean(peso_g), s = sd(peso_g),
            CV_pct = 100 * s / media,
            pct_defectuosas = 100 * mean(defectuosa))
```

- Se puede agrupar por varias variables: `group_by(maquina, turno)`. El resultado queda
  agrupado por la primera; agrega `.groups = "drop"` dentro de `summarise()` para
  desagrupar.
- `group_by` + `mutate` (en vez de `summarise`) calcula por grupo **sin colapsar filas**:
  útil para el $z$ de cada pieza respecto a su propia máquina.
- `across()` aplica la misma función a varias columnas:
  `summarise(across(c(peso_g, z), mean))`.

### 6.5 Formato largo y ancho

`ggplot2` y `dplyr` trabajan mejor con datos **largos** (una fila por medición). Si una
tabla tiene una columna por grupo (formato **ancho**), `pivot_longer()` la convierte:

```r
ancho <- tibble(pieza = 1:3, operario_A = c(5.1, 5.3, 5.0), operario_B = c(5.2, 5.4, 5.1))
largo <- ancho |>
  pivot_longer(cols = c(operario_A, operario_B),
               names_to = "operario", values_to = "medida")
```

`pivot_wider()` hace lo contrario (útil para mostrar una tabla cruzada).

## 7. Gráficos con `ggplot2`

`ggplot2` construye gráficos por **capas** siguiendo una *gramática de gráficos*. Todo
gráfico tiene, como mínimo, tres componentes:

1. **Datos**: el data frame.
2. **Estética** (`aes`): qué variable va en cada eje y cuál define color, relleno o forma.
3. **Geometría** (`geom_*`): cómo se dibujan los datos (barras, puntos, cajas…).

```r
ggplot(data = tapas, aes(x = maquina, y = peso_g)) +   # datos + estética
  geom_boxplot() +                                    # geometría
  labs(title = "Peso por máquina", x = "Máquina", y = "Peso (g)")
```

> Las capas de ggplot se unen con **`+`**, no con `|>`. El pipe se usa *antes* de
> `ggplot()` para preparar los datos: `tapas |> filter(turno == "dia") |> ggplot(aes(...)) + ...`

### 7.1 Capas disponibles

| Capa | Para qué | Ejemplos |
|---|---|---|
| `geom_*` | Dibujar datos | `geom_histogram`, `geom_boxplot`, `geom_point`, `geom_col` |
| `stat_*` | Dibujar un cálculo | `stat_ecdf`, `stat_summary` |
| `labs()` | Títulos y nombres de ejes | `labs(title = , x = , y = , fill = )` |
| `facet_wrap()` | Un panel por grupo | `facet_wrap(~ turno)` |
| `scale_*` | Ajustar ejes o colores | `scale_y_continuous(limits = c(11, 13))` |
| `theme_*` | Apariencia general | `theme_minimal()`, `theme_set(theme_minimal())` |

### 7.2 Dentro o fuera de `aes()`

- **Dentro** de `aes()` se ponen **variables** que cambian el aspecto según los datos:
  `aes(fill = maquina)` → un color por máquina, con leyenda.
- **Fuera** se ponen **valores fijos**: `geom_histogram(fill = "steelblue")` → todo azul.
- `colour` colorea líneas y puntos; `fill` rellena áreas (barras, cajas, densidades).

### 7.3 Gráficos que se usan en el curso

| Pregunta | Gráfico | Código mínimo |
|---|---|---|
| ¿Cómo se distribuye una variable? | Histograma | `ggplot(d, aes(x)) + geom_histogram(binwidth = )` |
| ¿Difieren los grupos? | Cajas (+ puntos) | `ggplot(d, aes(grupo, y)) + geom_boxplot() + geom_jitter(width = 0.1)` |
| Forma de la distribución por grupo | Densidad / violín | `geom_density(alpha = 0.5)`, `geom_violin()` |
| ¿Es normal? | Q-Q | `ggplot(d, aes(sample = y)) + geom_qq() + geom_qq_line()` |
| ¿Se relacionan dos variables? | Dispersión + recta | `ggplot(d, aes(x, y)) + geom_point() + geom_smooth(method = "lm")` |
| ¿Cambia en el tiempo? | Serie | `ggplot(d, aes(orden, y)) + geom_line() + geom_point()` |
| ¿Cuántos hay por categoría? | Barras | `geom_bar()` (cuenta sola) o `geom_col()` (alturas ya calculadas) |

### 7.4 Líneas de referencia

En calidad casi siempre se dibujan los **límites de especificación** o el valor nominal:

```r
ggplot(tapas, aes(peso_g)) +
  geom_histogram(binwidth = 0.1, fill = "steelblue", colour = "white") +
  geom_vline(xintercept = c(LIE, nominal, LSE), linetype = c(2, 1, 2))
```

`geom_vline()` dibuja líneas verticales; `geom_hline(yintercept = )`, horizontales.

### 7.5 Combinar gráficos

Con `patchwork`, los gráficos guardados en objetos se combinan con `+` (lado a lado) y
`/` (uno encima de otro):

```r
library(patchwork)
g1 <- ggplot(tapas, aes(peso_g)) + geom_histogram(binwidth = 0.1)
g2 <- ggplot(tapas, aes(sample = peso_g)) + geom_qq() + geom_qq_line()
g1 + g2
```

## 8. Reportar resultados en R Markdown

- `kable(tabla, digits = 2)` da formato a una tabla de resultados.
- Una cifra en el texto se escribe con **código en línea**: `` `r round(mean(tapas$peso_g), 2)` ``.
  Así, si los datos cambian, el texto se actualiza solo. **Toda cifra del informe debe
  salir de R**, nunca copiarse a mano.
- Opciones de chunk frecuentes: `echo = FALSE` (oculta el código), `fig.height = 6`
  (alto de la figura), `message = FALSE` (oculta mensajes de carga).

## 9. Errores frecuentes

| Mensaje | Causa probable | Solución |
|---|---|---|
| `object 'peso' not found` | Nombre mal escrito o el objeto no se ha creado | Revisa `names(datos)`; ejecuta los chunks anteriores |
| `could not find function "read_csv"` | No se cargó el paquete | `library(tidyverse)` al inicio |
| `'...' does not exist in current working directory` | Ruta del `.csv` incorrecta | Abre el `.Rmd` desde su carpeta; revisa `..` |
| `unexpected symbol` / `unexpected ')'` | Falta una coma, comilla o paréntesis | Revisa la línea indicada y la anterior |
| Resultado `NA` | Hay faltantes | `na.rm = TRUE` |
| `=` en vez de `==` en `filter` | `filter(maquina = "M1")` | Comparar es `==` |
| Gráfico vacío o error `+` | El `+` quedó al inicio de la línea siguiente | El `+` va **al final** de la línea |
| Funciona en la consola pero no al compilar | Algo se creó fuera del `.Rmd` | Reinicia R (**Session → Restart R**) y ejecuta todo desde arriba |

## 10. Resumen

```r
library(tidyverse)
datos <- read_csv("datos/archivo.csv")      # leer
glimpse(datos)                              # explorar

datos |>                                    # resumir por grupo
  group_by(grupo) |>
  summarise(n = n(), media = mean(y), s = sd(y))

datos |> count(grupo, categoria)            # contar

ggplot(datos, aes(grupo, y, fill = grupo)) +   # graficar
  geom_boxplot() +
  labs(x = "Grupo", y = "Respuesta (unidad)")
```

### Para profundizar 🔵

- Wickham, Çetinkaya-Rundel y Grolemund, *R for Data Science* (2.ª ed.), caps. 1–4:
  <https://r4ds.hadley.nz/> (versión en español de la 1.ª ed.: <https://es.r4ds.hadley.nz/>).
- Hojas de referencia de `dplyr` y `ggplot2`: <https://posit.co/resources/cheatsheets/>.
- Resumen de funciones estadísticas del curso: [`../recursos/cheatsheet-estadistica-r.md`](../recursos/cheatsheet-estadistica-r.md).
