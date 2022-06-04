library(readxl)
library(ggplot2)
library(tidyr)

set.seed(1484)
n <- 689
dados <- data.frame(X = rexp(n, 0.5))
maior_que <- 2

exp <- 1-ecdf(dados$X)(maior_que)
teo <- pexp(q=maior_que, rate=0.5, lower.tail = FALSE)
print(abs(exp-teo))
