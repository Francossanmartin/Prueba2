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