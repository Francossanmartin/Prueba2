
# Definir la función
#' Title
#'
#' @param url 
#' @param usar_readr 
#' @import readr
#' @return
#' @export
#'
#' @examples
leer_datos_desde_url <- function(url, usar_readr = FALSE) {
  url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv"
  datos <- read_csv(url)
  if (usar_readr) {
    datos <- read_csv(url)
  } else {
    datos <- read.csv(url)
  }
  return(datos)
}
