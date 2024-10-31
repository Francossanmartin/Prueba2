#' Leer Datos de las Estaciones Meteorológicas
#'
#' La función `read_datasets` lee datos de una estación meteorológica desde un archivo CSV.
#' Se puede proporcionar el `id_station` o la `path` del archivo. Si no se especifica una
#' ruta, se utilizará una ruta predeterminada en la carpeta `datasets-raw/`.
#'
#' @param id_station character. Identificador de la estación para generar la ruta del archivo de datos (opcional si se especifica `path`).
#' @param path character. Ruta completa al archivo CSV que contiene los datos (opcional si se especifica `id_station`).
#'
#' @return Un data frame con los datos de la estación. Si se especifica `id_station`, los datos se asignan también a una variable con ese nombre en el entorno padre.
#' @export
#' @examples
#' # Leer datos usando el ID de la estación
#' data <- read_datasets(id_station = "NH0472")
#'
#' # Leer datos desde una ruta específica
#' data <- read_datasets(path = "datasets-raw/NH0472.csv")
#'
#' # Error si no se especifica ni 'id_station' ni 'path'
#' # data <- read_datasets()
#'
read_datasets <- function(id_station = NULL, path = NULL) {
  
  if (is.null(path)) {
    if (is.null(id_station)) {
      stop("Either 'id_station' or 'path' must be provided.")
    }
  }
  
  if (is.null(path)) {
    path <- file.path("datasets-raw", paste0(id_station, ".csv"))
  }
  
  if (file.exists(path)) {
    data <- read.csv(path)
    
    if (!is.null(id_station)) {
      assign(id_station, data, envir = parent.frame())
    }
    
    return(data)
  } else {
    stop("The file or path doesn't exist. Please check again; you only need to enter one argument.")
  }
}