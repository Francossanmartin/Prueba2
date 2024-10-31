#' Tabla Resumen de la Temperatura de Abrigo a 150 cm
#'
#' La función `tabla_resumen_temperatura` genera un resumen estadístico de la columna
#' `temperatura_abrigo_150cm` por cada estación (`id`).
#'
#' @param datos data.frame que contiene las columnas `temperatura_abrigo_150cm` y `id`.
#' @return Un data frame con los siguientes resúmenes por cada estación:
#'   \describe{
#'     \item{promedio}{El promedio de `temperatura_abrigo_150cm`.}
#'     \item{mediana}{La mediana de `temperatura_abrigo_150cm`.}
#'     \item{min}{El valor mínimo de `temperatura_abrigo_150cm`.}
#'     \item{max}{El valor máximo de `temperatura_abrigo_150cm`.}
#'     \item{desviacion_estandar}{La desviación estándar de `temperatura_abrigo_150cm`.}
#'   }
#' @export
#' @import dplyr
#' @examples
#' # Crear un ejemplo de data frame con los datos de temperatura
#' datos <- data.frame(
#'   id = c("Est1", "Est1", "Est2", "Est2"),
#'   temperatura_abrigo_150cm = c(25.3, 26.7, 24.5, 23.9)
#' )
#'
#' # Generar la tabla de resumen
#' resumen <- tabla_resumen_temperatura(datos)
#' print(resumen)
#'
tabla_resumen_temperatura <- function(datos) {
  library(dplyr)
  
  # Asegurarse de que los datos tengan la columna 'temperatura_abrigo_150cm' y 'estacion'
  if (!"temperatura_abrigo_150cm" %in% colnames(datos) || !"id" %in% colnames(datos)) {
    stop("Los datos no contienen las columnas necesarias 'temperatura_abrigo_150cm' o 'id'")
  }
  
  # Crear una tabla de resumen de la temperatura_abrigo_150cm
  resumen_temperatura <- datos %>%
    group_by(id) %>%
    summarize(
      promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      mediana = median(temperatura_abrigo_150cm, na.rm = TRUE),
      min = min(temperatura_abrigo_150cm, na.rm = TRUE),
      max = max(temperatura_abrigo_150cm, na.rm = TRUE),
      desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  
  return(resumen_temperatura)
}
