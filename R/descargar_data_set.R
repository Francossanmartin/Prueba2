#' Descargar Datos de Estaciones Meteorológicas
#'
#' La función `download_datasets` descarga datos de una estación meteorológica desde un repositorio en GitHub.
#' Se puede proporcionar el `id_station` o, si no se especifica, descargará datos de todas las estaciones disponibles.
#' Los archivos se almacenan en la carpeta `datasets-raw` por defecto, pero también se puede definir una ruta específica.
#'
#' @param id_station character. Identificador de la estación para descargar el archivo de datos. Si es `NULL`, se descargan todas las estaciones disponibles.
#' @param path character. Ruta completa para guardar el archivo CSV. Si es `NULL`, se guarda en la carpeta `datasets-raw/`.
#'
#' @return character. La ruta al archivo descargado.
#' @export
#' @examples
#' # Descargar datos para una estación específica
#' download_datasets(id_station = "NH0472")
#'
#' # Descargar datos para todas las estaciones
#' download_datasets()
#'
#' # Descargar datos para una estación y guardarlo en una ruta específica
#' download_datasets(id_station = "NH0472", path = "ruta/personalizada/NH0472.csv")
#'
download_datasets <- function(id_station = NULL, path = NULL) {
  all_stations <- c("NH0472", "NH0910", "NH0046", "NH0098", "NH0437", "metadatos_completos")
  
  if (is.null(id_station)) {
    lapply(all_stations, function(station) {
      download_datasets(id_station = station)
    })
    return(invisible())
  }
  
  if (!id_station %in% all_stations) {
    stop("Invalid station ID. Valid options are: ", paste(all_stations, collapse = ", "))
  }
  
  if (is.null(path)) {
    dir.create("datasets-raw", showWarnings = FALSE)
    path <- file.path("datasets-raw", paste0(id_station, ".csv"))
  } else {
    if (!dir.exists(dirname(path))) {
      stop("The specified directory does not exist.")
    }
  }
  
  url <- sprintf("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/%s.csv", id_station)
  tryCatch({
    download.file(url, path)
    message("File downloaded successfully to: ", path)
    return(path)
  },
  error = function(e) {
    stop("Download failed. Please check the station ID and your internet connection. Error: ",
         conditionMessage(e))
  })
}