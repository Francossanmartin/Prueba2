
#' Descargar y Leer Datos de una Estación
#'
#' Esta función descarga un archivo CSV correspondiente a una estación específica y lo carga como un data frame en R.
#'
#' @param id_estacion Un string que indica el ID de la estación a descargar. Los IDs válidos son:
#'   \itemize{
#'     \item "NH0472"
#'     \item "NH0910"
#'     \item "NH0046"
#'     \item "NH0098"
#'     \item "NH0437"
#'   }
#' @param ruta_archivo Un string con la ruta donde se guardará el archivo CSV descargado.
#'
#' @return Un data frame con los datos de la estación especificada.
#'
#' @details Los datos de cada estación se descargan desde URLs fijas y se guardan en la ruta especificada.
#'   La función luego lee el archivo CSV y devuelve el contenido como un data frame.
#'
#' @examples
#' \dontrun{
#' # Descargar datos de la estación NH0472 y guardarlos en "datos/NH0472.csv"
#' datos <- descargar_leer_datos_estacion("NH0472", "datos/NH0472.csv")
#' }
#'
#' @export
descargar_leer_datos_estacion <- function(id_estacion, ruta_archivo) {
  estaciones_urls <- list(
    NH0472 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    NH0910 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    NH0046 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    NH0098 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    NH0437 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )
  
  url_base <- estaciones_urls[[id_estacion]]
  
  download.file(url_base, ruta_archivo)
  
  datos_estacion <- read.csv(ruta_archivo)
  
  return(datos_estacion)
}
