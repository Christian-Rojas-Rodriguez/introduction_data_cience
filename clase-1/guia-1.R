#imports initials
library(tidyverse)

#read data with module
data <- read_csv('properati_SM_SPA.csv')
class(data)

#view data how table
view(data)
#view rows, columns and tittle < type < examples
glimpse(data)

#acces to feature
data["l4"]

#distinct

distinct(data["l4"])
distinct(select(data, l4))

count(data["l4"]) #error
count(data, l4)
count(data, tipo_propiedad)

#graphics 2 features
ggplot(data, aes(x=sup_cubierta, y=precio)) +
  geom_point() +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")

#graphics 3 features
ggplot(data, aes(x=sup_cubierta, y=precio, color=tipo_propiedad)) +
  geom_point() +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")

#graphics 2 features and line regress 
ggplot(data, aes(x=sup_cubierta, y=precio)) +
  geom_point() +
  geom_smooth(method='lm') +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")

#graphics 3 features and line regress 
ggplot(data, aes(x=sup_cubierta, y=precio, color=tipo_propiedad)) +
  geom_point() +
  geom_smooth(method='lm') +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")

#============================================

help("iris")

df_iris <- (iris)
view(df_iris)
glimpse(df_iris)
