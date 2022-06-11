library(readxl)
library(ggplot2)
library(tidyr)

seed <- 307
n_samples <- 600
dim <- 1171
lambda <- 7.6
alpha <- 0.03

set.seed(seed)

amplitude_sample <- c()
for (val in 1:n_samples){
  x <- rexp(dim, lambda)
  sample_mean = mean(x)
  stddev = sd(x)
  margin = qt(1-(alpha/2), df=dim-1)*stddev/sqrt(dim)
  upper = sample_mean+margin
  lower = sample_mean-margin
  amplitude = abs(upper-lower)
  amplitude_sample <- c(amplitude_sample, amplitude)
}
print(mean(amplitude_sample))