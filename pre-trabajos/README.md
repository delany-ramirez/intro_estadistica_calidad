# Pre-trabajos (aprendizaje invertido)

El curso usa **aprendizaje invertido**: antes de cada sábado preparas los conceptos base,
para que las 6 horas presenciales se dediquen a resolver errores frecuentes y a trabajar
con datos en R.

> El Acuerdo 15 de 2026 registra 0 h de trabajo independiente para esta asignatura. El
> diagnóstico, las cápsulas, las lecturas y la instalación del software son **formativos
> y sin nota**; el **cuestionario** y el **ejercicio en R** de cada pre-trabajo **sí se
> califican**.

## Calendario

| Actividad | Cierre | Formativo (sin nota) | Calificable |
|-----------|--------|----------------------|-------------|
| Instalación de R | Antes del diagnóstico | [`00-instalacion-r.md`](00-instalacion-r.md) | — |
| Diagnóstico de entrada | Miércoles anterior a la Sesión 1, 23:59 | [`diagnostico-entrada.md`](diagnostico-entrada.md) | 0 % |
| **Pre-trabajo 1** | Miércoles anterior a la Sesión 1, 23:59 | Lecturas dirigidas | Cuestionario + ejercicio en R · **15 %** |
| **Pre-trabajo 2** | Miércoles anterior a la Sesión 2, 23:59 | Lecturas dirigidas | Cuestionario + ejercicio en R · **15 %** |

El cierre a mitad de semana permite al docente preparar la retroalimentación con la que
se abre cada sesión.

## Pre-trabajo 1 — Repaso descriptivo y distribuciones

- **Enunciado:** [`pre-trabajo-1.md`](pre-trabajo-1.md)
- **Plantilla de entrega:** [`pre-trabajo-1_plantilla.Rmd`](pre-trabajo-1_plantilla.Rmd)
- **Datos:** [`datos/diametro-pernos.csv`](datos/diametro-pernos.csv) — diámetro de 60
  pernos (nominal 10.00 ± 0.15 mm) en tres turnos. Variables: `perno`, `turno`
  (manana, tarde, noche), `diametro_mm`.

## Pre-trabajo 2 — Pruebas para dos muestras y primera regresión

- **Enunciado:** [`pre-trabajo-2.md`](pre-trabajo-2.md)
- **Plantilla de entrega:** [`pre-trabajo-2_plantilla.Rmd`](pre-trabajo-2_plantilla.Rmd)
- **Datos:** [`datos/viscosidad-pintura.csv`](datos/viscosidad-pintura.csv) — viscosidad
  de 30 muestras de pintura de dos lotes, medida a distintas temperaturas. Variables:
  `muestra`, `lote` (A, B), `temperatura_c`, `viscosidad_cp`.

## Entrega

Sube a la plataforma el `.Rmd` diligenciado **y** el `.html` compilado, con nombre
`apellido-nombre_pre-trabajo-N.Rmd`. Si el archivo no compila, envía igualmente el `.Rmd`
y describe el error: también es información útil para la sesión.
