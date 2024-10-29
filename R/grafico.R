#' Grafico del Promedio Mensual de la Temperatura de Abrigo
#'
#' Esta función genera un gráfico de barras que muestra el promedio mensual de la temperatura de abrigo.
#'
#' @param datos data.frame que contiene las columnas `fecha` (en formato de fecha) y `temperatura_abrigo_150cm`.
#' @param titulo character. Título del gráfico. Por defecto es "Temperatura".
#'
#' @return Un objeto de tipo ggplot que muestra el promedio mensual de la temperatura de abrigo para los primeros 5 meses disponibles.
#' @import ggplot2
#' @examples
#' datos <- read.csv("ruta/al/archivo.csv")
#' grafico <- grafico_temperatura_mensual(datos)
#' print(grafico)
#' 
grafico_temperatura_mensual <- function(datos, titulo = "Temperatura") {
  library(ggplot2)
  
  datos$mes <- format(as.Date(datos$fecha), "%Y-%m")
  promedio_mensual <- head(promedio_mensual <- aggregate(temperatura_abrigo_150cm ~ mes, data = datos, FUN = mean, na.rm = TRUE), 5)
  
  ggplot(promedio_mensual, aes(x = mes, y = temperatura_abrigo_150cm)) +
    geom_bar(stat = "identity", fill = sample(colors(), 1)) +
    labs(title = titulo, x = "Mes", y = "Temperatura Promedio (°C)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# Ejemplo de uso de la función
datos <- read.csv("C:/Users/Usuario/Documents/Prueba2/data/NH0046.csv") # Reemplazar con el dataset deseado
print(grafico_temperatura_mensual(datos))
