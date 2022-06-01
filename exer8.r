library(readxl)
library(ggplot2)
library(tidyr)

seed <- 307
n_samples <- 600
dim <- 1171

set.seed(seed)

amplitude_sample <- c()
teste <- c()
for (val in 1:n_samples){
  x <- rexp(dim, 7.6)
  mean <- mean
  teste <- c(teste, x)
  
  len = length(x)
  stddev = sd(x)
  stderr = stddev/sqrt(len)
  
  alpha = 0.03
  
  degrees.freedom = len - 1
  t.score = qt(p=alpha/2, df=degrees.freedom,lower.tail=F)
  
  marginerror <- t.score * stderr
  lowerbound <- mean - marginerror
  upperbound <- mean + marginerror
  
  amplitude = (upperbound - lowerbound)
  amplitude_sample <- c(amplitude_sample, amplitude)
}
print(mean(amplitude_sample))
print("outro")
model <- lm(as.list(teste) ~ 1)
b <- confint(model, level=0.97)
print(b)


