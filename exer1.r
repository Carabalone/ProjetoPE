library(readxl)
library(ggplot2)
library(tidyr)

data <- read_excel("./data/ResiduosPerCapita.xlsx")

desired_countries <- c("EE - Estónia", "AT - Áustria", "ES - Espanha")

names(data)[1] <- "país"
names(data)[2] <- "2004"
names(data)[3] <- "2018"

data <- data[data$país %in% desired_countries, ]
data <- subset(data, select = c("país", "2004", "2018"))
data <- pivot_longer(data, c('2004','2018'))
names(data)[2] <- "ano"
names(data)[3] <- "produção"

ggplot(data, aes(x=país, fill=ano, y=produção)) +
  geom_col(position = "dodge") +
  ggtitle("Produção de Resíduos per capita") +
  labs(x = "País", y = "Produção de Resíduos per capita")

