setwd('/home/smoke-data/projects/icd')

#we need the package to execute next lines
install.packages('tidyverse')

local_lib_path <- file.path(getwd(), "R_libs")
.libPaths(c(local_lib_path, .libPaths()))
install.packages("tidyverse", lib = local_lib_path, repos = "http://cran.rstudio.com/")


library(tidyverse)
df<-read_csv('properati_SM_SPA.csv')

