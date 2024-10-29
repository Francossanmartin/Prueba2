analizar_estacion <- function(data, estacion_id) {
  # Filtrar los datos de la estación
  data_estacion <- data %>% filter(id == estacion_id)
  
  # Graficar la temperatura de abrigo y sumar una regresión lineal
  grafico_temperatura <- ggplot(data_estacion, aes(x = fecha, y = temperatura_abrigo_150cm)) +
    geom_point(color = "#69b3a2") +
    geom_smooth(method = "lm", col = "#e76f51", se = FALSE, linetype = "dashed") +
    labs(title = paste("Temperatura de abrigo en la estación", estacion_id),
         x = "Fecha",
         y = "Temperatura (°C)") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))
  
  print(grafico_temperatura)
  
  # Promedio mensual de la temperatura de abrigo para cada estación y gráfico del resultado
  data <- data %>% mutate(mes = floor_date(fecha, "month"))
  promedio_mensual <- data %>%
    group_by(id, mes) %>%
    summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE))
  
  grafico_promedio_mensual <- ggplot(promedio_mensual, aes(x = mes, y = temperatura_media, color = id)) +
    geom_line(size = 1.5) +
    geom_point(size = 2) +
    labs(title = "Promedio mensual de la temperatura de abrigo por estación",
         x = "Mes",
         y = "Temperatura media (°C)") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
          axis.title = element_text(size = 14),
          legend.title = element_text(face = "bold"),
          legend.position = "bottom")
  
  print(grafico_promedio_mensual)
  
  # Relación entre la temperatura de abrigo y la humedad
  grafico_relacion <- ggplot(data, aes(x = temperatura_abrigo_150cm, y = humedad_media_8_14_20)) +
    geom_point(color = "#2a9d8f", alpha = 0.6) +
    geom_smooth(method = "lm", col = "#264653", se = FALSE, linetype = "dotted") +
    labs(title = "Relación entre temperatura de abrigo y humedad",
         x = "Temperatura de abrigo a 150 cm (°C)",
         y = "Humedad media 8-14-20 (%)") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
          axis.title = element_text(size = 14),
          axis.text = element_text(size = 12))
  
  print(grafico_relacion)
}
library(dplyr)
library(ggplot2)
library(lubridate)


# Llamar a la función para analizar una estación específica, por ejemplo NH0437
analizar_estacion(data_estaciones, "NH0437")
