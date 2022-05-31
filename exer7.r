library(readxl)
library(ggplot2)
library(tidyr)

seed <- 873
n_samples <- 8145
dim <- 9

set.seed(seed)

mean_sample <- c()

for (val in 1:n_samples){
  x <- rbinom(dim, 47, 0.39)
  mean <- mean(x)
  mean_sample <- c(mean_sample, mean)
}
mean_sample_mean <- mean(mean_sample)

expected_value <- 47*0.39

print(expected_value-mean_sample_mean)