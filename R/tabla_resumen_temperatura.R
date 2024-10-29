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
