
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