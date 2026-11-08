# Datos y variabilidad

> **Objetivos.** Distinguir de dónde proviene la variabilidad de una característica de
> calidad y cómo la forma de recoger los datos determina qué conclusiones son válidas.
> Introducir el vocabulario que retoma **Diseño y Desarrollo de Experimentos (ASC22)**:
> factor, respuesta y error experimental. · **RAA1**

## 1. Toda característica de calidad varía

Dos envases llenados por la misma máquina, en el mismo minuto, no contienen exactamente
el mismo volumen. La **variabilidad** es inevitable; el trabajo de la gestión de la
calidad es **entenderla, separarla en sus fuentes y reducir la que sea evitable**.

Shewhart y Deming distinguen dos tipos de causas:

| Tipo de causa | También llamada | Características | Acción |
|---|---|---|---|
| **Común** | aleatoria, del sistema | Muchas fuentes pequeñas; patrón estable y predecible | Cambiar el sistema (rediseño, DOE) |
| **Asignable** | especial | Una fuente identificable (boquilla, turno, lote, operario) | Encontrarla y eliminarla |

> Un proceso con solo causas comunes está **en control estadístico**: su variabilidad se
> puede modelar con una distribución de probabilidad (documento 03).

## 2. Unidad experimental y unidad de medición

- **Unidad experimental (UE):** la entidad mínima a la que se aplica, de forma
  independiente, una condición o tratamiento (un lote, una probeta, un cliente atendido).
- **Unidad de medición (UM):** aquello sobre lo que se toma la lectura. Puede coincidir
  con la UE o ser una parte de ella (tres puntos de espesor sobre una misma pieza).

Confundir ambas es uno de los errores más costosos en el análisis: se cuentan como
independientes lecturas que no lo son, y se **subestima la variabilidad real**.

## 3. Réplica frente a repetición

| | **Réplica** | **Repetición (medición repetida)** |
|---|---|---|
| Qué es | Aplicar de nuevo la condición a **otra UE** | Medir otra vez **la misma UE** |
| Qué variabilidad captura | La del proceso (entre unidades) + la de medición | Solo la del sistema de medición |
| Sirve para estimar | El **error experimental** $\sigma^2$ | La repetibilidad del instrumento |

> ⚠️ Medir 5 veces el mismo envase **no** son 5 réplicas: es una réplica medida 5 veces.

## 4. Aleatorización

**Aleatorizar** es asignar al azar el orden de las corridas o la asignación de las
unidades a las condiciones. Protege contra fuentes de variación desconocidas que cambian
en el tiempo (desgaste, temperatura ambiente, fatiga) y justifica tratar los errores como
**independientes**, supuesto de casi todas las pruebas de este curso.

## 5. Estratificación

**Estratificar** es separar los datos según una variable que puede ser una causa
asignable (máquina, turno, proveedor, canal de atención) y comparar los grupos. Es la
herramienta descriptiva más simple y poderosa para encontrar causas asignables.

### Caso: un histograma con dos jorobas

Una envasadora con **dos boquillas** (B1 y B2) llena botellas de 500 mL. El histograma
de los 120 volúmenes muestra **dos picos** (distribución **bimodal**): la mezcla de dos
poblaciones con medias distintas.

$$
f(y) = p\,f_{B1}(y) + (1-p)\,f_{B2}(y)
$$

- Sin estratificar, la desviación estándar global **sobrestima** la variabilidad de cada
  boquilla y una prueba de normalidad rechaza (documento 03).
- Al estratificar por boquilla, cada grupo es aproximadamente normal y aparece la causa
  asignable: **B1 sobrellena y B2 subllena**. La acción es calibrar, no comprar otra
  máquina.

> **Lección.** Antes de modelar, pregunta: ¿estos datos provienen de **una** población o
> de una mezcla? La bimodalidad casi siempre delata una causa asignable.

## 6. Puente al diseño de experimentos (ASC22)

| Término | En este curso | En ASC22 |
|---|---|---|
| **Respuesta** $y$ | Característica de calidad medida (volumen, espesor) | Variable que el experimento busca explicar |
| **Factor** | Variable de estratificación (boquilla, turno) | Variable que el experimentador **manipula** a propósito |
| **Nivel** | Cada categoría del factor (B1, B2) | Valores elegidos para el factor |
| **Error experimental** | Variabilidad dentro de cada grupo | Variación entre UE tratadas igual, estimada con réplicas |

En un **estudio observacional** (como el caso de las boquillas) solo podemos hablar de
**asociación**; en un **experimento** con aleatorización podemos hablar de **causa**.

---

### Para repasar

- Un laboratorio mide 3 veces cada una de 10 piezas. ¿Cuántas réplicas tiene? ¿Cuántas
  repeticiones?
- ¿Por qué la aleatorización respalda el supuesto de independencia?
- Da un ejemplo de tu organización donde estratificar podría revelar una causa asignable.

### Referencias

- Montgomery, D. C. y Runger, G. C. _Probabilidad y estadística aplicadas a la
  ingeniería_, cap. 1 y 6.
- Montgomery, D. C. _Design and Analysis of Experiments_, cap. 1.
