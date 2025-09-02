# Guia 1: Introducción a R y RStudio
#install.packages(c("ggplot2", "dplyr", "tidyr", "readr", "shiny"))

# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)
  
df <- read_csv('properati_SM_SPA.csv')

#View(df)
#print(glimpse(df))

print(count(distinct(df, l4)))

print(
ggplot(df, aes(x=sup_cubierta, y=precio, color=tipo_propiedad)) +
geom_point() +
geom_smooth(method='lm') +
xlab("Superficie cubierta [m2]") +
ylab("Precio [USD]")
)