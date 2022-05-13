library(readxl)
library(ggplot2)
library(tidyr)

data <- read_excel("./data/QualidadeARO3.xlsx")

stations <- c("Ihavo", "Paio-Pires")

data <- subset(data, select=stations)
data <- pivot_longer(data, stations, names_to = "estacao", values_to = "ozono")
data$ozono <- as.numeric(data$ozono)
ggplot(data, aes(x=ozono, fill = estacao, colour=estacao)) + 
  geom_histogram(aes(y=..density..), binwidth = 1)

