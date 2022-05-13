library(readxl)
library(ggplot2)
library(tidyr)

data <- read_excel("./data/EsperancaVida.xlsx")

desired_columns <- c("Anos", "CY - Chipre", "HU - Hungria", "NL - Países Baixos")
# 2:35
data <- data[-c(1:3), -c(2:35)]
data <- Filter(function(x)!all(is.na(x)), data)
data[2,1] <- "Anos"
data[1, 2:35] <- "Homens"
data[1, 36:69] <- "Mulheres"

data <- data[, data[2,] %in% desired_columns]
data <- data[c(1, 2, 45:62),]
colnames(data) <- data[2,]
data <- data[-c(2),]

data_mulher <- data[,c(1, 5:7)]
data <- data[, -c(5:7)]

data <- pivot_longer(data, c("CY - Chipre", "HU - Hungria", "NL - Países Baixos"),
                     names_to = "país" ,values_to = "EsperancaVida")[-c(1:3),]
data_mulher <- pivot_longer(data_mulher, c("CY - Chipre", "HU - Hungria", "NL - Países Baixos"),
                            names_to = "país" ,values_to = "EsperancaVida")[-c(1:3),]

data_mulher$Sexo <- "Mulher"
data$Sexo <- "Homem"

data <- rbind(data,data_mulher)
data$EsperancaVida <- as.double(data$EsperancaVida)
round(data$EsperancaVida, digits=1)

ggplot(data, aes(x=Anos, y=EsperancaVida)) +
  geom_line(lwd=1.1,aes(group=interaction(país,Sexo),linetype=Sexo, colour=país))

