# =============================================================================
# Generador de los datasets simulados del curso AS001 — Análisis Estadístico
# -----------------------------------------------------------------------------
# Ejecutar desde la raíz del repositorio:
#     Rscript docente/scripts/generar-datos.R
# Cada dataset usa su propia semilla, de modo que regenerar uno no altera los
# demás. Todos los datos son SIMULADOS con parámetros realistas de procesos de
# manufactura y servicios; no corresponden a ninguna empresa real.
# =============================================================================

guardar <- function(df, ruta) {
  dir.create(dirname(ruta), recursive = TRUE, showWarnings = FALSE)
  write.csv(df, ruta, row.names = FALSE)
  message(sprintf("  %-60s %4d filas", ruta, nrow(df)))
}

message("Generando datasets...")

# -----------------------------------------------------------------------------
# PRE-TRABAJOS
# -----------------------------------------------------------------------------

# PT1 · Diámetro de pernos (mm). Nominal 10.00 mm, tolerancia ±0.15 mm.
set.seed(101)
pernos <- data.frame(
  perno = 1:60,
  turno = rep(c("manana", "tarde", "noche"), each = 20),
  diametro_mm = round(c(rnorm(20, 10.01, 0.035),
                        rnorm(20, 10.00, 0.040),
                        rnorm(20, 10.03, 0.050)), 3)
)
guardar(pernos, "pre-trabajos/datos/diametro-pernos.csv")

# PT2 · Viscosidad de pintura (cP) vs. temperatura de aplicación (°C), dos lotes.
set.seed(102)
n <- 15
temp <- round(runif(2 * n, 18, 32), 1)
lote <- rep(c("A", "B"), each = n)
visc <- 1450 - 22 * temp + ifelse(lote == "B", 35, 0) + rnorm(2 * n, 0, 18)
guardar(data.frame(muestra = 1:(2 * n), lote = lote, temperatura_c = temp,
                   viscosidad_cp = round(visc, 0)),
        "pre-trabajos/datos/viscosidad-pintura.csv")

# -----------------------------------------------------------------------------
# SESIÓN 1
# -----------------------------------------------------------------------------

# S1 · Llenado de envases (mL): caso bimodal por boquilla. Nominal 500 mL.
set.seed(201)
n <- 60
llenado <- data.frame(
  orden = 1:(2 * n),
  turno = rep(rep(c("manana", "tarde"), each = n / 2), 2),
  boquilla = rep(c("B1", "B2"), times = n)
)
llenado$volumen_ml <- round(ifelse(llenado$boquilla == "B1",
                                   rnorm(2 * n, 501.6, 0.9),
                                   rnorm(2 * n, 498.1, 1.0)), 1)
guardar(llenado, "sesion-1-variabilidad-inferencia/datos/llenado-envases.csv")

# S1 · Tiempo de atención en un centro de servicio (min): asimétrico a la derecha.
set.seed(202)
canal <- sample(c("presencial", "telefonico"), 200, replace = TRUE, prob = c(.55, .45))
tiempo <- ifelse(canal == "presencial",
                 rgamma(200, shape = 2.2, rate = 2.2 / 9.5),
                 rgamma(200, shape = 1.6, rate = 1.6 / 6.0))
guardar(data.frame(caso = 1:200, canal = canal, tiempo_min = round(tiempo, 2)),
        "sesion-1-variabilidad-inferencia/datos/tiempo-atencion.csv")

# S1 · Espesor de recubrimiento (µm). Objetivo 50 µm; se exige sigma <= 2.5 µm.
set.seed(203)
guardar(data.frame(pieza = 1:25, espesor_um = round(rnorm(25, 51.2, 2.0), 1)),
        "sesion-1-variabilidad-inferencia/datos/espesor-recubrimiento.csv")

# S1 · Humedad de café pergamino seco (%). Norma: máximo 12 %; meta del beneficio 11 %.
set.seed(204)
guardar(data.frame(lote = 1:20, humedad_pct = round(rnorm(20, 11.40, 0.42), 2)),
        "sesion-1-variabilidad-inferencia/datos/humedad-cafe.csv")

# S1 · Taller integrador 1: peso de tabletas (mg), dos tableteadoras. Nominal 250 mg.
set.seed(205)
tab <- data.frame(
  tableteadora = rep(c("T1", "T2"), each = 40),
  lote = rep(rep(1:4, each = 10), 2),
  peso_mg = round(c(rnorm(40, 250.4, 2.1), rnorm(40, 251.8, 3.4)), 1)
)
tab$peso_mg[c(17, 63)] <- c(241.2, 263.5)   # dos atípicos plantados
guardar(tab, "sesion-1-variabilidad-inferencia/datos/peso-tabletas.csv")

# S1 · Ejercicio 01: resistencia a la tracción de hilo (cN) de tres proveedores.
set.seed(206)
hilo <- data.frame(
  proveedor = rep(c("Alfa", "Beta", "Gama"), c(25, 25, 25)),
  resistencia_cn = round(c(rnorm(25, 412, 9), rnorm(25, 405, 18), rnorm(25, 418, 8)), 0)
)
hilo$resistencia_cn[c(8, 61)] <- c(371, 452)   # atípicos plantados
guardar(hilo, "sesion-1-variabilidad-inferencia/datos/resistencia-hilo.csv")

# S1 · Ejercicio 02: peso neto de bolsas de azúcar (g). Etiqueta 1000 g; LIE 990 g.
set.seed(207)
guardar(data.frame(bolsa = 1:50, peso_g = round(rnorm(50, 1003.5, 5.2), 1)),
        "sesion-1-variabilidad-inferencia/datos/peso-bolsas-azucar.csv")

# S1 · Ejercicio 03: contenido de grasa de leche entera (%). Rotulado 3.0 %.
set.seed(208)
guardar(data.frame(muestra = 1:16, grasa_pct = round(rnorm(16, 2.94, 0.09), 2)),
        "sesion-1-variabilidad-inferencia/datos/grasa-leche.csv")

# -----------------------------------------------------------------------------
# SESIÓN 2
# -----------------------------------------------------------------------------

# S2 · Tiempo de ciclo (s) en dos líneas de ensamble: varianzas distintas.
set.seed(301)
guardar(data.frame(
  linea = c(rep("A", 15), rep("B", 18)),
  tiempo_ciclo_s = round(c(rnorm(15, 42.0, 1.9), rnorm(18, 45.0, 4.6)), 1)),
  "sesion-2-inferencia-regresion/datos/tiempo-ciclo-lineas.csv")

# S2 · Dureza Rockwell medida con dos durómetros sobre las mismas probetas (pareado).
set.seed(302)
base <- rnorm(12, 58, 4)
guardar(data.frame(
  probeta = 1:12,
  durometro_1 = round(base + rnorm(12, 0, 0.35), 1),
  durometro_2 = round(base + 0.7 + rnorm(12, 0, 0.35), 1)),
  "sesion-2-inferencia-regresion/datos/dureza-durometros.csv")

# S2 · Rugosidad Ra (µm) de láminas de tres proveedores (puente a ANOVA).
set.seed(303)
guardar(data.frame(
  proveedor = rep(c("P1", "P2", "P3"), each = 8),
  rugosidad_um = round(c(rnorm(8, 1.20, 0.10), rnorm(8, 1.32, 0.10),
                         rnorm(8, 1.18, 0.10)), 3)),
  "sesion-2-inferencia-regresion/datos/rugosidad-proveedores.csv")

# S2 · Curado de adhesivo: resistencia al corte (MPa) vs. temperatura, tiempo, humedad.
set.seed(304)
n <- 30
temp <- round(runif(n, 60, 100))
tiempo <- round(runif(n, 10, 40))
hum <- round(runif(n, 30, 70))
res <- 2.0 + 0.055 * temp + 0.045 * tiempo - 0.004 * hum + rnorm(n, 0, 0.35)
guardar(data.frame(probeta = 1:n, temperatura_c = temp, tiempo_min = tiempo,
                   humedad_pct = hum, resistencia_mpa = round(res, 2)),
        "sesion-2-inferencia-regresion/datos/curado-adhesivo.csv")

# S2 · Consumo de energía (kWh) vs. producción diaria (t): error multiplicativo
# (heterocedasticidad) y un día con error de digitación (punto influyente).
set.seed(305)
n <- 40
prod <- round(runif(n, 20, 120), 1)
cons <- round(exp(log(55) + 0.85 * log(prod) + rnorm(n, 0, 0.12)), 0)
cons[n] <- round(cons[n] * 1.9)  # registro erróneo
prod[n] <- 118.0
guardar(data.frame(dia = 1:n, produccion_t = prod, consumo_kwh = cons),
        "sesion-2-inferencia-regresion/datos/consumo-energia.csv")

# S2 · Ejercicio 01: resistencia a la compresión (kgf) de cajas de dos proveedores.
set.seed(306)
guardar(data.frame(
  proveedor = rep(c("Norte", "Sur"), c(14, 14)),
  resistencia_kgf = round(c(rnorm(14, 312, 11), rnorm(14, 301, 12)), 0)),
  "sesion-2-inferencia-regresion/datos/resistencia-cajas.csv")

# S2 · Ejercicio 01: temperatura de 10 hornos medida con sensor nuevo y con patrón.
set.seed(307)
real <- runif(10, 180, 240)
guardar(data.frame(
  horno = 1:10,
  patron_c = round(real + rnorm(10, 0, 0.4), 1),
  sensor_c = round(real + 1.1 + rnorm(10, 0, 0.9), 1)),
  "sesion-2-inferencia-regresion/datos/temperatura-hornos.csv")

# S2 · Ejercicio 03: pérdida de peso (%) en la tostión de café.
set.seed(308)
n <- 24
t_min <- round(runif(n, 10, 18), 1)
temp <- round(runif(n, 200, 230))
perdida <- -4.5 + 0.85 * t_min + 0.055 * temp + rnorm(n, 0, 0.45)
guardar(data.frame(bache = 1:n, tiempo_min = t_min, temperatura_c = temp,
                   perdida_peso_pct = round(perdida, 2)),
        "sesion-2-inferencia-regresion/datos/tostion-cafe.csv")

# S2 · Ejercicio 04: tiempo de entrega (min) vs. cajas y distancia (m); una ruta atípica.
set.seed(310)
n <- 25
cajas <- round(runif(n, 2, 30))
dist <- round(runif(n, 50, 1200))
tiempo <- 3 + 1.6 * cajas + 0.012 * dist + rnorm(n, 0, 2.2)
cajas[9] <- 30; dist[9] <- 1450; tiempo[9] <- 3 + 1.6 * 30 + 0.012 * 1450 + 14
guardar(data.frame(entrega = 1:n, cajas = cajas, distancia_m = dist,
                   tiempo_min = round(tiempo, 1)),
        "sesion-2-inferencia-regresion/datos/tiempo-entrega.csv")

# -----------------------------------------------------------------------------
# DOCENTE · Evaluación individual (dos versiones con parámetros distintos)
# -----------------------------------------------------------------------------
gen_eval <- function(semilla, delta_maq, b_temp, b_pres) {
  set.seed(semilla)
  n <- 20
  maquina <- rep(c("M1", "M2"), each = n)
  temp <- round(runif(2 * n, 40, 70), 1)
  pres <- round(runif(2 * n, 80, 120), 0)
  peso <- (28 - b_temp * 55 - b_pres * 100 - delta_maq / 2) + b_temp * temp + b_pres * pres + ifelse(maquina == "M2", delta_maq, 0) +
    rnorm(2 * n, 0, 0.25)
  data.frame(pieza = 1:(2 * n), maquina = maquina, temperatura_molde_c = temp,
             presion_bar = pres, peso_g = round(peso, 2))
}
guardar(gen_eval(401, 0.30, 0.020, 0.015), "docente/evaluacion/datos/inyeccion-version-A.csv")
guardar(gen_eval(402, 0.20, 0.028, 0.010), "docente/evaluacion/datos/inyeccion-version-B.csv")

message("Listo.")
