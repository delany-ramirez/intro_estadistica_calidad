# Pre-trabajo 2 — Pruebas para dos muestras y primera regresión

> **Peso:** 15 % · **Cierre:** miércoles anterior a la Sesión 2, 23:59
> **Entrega:** [`pre-trabajo-2_plantilla.Rmd`](pre-trabajo-2_plantilla.Rmd) + `.html` compilado

## 1. Lecturas dirigidas (formativo, ~2 h)

| Lectura | Qué buscar |
|---|---|
| [`../sesion-2-inferencia-regresion/teoria/01-pruebas-t-varianzas.md`](../sesion-2-inferencia-regresion/teoria/01-pruebas-t-varianzas.md) | Árbol de decisión; cuándo usar la pareada |
| [`../sesion-2-inferencia-regresion/teoria/02-potencia-tamano-muestra.md`](../sesion-2-inferencia-regresion/teoria/02-potencia-tamano-muestra.md) §1–3 | Los cuatro ingredientes de la potencia |
| [`../sesion-2-inferencia-regresion/teoria/04-correlacion-regresion.md`](../sesion-2-inferencia-regresion/teoria/04-correlacion-regresion.md) §1–3 | Correlación vs. causalidad; interpretación de $\hat\beta_1$ y $R^2$ |
| Montgomery y Runger, cap. 10 y 11 | Ejemplos resueltos |

## 2. Cuestionario (calificable, 40 %)

1. Para cada caso, indica qué prueba usarías y por qué: (i) peso de 20 bolsas antes y
   después de recalibrar **la misma** báscula, midiendo las mismas bolsas; (ii) tiempo de
   respuesta de dos centros de atención distintos; (iii) ¿la variabilidad del espesor del
   proveedor A es mayor que la del B?
2. ¿Por qué R usa la $t$ de Welch por defecto? ¿Qué se pierde y qué se gana?
3. Un estudio con 6 unidades por grupo no encontró diferencia significativa (p = 0.21).
   ¿Qué le dirías al gerente que concluye "los dos métodos son iguales"?
4. Explica la diferencia entre "correlación alta" y "una variable causa la otra" con un
   ejemplo de calidad.
5. ¿Qué significa un $R^2 = 0.86$ en palabras del proceso?

## 3. Ejercicio en R (calificable, 60 %)

Datos: [`datos/viscosidad-pintura.csv`](datos/viscosidad-pintura.csv). Un fabricante de
pintura midió la **viscosidad (cP)** de 15 muestras de cada uno de dos lotes (A y B). Las
muestras se midieron a la temperatura del laboratorio de ese momento, que varió entre 18
y 32 °C.

**a)** Compara la viscosidad media de los lotes A y B con la prueba $t$ adecuada
($\alpha = 0.05$). Reporta estadístico, gl, valor p e IC del 95 %.

**b)** Elabora un diagrama de dispersión de viscosidad vs. temperatura, coloreado por lote.
¿Qué observas?

**c)** Calcula la correlación entre temperatura y viscosidad y ajusta la regresión simple
`viscosidad_cp ~ temperatura_c`. Escribe la ecuación e interpreta la pendiente y $R^2$.

**d)** Predice la viscosidad media a 25 °C con su IC del 95 %.

**e)** *(reflexión)* La temperatura no se controló. ¿Cómo pudo afectar eso a la
comparación de la pregunta a)? ¿Qué harías distinto si repitieras el estudio? (Pista:
piensa en lo que hace un emparejamiento o un bloque.)

### Criterios de calificación del ejercicio

| Criterio | Puntos |
|---|---:|
| Prueba t correcta y reportada completa (a) | 25 |
| Gráfico e interpretación (b) | 15 |
| Correlación y regresión interpretadas (c) | 30 |
| Predicción con IC (d) | 10 |
| Reflexión sobre la variable no controlada (e) | 15 |
| Documento compila sin errores | 5 |
