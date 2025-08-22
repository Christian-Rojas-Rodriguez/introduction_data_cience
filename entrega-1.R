# --- 1. Carga de Datos y Librerías ---
print("cargando datos y librerias...")
datos <- read.csv("insurance.csv")
library(ggplot2)
library(dplyr)

# --- 2. Gráficos de Barras ---
print("generando: grafico de barras - conteo de fumadores...")
ggsave("barras_conteo_fumadores.png", ggplot(datos, aes(x=smoker, fill=smoker)) +
  geom_bar() + labs(title="grafico de barras: conteo de fumadores") + theme(legend.position="none"))

print("generando: grafico de barras - conteo por region...")
ggsave("barras_conteo_region.png", ggplot(datos, aes(x=region, fill=region)) +
  geom_bar() + labs(title="grafico de barras: conteo por region") + theme(legend.position="none"))

print("generando: grafico de barras - fumadores por region...")
fumadores_por_region <- datos %>% filter(smoker == "yes") %>% count(region)
ggsave("barras_fumadores_por_region.png", ggplot(fumadores_por_region, aes(x=region, y=n, fill=region)) +
  geom_col() + labs(title="grafico de barras: fumadores por region") + theme(legend.position="none"))

print("generando: grafico de barras - proporcion de fumadores por region...")
ggsave("barras_proporcion_fumadores.png", ggplot(datos, aes(x=region, fill=smoker)) +
  geom_bar(position="fill") + labs(title="grafico de barras: proporcion de fumadores por region", y="proporcion") +
  scale_y_continuous(labels=scales::percent))

# --- 3. Gráficos de Dispersión ---
print("generando: grafico de dispersion - edad vs costos...")
ggsave("dispersion_edad_vs_costos.png", ggplot(datos, aes(x=age, y=charges)) +
  geom_point(color="dodgerblue", alpha=0.6) +
  labs(title="grafico de dispersion: edad vs costos"))

print("generando: grafico de dispersion - edad vs costos por fumador...")
ggsave("dispersion_edad_vs_costos_por_fumador.png", ggplot(datos, aes(x=age, y=charges, color=smoker)) +
  geom_point(alpha=0.7) +
  labs(title="grafico de dispersion: edad vs costos por habito de fumar"))

print("--- proceso completado. ---")