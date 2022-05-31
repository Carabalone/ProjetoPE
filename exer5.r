library(readxl)
library(ggplot2)
library(tidyr)

set.seed(1484)
n <- 689
dados <- data.frame(X = rexp(n, 0.5))


ggplot(dados) +
  geom_histogram(aes(x = X, y = ..density..), binwidth = 0.5,
                 fill = "lightblue", boundary = 0) +
  geom_function(fun = dexp, args = list(rate = 0.5),
                color = "magenta") +
  labs(title = "Geração de números aleatórios de Exp(0.5)") +
  theme_light()
ggplot(dados) +
  stat_ecdf(aes(X), color = "cornflowerblue") +
  geom_function(fun = pexp, args = list(rate = 0.5),
                color = "magenta") +
  labs(title = "Geração de números aleatórios de Exp(0.5)") +
  theme_light()
