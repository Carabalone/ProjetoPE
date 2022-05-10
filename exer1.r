library(readxl)
library(ggplot2)

data <- read_excel("./data/ResiduosPerCapita.xlsx")

desired_countries <- list("EE - Estonia", "AT - Austria", "ES - Espanha")

names(data)[1] <- "pais"
subset(data, exists(pais, desired_countries))
desired_countries
