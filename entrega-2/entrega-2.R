library(tidyverse)

#============================================
# DATOS
#============================================
library(nycflights13)

?flights

data <- flights
#============================================

glimpse(data)

# 1 y 2 =====================================
nrow(data) #filas
length(data) #columnas
#============================================

# 3 =========================================
colnames(data)
#============================================

# 4 =========================================
flights['carrier']
select(flights, carrier)
flights$carrier
#============================================

# 5 =========================================
unique(flights['carrier'])
#============================================

# 6 =========================================
filter(count(group_by(data, carrier)), n > 1000)

df <- data %>% 
  count(carrier) %>%  
  filter(n > 1000)

print(df)
#============================================

# 7 =========================================
df <- data %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>%
  filter(dest == "LAX") %>%
  count(carrier)

print(df)
#============================================

# 8 y 9 =========================================
df <- data %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>%
  filter(dest == "LAX")
  

print(df)

ggplot(data=df, aes(x=carrier, y=dep_delay)) +
  geom_jitter(width = 0.25, alpha = 0.4, color = "steelblue") +
  geom_boxplot(alpha = 0.6, outlier.shape = NA, fill = "lightblue") +
  coord_cartesian(ylim = c(-30, 800)) +
  labs(
    title = "Distribucion del Retraso en Salidas de Vuelos a LAX",
    subtitle = "Para aerolineas con mas de 1000 vuelos en 2013",
    x = "Aerolinea",
    y = "Retraso en la Salida (min)"
    ) +
  theme_minimal()
#============================================

# 10 ============================================
metrics <- df %>% 
  group_by(carrier) %>% 
  summarise(
    mediana = median(dep_delay, na.rm = TRUE),
    dispersion_iqr = IQR(dep_delay, na.rm = TRUE),
    percentil_90 = quantile(dep_delay, 0.90, na.rm = TRUE)
    ) %>%
  arrange(mediana)

print(metrics)
#============================================

# 11 ============================================
top_2 <- data %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>%
  filter(dest == "LAX") %>%
  group_by(carrier) %>%
  summarise(max_dep_delay = max(dep_delay, na.rm = TRUE)) %>%
  arrange(max_dep_delay) %>%
  slice(1:2) %>%
  pull(carrier)

df <- data %>%
  filter(carrier %in% top_2 & dest == "LAX")
  
print(df)

ggplot(data=df, aes(x=arr_delay, fill=carrier)) +
  geom_histogram(position = "identity", alpha = 0.7, bins = 40) +
  labs(
    title = "Histograma de Retrasos en Llegada a LAX",
    subtitle = "Comparando las 2 aerolíneas con menor retraso maximo en salida",
    x = "Retraso en la Llegada (min)",
    y = "Frecuencia (Cant de Vuelos)",
    fill = "Aerolinea"
  ) +
  theme_minimal()
#============================================

# 14===========================================
top_2 <- data %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>%
  filter(dest == "LAX") %>%
  group_by(carrier) %>%
  summarise(max_dep_delay = max(dep_delay, na.rm = TRUE)) %>%
  arrange(max_dep_delay) %>%
  slice(1:2) %>%
  pull(carrier)

df <- data %>%
  filter(carrier %in% top_2 & dest == "LAX")

print(df)

ggplot(data=df, aes(x=arr_delay, fill=carrier)) +
  geom_density(alpha = 0.6) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 1) +
  coord_cartesian(xlim = c(-75, 150)) +
  labs(
    title = "Grafico de Densidad del de Retrasos en Llegada a LAX",
    subtitle = "Comparando las 2 aerolíneas con menor retraso maximo en salida",
    x = "Retraso en la Llegada (min)",
    y = "Densidad",
    fill = "Aerolinea"
  ) +
  theme_minimal()
#============================================