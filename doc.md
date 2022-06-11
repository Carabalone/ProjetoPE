---
title: "Modelo de R Markdown"
author: "Guiherme Carabalone"
date: "`r format(Sys.Date(), '%d/%m/%Y')`"
output:
  html_document:
    theme: null
    highlight: pygments
---

```{r setup, include = FALSE}
knitr::opts_chunk$set(echo = TRUE, comment = '', out.width="50%", fig.align = 'center')

# carregar aqui os pacote do R que forem usados
library(ggplot2)
theme_set(theme_light(base_size = 16)) # mudar aqui o tema padrÃ£o do ggplot
```

```{css, echo = FALSE}
.section {column-count: 1; column-gap: 2em; column-fill: auto; page-break-after: always;}
body {font-size: 12px;}
div.sourceCode {margin: 0.2em 0;}
pre {padding: 2px; font-size: 95%; border: 1px solid #cacaca;}
p, ul, ol, pre {margin: 5px 0;}
pre.sourceCode {background-color: #f4f4f4; border: none;}
@media print {h1, .title, .author, .date {display: none;}}
```

# Pergunta 1

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown  see http://rmarkdown.rstudio.com

Example of an inline math expression $\frac{x^2}{\cos x}$ and a centered one:

$$\int_0^1 \sin x\, dx\stackrel{?}{=}\sum_{i=1}^{+\infty} \frac{e^i}{i!}$$

*Lists:*

* one
* two

1. one
2. two

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

# Pergunta 2

You can also embed plots, for example:

```{r, echo=FALSE}
ggplot(pressure) +
  geom_point(aes(temperature, pressure), color = "magenta")
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

# Pergunta 3

ResoluÃ§Ã£o da questÃ£o 3