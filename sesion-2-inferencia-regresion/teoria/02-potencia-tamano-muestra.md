# Potencia y tamaño de muestra

> **Objetivos.** Calcular la potencia de una prueba $t$ y el tamaño de muestra necesario
> para detectar una diferencia de importancia práctica, y usar la curva de potencia para
> justificar la planeación de un estudio o experimento. · **RAA3**

## 1. Por qué planear $n$

Un estudio con $n$ demasiado pequeño tiene **alto riesgo de error tipo II**: no detecta
cambios que sí importan, y su "no significativo" no dice nada. Un $n$ demasiado grande
desperdicia recursos y vuelve significativas diferencias triviales. El tamaño de muestra
se decide **antes** de recoger datos.

## 2. Los cuatro ingredientes

Fijados tres, se obtiene el cuarto:

1. **Nivel de significación** $\alpha$ (riesgo de falsa alarma).
2. **Diferencia mínima de importancia práctica** $\delta$, en unidades del proceso.
3. **Variabilidad** $\sigma$ (de datos históricos o un piloto).
4. **Tamaño de muestra** $n$ ↔ **potencia** $1-\beta$.

El **tamaño del efecto estandarizado** resume 2 y 3:

$$
d = \frac{\delta}{\sigma}.
$$

## 3. Aproximación para dos muestras (bilateral)

$$
n \approx \frac{2\,(z_{\alpha/2} + z_{\beta})^2\,\sigma^2}{\delta^2}
\quad\text{por grupo.}
$$

Consecuencias:

- Detectar la **mitad** de la diferencia exige **cuatro veces** más datos.
- Reducir $\sigma$ (mejor medición, bloqueo, emparejamiento) es tan eficaz como aumentar $n$.

## 4. En R

```r
# ¿Qué potencia tengo con 15 por grupo para detectar 2 s de diferencia si sigma = 3?
power.t.test(n = 15, delta = 2, sd = 3, sig.level = 0.05)

# ¿Cuántas por grupo necesito para potencia 0.90?
power.t.test(power = 0.90, delta = 2, sd = 3, sig.level = 0.05)

# Pareada o una muestra
power.t.test(power = 0.80, delta = 0.5, sd = 0.6, type = "paired")

# Con el tamaño del efecto d (paquete pwr)
pwr::pwr.t.test(d = 0.67, power = 0.80, sig.level = 0.05, type = "two.sample")
```

## 5. Curva de potencia

Grafica la potencia contra $\delta$ (para un $n$ dado) o contra $n$ (para un $\delta$
dado). Permite responder: *"con el presupuesto disponible, ¿qué diferencias puedo
detectar con confianza?"*.

> **Convención usual:** potencia ≥ 0.80; en decisiones críticas (seguridad, salud), ≥ 0.90.

## 6. Conexión con ASC22

En el diseño de experimentos la pregunta "¿cuántas réplicas?" se responde exactamente así,
con `power.anova.test()` o software especializado. Llegar a ASC22 con este razonamiento
claro es uno de los objetivos del nivelatorio.

---

### Para repasar

- Un estudio con $n = 8$ por grupo no encontró diferencia significativa. ¿Qué preguntarías
  antes de concluir que "no hay efecto"?
- Si $\sigma$ se reduce a la mitad, ¿qué pasa con el $n$ necesario?
- ¿Quién debe definir $\delta$: el estadístico o el dueño del proceso?

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 9–10.
- Cohen, J. _Statistical Power Analysis for the Behavioral Sciences_.
