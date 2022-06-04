library(readxl)
library(ggplot2)
library(tidyr)
library(HistogramTools)

seed <- 293
n_samples <- 1700
dim1 <- 2
dim2 <- 30
dim3 <- 95
a <- 14
b <- 18

set.seed(seed)

m1 <- c()
m2 <- c()
m3 <- c()

for (val in 1:n_samples){
  x1 <- runif(dim1, min=a, max=b)
  x2 <- runif(dim2, min=a, max=b)
  x3 <- runif(dim3, min=a, max=b)
  
  m1 <- c(m1, mean(x1))
  m2 <- c(m2, mean(x2))
  m3 <- c(m3, mean(x3))
}

var = ((b-a)^2)/12

n1 = dnorm(x1, mean=mean(m1), sd=sqrt(var/dim1))
n2 = dnorm(x2, mean=mean(m2), sd=sqrt(var/dim2))
n3 = dnorm(x3, mean=mean(m3), sd=sqrt(var/dim3))

df = data.frame(m1)
ggplot(df, aes(x=m1)) +
  geom_histogram(colour=1, fill= "light blue", aes(y=..density..), binwidth = 0.5) +
  geom_function(lwd = 0.8, fun = dnorm, args=list(mean=mean(m1), sd=sqrt(var/dim1)),color = "red")

df = data.frame(m2)
ggplot(df, aes(x=m2)) +
  geom_histogram(colour=1, fill= "light blue", aes(y=..density..), binwidth = 0.5) +
  geom_function(lwd = 0.8, fun = dnorm, args=list(mean=mean(m2), sd=sqrt(var/dim2)),color = "red")

df = data.frame(m3)
ggplot(df, aes(x=m3)) +
  geom_histogram(colour=1, fill= "light blue", aes(y=..density..), binwidth = 0.5) +
  geom_function(lwd = 0.8, fun = dnorm, args=list(mean=mean(m3), sd=sqrt(var/dim3)),color = "red")





