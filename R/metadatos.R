url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv"
datos <- read.csv(url)

library(readr)
url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv"
datos <- read_csv(url)

# Definir la función
leer_datos_desde_url <- function(url, usar_readr = FALSE) {
  if (usar_readr) {
    library(readr)
    datos <- read_csv(url)
  } else {
    datos <- read.csv(url)
  }
  return(datos)
}

# Uso de la función con read.csv
url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv"
datos <- leer_datos_desde_url(url)

# O con read_csv de readr
datos <- leer_datos_desde_url(url, usar_readr = TRUE)
