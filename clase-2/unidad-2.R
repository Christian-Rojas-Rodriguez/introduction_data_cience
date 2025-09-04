library(tidyverse)

titanic_df <- read_csv("titanic.csv", locale = locale(decimal_mark = ","))

#general information
glimpse(titanic_df)

#type of column
spec(titanic_df)

